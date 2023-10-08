# KernelSUDebloater
Debloat Apps Under KernelSU Using OverlayFS (Inspired by the Systemless Debloater Module by zgfg &amp; ipdev on XDA)

which is found here: https://xdaforums.com/t/magisk-module-systemless-debloater.4180083/

---

This is a quick and dirty proof of concept app debloater, which i may or may not add the app listing ability like zgfg's/ipdevs module to.

This was a late night POC script and i already had a SystemlessDebloater.cfg, so no reason to go too deep on it at the time....and im lazy

I have long used the Magisk Systemless Debloater by XDA's **@zgfg** and **@ipdev**

But occaisonally i like to play with KernelSU which does things a little differently...it uses OverlayFS, whereas the Systemless Debloater Magisk Module uses bind, and is therefore not compatible with KernelSU

Because im lazy i like to use one config file where possible, so im reusing my SystemlessDebloater.cfg from that magisk module, and is stored under Download (i.e. `/sdcard/Download/SystemlessDebloater.cfg`)

## Intallation: 

### Preparation

- Youve used the SystemlessDebloater Magisk Module before:

  - Copy your `SystemlessDebloater.cfg` to `/sdcard/Download/` like normal

- Youve never used the SystemlessDebloater Magisk Module before:
  - Create your own `SystemlessDebloater.cfg` from scratch by adding app names to a text file 

    (Use Notepad++ if on Windows and set EOL Conversion to Unix)

  - The file might contain for example:

      ```Aperture
      ApertureLensLauncher
      AudioFX
      DeskClock
      Eleven
      Etar
      Gallery2
      Jelly
      MaestroPrebuilt
      MusicFX
      Phonograph
      Symphonica
      YouTube
      YouTubeMusicPrebuilt
      ```

- Copy the file to `/sdcard/Download/`

### Module Installation

- Install the module from [Releases] (/releases/latest)
- Reboot
- Reboot a second time as on the first Reboot, `post-mount.fs` runs to create the blank overlays, but it doesnt apply them in real time

Apart from the usual module install log, a log of the process in the script function in customize.sh is output to `/sdcard/KernelSUDebloat.txt`

---

### Debloating New/Additonal Apps:

- Edit `/sdcard/Download/SystemlessDebloater.cfg`


---

#### App "Recovery":

To recover a single, or multiple app(s):

- Uninstall the module
- Reboot
(All debloated apps are restored)
- Edit the `/sdcard/Download/SystemlessDebloater.cfg` to remove the wanted apps
- Install the module again
- Reboot
- Reboot a second time as on the first Reboot, `post-mount.fs` runs to create the blank overlays, but it doesnt apply them in real time

---

#### Uninstall:

The modules effects are fully reversible....

Temporarily - 

- Toggle module off (for a temp rebloat - `post-mount.sh` (active script that does the work) is NOT called when disabled)
- Reboot

  Note: Of course to re-Debloat again just enable the module and Reboot

OR

Permanently -

- Uninstall it and reboot to return to permanent bloaty goodness
- Reboot

---

### Project Stats ###

![GitHub release (latest by date)](https://img.shields.io/github/v/release/adrianmmiller/KernelSUDebloater?label=Release&style=plastic)
![GitHub Release Date](https://img.shields.io/github/release-date/adrianmmiller/KernelSUDebloater?label=Release%20Date&style=plastic)
![GitHub Releases](https://img.shields.io/github/downloads/adrianmmiller/KernelSUDebloater/latest/total?label=Downloads%20%28Latest%20Release%29&style=plastic)
![GitHub All Releases](https://img.shields.io/github/downloads/adrianmmiller/KernelSUDebloater/total?label=Total%20Downloads%20%28All%20Releases%29&style=plastic)
