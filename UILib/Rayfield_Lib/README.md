# Rayfield UI Library with Panda Key System

A modified version of the Rayfield UI Library that integrates the Panda Key System for enhanced authentication and security.

## 🚀 Booting the Library

This library loads the Rayfield UI Library with Panda Key System embedded, providing a seamless authentication experience for your scripts.

### Loading the Rayfield Library

```lua
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Panda-Repositories/PandaKS_Libraries/refs/heads/main/UILib/Rayfield_Lib/Source.lua'))()
```

## 📖 Usage

Here's how to create a window with the integrated key system:

```lua
local Window = Rayfield:CreateWindow({
   Name = "My Script",
   KeySystem = true,
   KeySettings = {
      Title = "My Script Auth",
      Subtitle = "Pelinda Key System",
      Note = "Get your key below",
      FileName = "MyScript",
      SaveKey = true,
      GrabKeyFromSite = true,
      ServiceID = "pandadevkit",
      Client_HWID = gethwid(), -- Or you can use a custom version of Client's HWID
   }
})
```

### Key System Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `Title` | string | The title displayed on the key authentication window |
| `Subtitle` | string | Subtitle text for the authentication window |
| `Note` | string | Additional note or instruction for users |
| `FileName` | string | Name used for saving the key locally |
| `SaveKey` | boolean | Whether to save the key for future sessions |
| `GrabKeyFromSite` | boolean | Enable automatic key retrieval from the service |
| `ServiceID` | string | Your service identifier for the Panda Key System |
| `Client_HWID` | string | Hardware ID for client identification |

## ✨ Features

- **Integrated Authentication**: Seamless key system integration with Rayfield UI
- **Community Requested**: Developed based on community feedback and requirements
- **Enhanced Security**: Hardware ID-based authentication
- **Key Persistence**: Option to save keys for future sessions
- **Automatic Key Retrieval**: Built-in key fetching from the Panda service

## 🔧 Modifications

This library includes the following modifications to the original Rayfield UI:

- **Window Usage Enhancement**: Modified `CreateWindow` function to implement Panda Key System
- **Authentication Integration**: Embedded key verification process
- **Community-Driven Features**: Added requested functionality from the community

## 📚 Original Documentation

This UI Library is based on the original Rayfield UI Library developed by **Siris Software LTD**.

- **Original Documentation**: [https://docs.sirius.menu/rayfield](https://docs.sirius.menu/rayfield)
- **Original Repository**: [https://github.com/SiriusSoftwareLtd](https://github.com/SiriusSoftwareLtd)

## 🤝 Credits

- **Original Library**: Siris Software LTD
- **Modifications**: Panda Repositories Team
- **Key System Integration**: Panda Key System

## 📄 License

This modified version maintains compatibility with the original Rayfield UI Library while adding enhanced authentication features through the Panda Key System.

---

*Developed and maintained by the Panda Repositories team as requested by the community.*
