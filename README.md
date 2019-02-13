Automated Developer VM Setup
============================

To simplify and automate the bring-up of a developer machine with all tools
etc. we use automated VM generation with Vagrant. This works similar to
docker. For the provisioning step we use ansible playbooks.

The VM is based on the following specs:

* Based on ubuntu-server version
* Hypervisor is always virtualbox
* We use Putty and VcXsrv for ssh connection and X11-Forwarding



Basic setup
===========

To start working with this automated VM we must setup basic tools on our host
windows machine.


## Virtualbox

We use virtualbox 5 as hypervisor.

[VirtualBox 5.2 Downloads](https://www.virtualbox.org/wiki/Download_Old_Builds_5_2)


## Powershell 3.0

If you are working under Windows 7 you need to upgrade powershell to version 3.0

[Windows Management Framework 3.0](https://www.microsoft.com/en-us/download/details.aspx?id=34595)

See more information
[here](https://blogs.technet.microsoft.com/heyscriptingguy/2013/06/02/weekend-scripter-install-powershell-3-0-on-windows-7/)


## git for Windows

To use this whole repo and have a nice shell/console to work with vagrant we use
git for windows. You can also use some other like cygwin or Powershell directly.

[gitforwindows.org](https://gitforwindows.org/)

Some points to note:

* Use pageant/putty as authorization service because this integrates beautiful
  into the usually existing putty infrastructure.
* Usually you should clone the repos with ssh. Most of the time you have to
  make an initial connection try to the server with the putty client directly.
  This allows you to accept the hash of the remote host. After this initial
  connection try you can clone the repo.


## Vagrant

Vagrant is our VM automation system. Download and install it.

[vagrantup.com](https://www.vagrantup.com/)

After that we use some vagrant plugins to manage some special parts of the
VM. Install them via console:

~~~
vagrant plugin install vagrant-disksize
~~~


## Putty

Install putty as usual and setup pageant for use with your private key.

We use puttygen.exe to generate public/private keys if not already available.

~~~
-> Key -> Generate key pair (SSH-2 RSA Key)
~~~

Then use export function to generate OpenSSH compatible file for private key.

~~~
-> Conversions -> OpenSSH key
~~~

Use pageant.exe to provide keys under Windows. To automatically load
pageant make a soft link in the autostart folder and add the following to it:

~~~
"C:\Program Files (x86)\Putty\PAGEANT.EXE" "c:\...\xxx.ppk"
~~~


## X11-forwarding

Install putty as usual and setup pageant for use with your private key and
enable X1-Forwarding:

* SSH -> X11 -> Enable X11 forwarding
* SSH -> Auth -> Allow agent forwarding

If you have some speed issues with X11 forwarding change the following in putty:

* SSH -> Enable compression
* SSH -> Cipher -> `Arcfour`

We use [VcXsrv](https://sourceforge.net/projects/vcxsrv/) as X11-Server
under Windows.

Add a link to the server with the following options in windows startup:

~~~
"C:\Program Files\VcXsrv\vcxsrv.exe" :0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl
~~~



How to use the VM
=================

After we installed all prerequisites on Windows we can build the VM up.
For the whole process we need the console and afterwards
putty and pageant to connect to the VM.


## Customize VM per user

The predefined VM needs some individual customization to work correctly.
Please ensure that these changes should not be commit but only kept locally.

* playbock.yml: Change GIT credentials.
* playbock.yml: Add your own public key file in list.
* Vagrantfile: Change Disksize
* Vagrantfile: Change RAM/CPUs


## Build the VM

Now open the preferred console in Windows and use the following vagrant
commands:

| Command                 | Explanation                                                                        |
|-------------------------|------------------------------------------------------------------------------------|
|`vagrant up`             |Startup a not running/existing VM. If not existing do also create and provision it. |
|`vagrant halt`           |Stop running VM.                                                                    |
|`vagrant destroy`        |Completely remove the VM and all its corresponding virtual hard drives.             |
|`vagrant up --provision` |Enforce the provisioning while starting up an existing VM.                          |
|`vagrant provision`      |Start provisioning to a running VM.                                                 |

In this step the VM is configured, initialized with the base box image (ubuntu)
and afterwards provisioned. The provisioning step is in our case managed by
ansible. Ansible is installed by Vagrant.


## VM tuning by hand

Some things you may want to tune by hand via the virtualbox GUI after the
initial creation.

* Change HDD mode to SSD for each used virtual disk.
* Change used RAM/CPUs
* Change forwarded port for SSH. Default is 2222.


## Use the VM

To use the VM you have to only setup a usefull putty config that points to
`127.0.0.1:2222` and does allow X11 and authentication agent forwarding.


## Facts

* Shared folder if you start with vagrant is `/vagrant`.
* Custom shared folder for ansible scripts is `/ansible`.
* All defined public keys are deployed to VM.
* User and password is always: `vagrant`

