# StudDFT

Scientific-educational quantum chemistry program implementing HF and DFT
(RHF/RKS/UHF/UKS) with ECP support, analytical gradients, and
Hessians. Written in Fortran 2008, built with Intel Fortran.
Parallelization with OpenMP. Current build is StudDFT.exe, release x64 for Win7/10/11
See manual \StudDFT\docs\StudDFT_MANUAL.md for input file format and further detail.

## Features
- RHF / RKS / UHF / UKS with optional ECPs
- Obara-Saika and McMurchie-Davidson integral recurrences
- Analytical energy gradients and Hessians
- Geometry optimization, frequency analysis
- LDA and GGA functionals (SVWN, BLYP, B3LYP, PBE, BP86, ...)

## Start calculations (Windows)

1. Click on the file `StudDFT_win_x64.zip` to get inside and push the button `Downoad raw file` on the right. 
   Place the file to your local disk and unzip it. 
   You will have directory like `c:\StudDFT` on your computer with programs inside. 
   Do not put this directory to the secured Windows folders like "Program Files", folders with cyrillic symbols in their names etc.

2. Run `set_user_environment.bat` to set up PATH and STUDDFT environment variables for current user
  (you also can set them up manually with the directory name where the program residues. Probably, new terminal/window should be started to find the changes)

3. If needed, open sd.bat with any ASCII text editor (Far, Notepad, WordPad, ...) and correct the OMP variables for your computer: 

      set OMP_NUM_THREADS=4       <-- set number of cores on your processor

      set OMP_STACKSIZE=64M       <-- set reasonable OMP stack size (32M, 64M, 128M ...)

5. Go to your working directory (with your input file `yourfile.inp` ) and run the program:

    sd yourfile.inp

   After successful run the output file `yourfile.log` will appear.


## Documentation
See `docs/` for short manual.
See `examples/` for example inputs.

