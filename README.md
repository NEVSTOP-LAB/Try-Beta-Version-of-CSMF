>[!NOTE]
> **On Windows, this tool installs the beta version of CSM framework automatically via VIPM API (activate VIPM to community/pro version firstly). (Windows Only)**

>[!IMPORTANT]
> **On Linux/macOS, this tool only downloads packages to a local folder and does NOT install them — you need to install them manually.**

>[!NOTE]
> **This tool also installs the CSM VS Code support extension (`csm-vsc-support`) via `code --install-extension`. Supported on Windows (`vsc_installPackages.bat`), Linux and macOS (`vsc_installPackages.sh`). Make sure VS Code CLI (`code`) is available in your PATH.**

Add Menu: `Tools >> Communicable State Machine(CSM) >> Try Beta Version of CSM...`
![image](https://github.com/user-attachments/assets/8fc6f42d-ca64-4b1a-88d7-cd91deb63e4f)

You can edit `CSMF Package List.txt` to install all latest public NEVSTOP-LAB libraries automatically. e.g.

```
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
