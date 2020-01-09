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
* start up with GUI


Projekt und IDE vorbereiten
---------------------------

* checkout workspace repo in `~/prcpp`: `git clone git@gitlab.fhnw.ch:prcpp/students/workspace.git`
* remove folders: `cd ~/prcpp/workspace && rm -rf folien arbeitsblaetter`

* open project in clion
* setup clion settings
  * enable toolbar: `View` -> `Appearance` -> `Toolbar`
  * enable font zooming: `Editor` -> `General` -> `Change font size (Zoom) with Ctrl+mouse wheel`
  * disable code folding for C/C++ and General: `Editor` -> `General` -> `Code Folding`
  * add hotkey for cmake update: Ctrl+F10
* setup clion project settings
  * add `All` cmake target
  * add `RelWithDebInfo` configuration
  * add jobs option: `-j 2`
  * disable automatic git staging: `Version control` -> `Confirmation` -> `When files are created` -> `Do not add`
* setup clion project settings that are commited:
  * code style
  * disable adding files to CMakeLists.txt


Abschliessen
------------

* shutdown VM
* remove existing shared folders
* disable active serial interfaces (not working afterwords??)
* export as appliance OVA 2.0: `prcpp-desktop.ova`
* deploy file to AD and USB sticks
