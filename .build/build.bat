@echo off
setlocal

:: 1: VC++ folder path e.g. "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build"
:: 2: Zorro's main folder path e.g. "C:\Zorro"
:: 3: Zorro's startegy folder name e.g. "myStrategy"
:: 4: 32 / 64 e.g. "64"

echo - %~1
echo - %~2
echo - %~3
echo - %~4

::
:::::::: Preparations
::

:: define the script name & all the vars used in cl command

for %%A in ("%CD%") do (
    set "scriptname=%%~nA"
)
if "%~4"=="64" (
    set "scriptname=%scriptname%64.dll"
) else (
    set "scriptname=%scriptname%.dll"
)

set "impFile=%CD%\.build\cache\Imp.lib"
set "logFile=%CD%\.build\compiler.log"
set "mainFile=%CD%\main.cpp"
set "zorroDLL=%~2\Source\VC++\ZorroDLL.cpp"
set "outFile=%~2\%~3\%scriptname%"

:: ModifyPath function at the end of this script is not working as expected
:: so need to modify it one-by-one to force the paths compatible with cl.exe
:: (cl.exe is forcing to evaluates the input strings, so the backslashes are treated as special characters)

:: Switch every accidental input slash "/" to backslash "\"

set "impFile=%impFile:/=\%"
set "logFile=%logFile:/=\%"
set "mainFile=%mainFile:/=\%"
set "zorroDLL=%zorroDLL:/=\%"
set "outFile=%outFile:/=\%"

:: Delete outfile or accidental directories

set "outFile=%outFile:\\=\%"
@del /q "%outFile%"
@rmdir /q "%outFile%"

:: Switch every backslash "\" to double backslash "\\" to make it compatible with cl.exe

set "impFile=%impFile:\=\\%"
set "logFile=%logFile:\=\\%"
set "mainFile=%mainFile:\=\\%"
set "zorroDLL=%zorroDLL:\=\\%"
set "outFile=%outFile:\=\\%"

::
:::::::: Compile
::

:: prepare the compiler

if "%~4"=="64" (
    @call "%~1\vcvars64.bat"
) else (
    @call "%~1\vcvars32.bat"
)

:: add some extra include paths

@set "INCLUDE=%INCLUDE%;%CD%;%~2\include"

:: compile the script

if "%~4"=="64" (
    cl /Fo"%cacheFolder%" /EHsc /fp:strict /Zc:wchar_t /Gd /MT /O2 /D "_WINDLL" /D "_MBCS" "%mainFile%" "%zorroDLL%" /link /DLL /NOLOGO /MACHINE:X64 /IMPLIB:"%impFile%" /OUT:"%outFile%" > %logFile%
) else (
    echo "build 32"
)

endlocal

::
:::::::: Functions
::

:: --- THIS FUNCTION IS NOT WORKING AS EXPECTED
:: --- IF YOU ECHO THE VALUES IT LOOKS GOOD, BUT CL.EXE MAKES FOLDERS INSTED OF FILES
:: --- THEREFORE THE LINKER CAN NOT FINISH ITS WORK
:: modify the folder paths to make them compatible with cl.exe
:: ~1: variable name
:: ~2: variable value
:ModifyPath
set "tmp=%~2"
set "tmp=%tmp:/=\%"
set "tmp=%tmp:\=\\%"
set "%~1=%tmp%"
goto :eof