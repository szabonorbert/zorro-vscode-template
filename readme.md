
# Zorro VSCode template
An ideal starting point of a C++ Zorro project with VSCode (Visual Studio Code).<br />

> [!NOTE]
> This template was made for VSCode. If you need a template for Visual Studio (as the manual suggests), have a look at the [szabonorbert/zorro-project-template](https://github.com/szabonorbert/zorro-project-template) repository.</b>

## What is Zorro?
>Zorro is a free institutional-grade software tool for data collection, financial research, and algorithmic trading with C / C++.  It's compact, portable, easy to learn, and magnitudes faster than R or Python. It does anything that automated trading platforms do - only better. Zorro offers extreme flexibility and features otherwise not found in consumer trading software. Any data analysis, visualization, or algo trading system can be realized with a small C or C++ script. R and Python machine learning libraries are also supported. _–_ <https://zorro-project.com/>

## C++, Zorro and VSCode
Zorro's native language is "lite-C", however the built-in functions are totally compatible with C and C++ as expected. In the Zorro Help you can find a tutorial about setting up a project in Visual Studio and/or it's compiler for making Zorro scripts: [Developing Algo Trading Systems in C++](https://zorro-project.com/manual/en/dlls.htm).

I made this sample project to kickstart your development; therefore, you don't need to do all the setup procedures every time you start to work on something new. I used the compiler script that Zorro shipped with; if you want to make more complex compilations like extended linker objectives, you need to manipulate the compiler batch located in the Zorro folder in ```Source\VC++\compile.bat``` and ```Source\VC++\compile64.bat```.

The Zorro compile batch scripts are using the Visual Studio C++ compiler, so that's a dependency you also need, even if you don't want to use the Visual Studio IDE. The easiest way is to download the Visual Studio Community Edition and the C++ extensions, as the manual suggests. Then you can start using VSCode with this template.

## About this Solution

This is a Hello World application of a Zorro program which you can edit and compile from VSCode. Therefore

* you can build as huge software as you want even with a complex structure without messing up the strategy folder,
* you don't need to squeeze your files to Zorro's standard folders, and
* you can version control your entire project independently from your other strategies.

The result DLL file will be automatically copied to your Zorro's strategy folder, then you can run that script immediately.

## Zorro's custom strategy folder

It's [recommended](https://zorro-project.com/manual/en/ini.htm) to create a custom strategy folder where you can keep all your scripts separately from the standard Zorro sample projects. You can do this simply by define the strategy folder in the `ZorroFix.ini` file of the root folder like this:
```
StrategyFolder = "myStrategy"
```

## Solution config

... soon

## Details

... soon