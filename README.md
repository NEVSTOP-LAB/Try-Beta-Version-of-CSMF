# Try Beta Version of CSMF

[中文](./README.md) | [English](./README(en).md)

这个工具用于快速获取并安装 CSM Framework（CSMF）的测试版相关包。

>[!NOTE]
> **在 Windows 上，本工具会通过 VIPM API 自动安装 CSM Framework 测试版（请先将 VIPM 激活为 Community / Pro 版本）。**

>[!IMPORTANT]
> **在 Linux/macOS 上，本工具只会将包下载到本地目录，不会自动安装，你需要手动完成安装。**

>[!NOTE]
> **本工具还会通过 `code --install-extension` 安装 CSM 的 VS Code 支持扩展 `csm-vsc-support`。Windows 使用 `vsc_installPackages.bat`，Linux/macOS 使用 `vsc_installPackages.sh`。请确保 VS Code CLI (`code`) 已加入 PATH。**

## 入口位置

安装后可在 LabVIEW 菜单中找到：

`Tools >> Communicable State Machine(CSM) >> Try Beta Version of CSM...`

![image](https://github.com/user-attachments/assets/8fc6f42d-ca64-4b1a-88d7-cd91deb63e4f)

## 自定义安装包列表

你可以编辑 `CSMF Package List.txt`，以自动安装最新公开发布的 NEVSTOP-LAB 库，例如：

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
