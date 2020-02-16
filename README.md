Entwicklungs-Umgebung
=====================

Um in einer einheitlichen Entwicklungsumgebung arbeiten zu können
verwenden wir eine virtuelle Maschine (VM).
In dieser verwenden wir folgende Grundkonzepte:

* CLion als IDE
* `cmake` als Build-System
* Google C++ Code Style


Vorteile einer Entwicklungs-VM
------------------------------

* einheitliche Umgebung
* auf jedem Host-System (Windows, Linux, OSX) lauffähig
* vorinstallierte Libraries und Tools: `catch2`, `CLion`, `valgrind`, etc.
* vorinstallierte git-Tools: `gitk`, `git-gui` und andere Erweiterungen
* VM kann bei Defekt einfach zerstört und neu eingerichtet werden


Google C++ Code Style
---------------------

* [Google C++ Style Guide](https://google.github.io/styleguide/cppguide.html)
* Wird automatisch durch Build-System überprüft: [`cpplint`](https://github.com/cpplint/cpplint)
* Zudem forcierte Warnings
* Automatisierter Lerneffekt



Einrichtung der VM
==================

Für die Studenten existiert eine vorgenerierte Desktop-VM,
welche direkt verwendet werden kann.
Die VM selber ist bereits generiert
und muss nur noch in Virtualbox importiert werden.

Das Archiv-File der VM finden Sie auf dem AD oder auf dem verteilten USB-Stick.


Virtualbox
----------

Wir verwenden Virtualbox as Hypervisor für die VM.
[VirtualBox Downloads](https://www.virtualbox.org/wiki/Downloads)

Nach der Installation können Sie die heruntergeladene VM als Appliance importieren.

Unter den VM-Einstellungen finden Sie den Punkt `Serielle Schnittestellen`.
Passen Sie dort den Pfad zu einem existierenden Ordner an,
wo das Debug-Log der VM gespeichert werden kann.


Rechen-Performance der VM
-------------------------

Damit die VM beinahe native Rechen-Leistung erreicht (wichtig für diverse Aufgaben),
sollten Sie sicherstellen, dass Ihr Rechner alle benötigten Virtualisierungs-Technologien
aktiviert hat. Diese finden Sie in den BIOS/UEFI-Einstellungen ihres PCs.

Unter Intel-CPUs aktivieren Sie: `VT-x` und `VT-d`

Unter AMD-CPUs aktivieren Sie: `AMD-V` und `AMD-Vi`

Sollten trotzdem Probleme mit der VM auftretten,
stellen Sie sicher, dass KVM als Paravirtualisierung in Virtualbox eingestellt ist.


VM Tuning (optional)
---------

Bei Bedarf können Teilaspekte der VM auch nachträglich über das Virtualbox GUI
angepasst werden. Dazu muss die VM gestoppt sein.

* HDD Modus der virtuellen Disks auf SSD stellen.
* RAM/CPUs anpassen


Verwendung der Desktop-VM
=========================

Starten Sie die VM direkt in Virtualbox und verwenden Sie die Desktop-Oberfläche.
Nutzername und Passwort sind: `vagrant:vagrant`.

Das Arbeits-Repository ist innerhalb der VM bereits vorbereitet unter: `~/prcpp/workspace`.
Sie können dieses mit CLion öffnen und direkt darin arbeiten.
Tipp: Es kann praktisch sein, Commits während dem Lösen von Aufgaben/Testaten zu machen.


Arbeiten mit CLion
------------------

Für CLion und alle anderen JetBrains Produkte erhalten sie unter
[www.jetbrains.com/student/](https://www.jetbrains.com/student/) eine gratis
Lizenz. Starten Sie CLion mittels `clion&` über die Konsole und richten Sie
diesen ein. Verwenden Sie die Standard-Toolchain.

| Shortcut               | Explanation                      |
|---                     |---                               |
| `Ctrl` + `Alt` + `l`   | Automatische Formatierung        |
| `Ctrl` + `F10`         | Reload CMake                     |
| `Ctrl` + `F9`          | Build                            |
| `Shift` + `F9`         | Run                              |
| `Alt` + `F7`           | Find usage                       |
| `Shift`, `Shift`       | Intelligente Suche               |
| `Ctrl` + `Alt` + `s`   | Settings                         |
| `Ctrl` + `Shift` + `f` | Search all                       |
| `Ctrl` + `Shift` + `r` | Search & Replace all             |

[CLion Reference Card](https://resources.jetbrains.com/storage/products/clion/docs/CLion_ReferenceCard.pdf)

Unittest-Framework:

* [catch2](https://github.com/catchorg/Catch2)
* [blog.jetbrains.com/clion/2017/03/to-catch-a-clion/](https://blog.jetbrains.com/clion/2017/03/to-catch-a-clion/)


Weitere verfügbare Tools
------------------------

* `git gui` (git Commit Helper)
* `gitk` (git Tree Viewer)
* `valgrind` (Memory Analyzer)
* `nano` (Console Editor)
* `tmux` (Shell Multiplexer)
* `okular` (PDF Viewer)


Austauschen von Dateien zwischen VM und Host
--------------------------------------------


### Variante Copy-Paste

Öffnen Sie die entsprechende Datei und kopieren Sie den Inhalt mittels
`Ctrl-A` und `Ctrl-C`. Fügen Sie den Inhalt nun am Zielort in eine
neue Datei ein.

Achtung: Unter Linux führt das Markieren von Text meist direkt zu einer Kopie dieses
in der Zwischenablage. Wenn Sie also vom Host in die VM kopieren möchten,
sollten Sie in der VM keinen Text bereits markiert haben und auch keinen vor dem
Einfügen markieren.


### Variante SMB-Share

Die Desktop-VM hat bereits einen eingerichten Samba-Dienst,
welcher ein SMB-Share für das Home-Verzeichnis des `vagrant`-Users zur Verfügung stellt.
Dieses Share können Sie in Windows direkt verwenden.

* Öffnen Sie den Dialog für Netzwerk-Laufwerke mittels `Win` + `R` und:

  ~~~~~~
  RUNDLL32 SHELL32.DLL,SHHelpShortcuts_RunDLL Connect
  ~~~~~~

* Wählen Sie einen zu verwendenden Laufwerkbuchstaben
* Als Pfad für den Ordner verwenden Sie: `\\prcpp-desktop\vagrant-home`
* Wählen Sie zudem: `Verbindung bei Anmeldung wiederherstellen` und `Verbindung mit anderen Anmeldeinformationen herstellen`
* Im nächsten Dialog nutzen Sie als User/Passwort: `vagrant:vagrant` und wählen Sie `Anmeldedaten speichern`
