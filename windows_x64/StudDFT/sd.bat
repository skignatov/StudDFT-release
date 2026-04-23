@echo off

rem ##############################################################
rem --- Place this BAT-file to yout work directory (where your *.inp files are located) 
rem --- or, optionally, place sd.bat to the directory included into PATH variable
rem --- Edit variable STUDDFT below (and OpenMP setting if needed)

rem --- Run StudDFT by the command: 

rem          sd <yourfile>.inp

rem ##############################################################


rem --- Path to StudDFT root (where \basis_data lives)
set STUDDFT=c:\StudDFT

rem --- OpenMP settings
set OMP_NUM_THREADS=4
set OMP_STACKSIZE=64M

rem --- Add StudDFT executable directory to PATH
set PATH=%STUDDFT%;%PATH%

rem --- Run; log goes next to the input file
StudDft %1 >%~n1.log
