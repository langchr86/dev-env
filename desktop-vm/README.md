Desktop-VM
==========

Diese VM ist auf Desktop-Betrieb über die Virtualbox-Visualisierung ausgelegt
und erlaubt auf möglichst einfache Art die Verwendung der Entwicklungsumgebung.

Die Generierung ist fast vollständig automatisiert.
Der Komplette Vorgang wird folgend beschrieben.


Erzeugung mittels Vagrant und Ansible
-------------------------------------

Siehe: [](../headless-vm/README.md)

* generate with vagrant
* maybe manually do shutdown and `vagrant up --provision` if it hangs
* start up with GUI

If problems with DHCP arises:

~~~
VBoxManage list dhcpservers
// and delete old ones with:
VBoxManage dhcpserver remove --netname "HostInterfaceNetworking-vboxnet0"
~~~


Projekt und IDE vorbereiten
---------------------------

* checkout workspace repo in `~/prcpp`: `git clone git@gitlab.fhnw.ch:prcpp/students/workspace.git`
* remove folders: `cd ~/prcpp/workspace && rm -rf folien arbeitsblaetter admin`

* checkout dev-env repo in `~/prcpp`: `git clone git@gitlab.fhnw.ch:prcpp/students/dev-env.git`

* open clion
* select evaluation licence
* open `workspace` project in clion
* let clion update itself
* setup clion settings
  * enable toolbar: `View` -> `Appearance` -> `Toolbar`
  * enable font zooming: `Editor` -> `General` -> `Change font size (Zoom) with Ctrl+mouse wheel`
  * disable code folding for C/C++ and General: `Editor` -> `General` -> `Code Folding`
  * add hotkey for cmake update: Ctrl+F10
  * change header guard to use `#pragma once`: `Editor` -> `File and Code Templates` -> `Files` -> `C Header File` and `C++ Class Header` -> change to `#[[#pragma]]# once`
  * remove author description file template: `Editor` -> `File and Code Templates` -> `Includes` -> `C File Header` -> clear whole text field
* setup clion project settings
  * add `All` cmake target
  * add `RelWithDebInfo` configuration
  * add jobs option: `-j 2`
  * disable automatic git staging: `Version control` -> `Confirmation` -> `When files are created` -> `Do not add`
* setup clion to use project settings that are commited:
  * code style
  * disable adding files to CMakeLists.txt (add one new file and de-select `Add to targets`

* close all files
* select `All` target
* revert all made changes


Abschliessen
------------

* shutdown VM
* remove existing shared folders
* export as appliance OVA 2.0: `prcpp-desktop.ova`
* split up file into smaller ones and deploy to AD and USB sticks
