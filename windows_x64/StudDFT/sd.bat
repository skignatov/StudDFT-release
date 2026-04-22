@echo off

rem --- Place this BAT-file to yout work directory (where your *.inp files are located) or, optionally, to the directory included into PATH variable
rem --- Edit variable STUDDFT below (and OpenMP setting if needed)
rem --- To tun StudDFT: 

rem          sd <yourfile>.inp


rem --- Path to StudDFT root (where \basis_data and \windows live)
set STUDDFT=D:\Projects\StudDFT\StudDFT-release

rem --- OpenMP settings
set OMP_NUM_THREADS=6
set OMP_STACKSIZE=128M

rem --- Add StudDFT executable directory to PATH
set PATH=%STUDDFT%\windows;%PATH%

rem --- Run; log goes next to the input file
StudDft %1 >%~n1.log
