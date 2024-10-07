# Zorro project template for VSCode

An ideal starting point of a C++ [Zorro](https://zorro-project.com/) project with VSCode (Visual Studio Code). You can edit and compile directly from the VSCode IDE, therefore

* you can build as huge software as you want even with a complex structure without messing up the strategy folder,
* you don't need to squeeze your files to Zorro's standard folders, and
* you can version control your entire project independently from your other strategies.

The result DLL file will be automatically copied to your Zorro's strategy folder, then you can run that script immediately.

> [!NOTE]
> This template was made for VSCode. If you need a template for Visual Studio (as the Zorro manual suggests), have a look at the [szabonorbert/zorro-project-template](https://github.com/szabonorbert/zorro-project-template) repository.</b>

## Dependencies and best practices

### MSVC

This project's compile script is based on Zorro's original compile bat files to avoid unnecessary headaches, so we also use VC++. You can install the Visual Studio Community Edition as the Zorro manual suggests, but to use with VSCode, you don't need the whole Visual Studio IDE but the VC++ build dependencies, which you can easily install with the official instructions:  
[Install the Microsoft Visual C++ (MSVC) compiler toolset](https://code.visualstudio.com/docs/cpp/config-msvc#_prerequisites)

### C++ with IntelliSense VSCode extension

It's not required, but recommended to use C++ language support for your IDE.

### Zorro's custom strategy folder

It's also not required, but I recommend you create a custom strategy folder where you can keep all your scripts separately from the standard Zorro sample projects. You can do this simply by defining the strategy folder in ```ZorroFix.ini```:
```
StrategyFolder = "myStrategy"
```
<https://zorro-project.com/manual/en/ini.htm>

## Setup

It's important to review the settings in the ```.vscode\settings.json``` file.

* ```zorroFolder```: the install location of Zorro.
* ```strategyFolder```: your strategy folder inside the Zorro folder.
* ```type_64_if_x64```: if you want to use Zorro, keep it blank. If you want to use Zorro64, fill this with ```64```.
* ```compilerExe```: the path to any ```cl.exe```, it' i's needed for IntelliSense to check your code errors on the fly.
* ```msvcBuildPath```: the route to the MSVC build folder.

If you are not sure, you can get the ```compilerExe``` and the ```msvcBuildPath``` easily from the [developer console](https://code.visualstudio.com/docs/cpp/config-msvc#_check-your-microsoft-visual-c-installation).

```
where cl
```
```
dir vcvars64.bat /S
```

Remember that in ```.vscode\settings.json``` you need to use double backslashes in the folder names.

> [!TIP]
> I prefer Zorro64 because of the memory and speed increase. So when you compile with the basic settings of this repository, <b>your result filename will be ```[foldername]64.dll```, and you can run it only with Zorro64</b>. The filename needs to end with ```...64.dll``` to be able to be run by Zorro64. If you want to use the regular Zorro (without 64), you need to use the x86 compiler, so ```type_64_if_x64``` should be empty.

> [!TIP]
> I recommend you to restart VSCode after you changed these settings.

### Other settings

In the ```c_cpp_properties.json``` you can define more include paths, but in this case you also need to edit the ```build.bat``` file.

## Build

Press <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>b</kbd> to build your Zorro strategy. It automatically copies the result dll file to the Zorro strategy folder; the filename will be the ```[foldername].dll``` or ```[foldername]64.dll``` based on the build method.