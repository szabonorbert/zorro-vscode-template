# Zorro project template for VSCode

An ideal starting point of a C++ [Zorro](https://zorro-project.com/) project with VSCode (Visual Studio Code). You can edit and compile directly from the VSCode IDE, therefore

* you can build as huge software as you want even with a complex structure without messing up the strategy folder,
* you don't need to squeeze your files to Zorro's standard folders, and
* you can version control your entire project independently from your other strategies.

The result DLL file will be automatically copied to your Zorro's strategy folder, then you can run that script immediately.

> [!NOTE]
> This template was made for VSCode. If you need a template for Visual Studio (as the Zorro manual suggests), have a look at the [szabonorbert/zorro-project-template](https://github.com/szabonorbert/zorro-project-template) repository.</b>

## Zorro, C++, and VSCode
Zorro's native language is "lite-C", however the built-in functions are totally compatible with C and C++ as expected. In the Zorro Help you can find a tutorial about setting up a project in Visual Studio and/or it's compiler for making Zorro scripts: [Developing Algo Trading Systems in C++](https://zorro-project.com/manual/en/dlls.htm).

I made this sample project to kickstart your development; therefore, you don't need to do all the setup procedures everytime you start working on something new. I used the compiler script that Zorro shipped with; if you want to make more complex compilations like extended linker objectives, you need to edit the compiler batch located in the Zorro folder in ```Source\VC++\compile.bat``` and ```Source\VC++\compile64.bat```.

## Dependencies

### MSVC

The Zorro compile batch scripts are using Microsoft's C++ compiler, so you need that, even if you don't want to use the Visual Studio IDE. You can get MSVC by installing the Visual Studio Community Edition and the C++ extensions, as the Zorro manual suggests. Or alternatively you can download only the build dependencies from Microsoft.

### C++ with IntelliSense VSCode extension

It's not required, but recommended to use C++ language support for you IDE.

Step-by-step instructions for installing only the build dependencies and the recommended VSCode extension: [Configure VS Code for Microsoft C++](https://code.visualstudio.com/docs/cpp/config-msvc).

## Zorro's custom strategy folder

I recommend you to create a custom strategy folder where you can keep all your scripts separately from the standard Zorro sample projects. You can do this simply by define the strategy folder in ```ZorroFix.ini```:
```
StrategyFolder = "myStrategy"
```
<https://zorro-project.com/manual/en/ini.htm>

## Setup

It's important to review the settings in the ```.vscode\settings.json``` file.

### settings.json

* ```zorroFolder```: The install location of Zorro
* ```strategyFolder```: You strategy folder inside the Zorro folder
* ```compilerPath```: the path to ```cl.exe```, it is needed for IntelliSense to check your code errors
* ```msvcBuildPath``` the route to the MSVC Build folder, usually it's ```C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Auxiliary\\Build```

I recommend you to restart VSCode after you changed these settings.

#### Other settings

The ```tasks.json``` is only important if you want to change the default build task from x86 to x64. In the ```c_cpp_properties.json``` you can define more include paths, but if you change it, you also need to edit the Zorro's build batch files.

## Build

Press <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>b</kbd> to build your Zorro strategy. It automatically copies the result dll file to the Zorro strategy folder; the filename will be the working directory's name. If you compile with the x64 task, you will see that DLL filenames end with "64" because it's necessary for running with Zorro64.