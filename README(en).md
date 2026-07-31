# Try Beta Version of CSMF

[中文](./README.md) | [English](./README(en).md)

This tool helps you quickly download and install beta packages related to the CSM Framework (CSMF).

>[!NOTE]
> **On Windows, this tool installs the beta version of the CSM framework automatically through the VIPM API. Please activate VIPM as Community / Pro first.**

>[!IMPORTANT]
> **On Linux/macOS, this tool only downloads packages to a local folder and does not install them automatically. You need to install them manually.**

>[!NOTE]
> **This tool also installs the CSM VS Code support extension `csm-vsc-support` through `code --install-extension`. It uses `vsc_installPackages.bat` on Windows and `vsc_installPackages.sh` on Linux/macOS. Make sure the VS Code CLI (`code`) is available in your PATH.**

## Menu Entry

After installation, the LabVIEW menu entry is:

`Tools >> Communicable State Machine(CSM) >> Try Beta Version of CSM...`

![image](https://github.com/user-attachments/assets/8fc6f42d-ca64-4b1a-88d7-cd91deb63e4f)

## Customize the Package List

You can edit `CSMF Package List.txt` to automatically install the latest public NEVSTOP-LAB libraries, for example:

```text
Communicable-State-Machine
CSM-API-String-Arguments-Support
CSM-MassData-Parameter-Support
CSM-INI-Static-Variable-Support
CSM-Continuous-Meausrement-and-Logging
CSM-TCP-Router-App
CSM-Mermaid-Plugin
NEVSTOP-LAB-Palette
NEVSTOP-3rdParty-Dependencies
NEVSTOP-Programming-Palette
LabVIEW-TagDB
LabVIEW-TagDB-RefMgr
...
```
