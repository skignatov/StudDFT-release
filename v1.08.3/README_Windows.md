# StudDFT

Scientific-educational quantum chemistry program implementing HF and DFT
(RHF/RKS/UHF/UKS) with ECP support, analytical gradients, and
Hessians. Written in Fortran 2008, built with Intel Fortran.
Parallelization with OpenMP. Current build is StudDFT.exe, release x64 for Win7/10/11
See manual \StudDFT\docs\StudDFT_MANUAL.md for input file format and further detail.

## Features
- RHF/UHF, RKS/UKS, MP2/UMP2/PUMP2 calculations
- LDA and GGA functionals (SVWN, BLYP, BP86, BPW91, PBE, B3LYP, PBE0)
- Cartesian and spherical basis sets with optional ECPs
- SP energy, geometry optimization, frequency calculations, PES scanning
- Analytical energy gradients and Hessians
- RI-DFT, TD-DFT, CDFT

## Start calculations (Windows)

1. Click on the file `StudDFT_v1_08_3_win64.zip` to get inside and push the button `Downoad raw file` on the right. 
   Place the file to your local disk and unzip it. 
   You will have directory like `c:\StudDFT` on your computer with programs inside. 
   Do not put this directory to the secured Windows folders like "Program Files", folders with cyrillic symbols in their names etc.

2. Run `set_user_environment.bat` to set up PATH and STUDDFT environment variables for current user
  (you also can set them up manually with the directory name where the program residues. Probably, new terminal/window should be started to find the changes)

3. If needed, open sd.bat with any ASCII text editor (Far, Notepad, WordPad, ...) and correct the OMP variables for your computer: 

      set OMP_NUM_THREADS=4       <-- set number of cores on your processor

      set OMP_STACKSIZE=64M       <-- set reasonable OMP stack size (32M, 64M, 128M ...)

5. Go to your working directory (with your input file `your_molecule.inp` ) and run the program:

    sd yourfile.inp

   After successful run the output file `your_molecule.log` will appear.

## Documentation
See `Short Manual_v_1_08_3.pdf` for the keyword list of StudDFT.
See `../docs/` for additional documentation.
See `../examples/` for sample inputs.
Download and unpack `tests` to check the test results for 50+ molecules with various methods.

NOTE: StudDFT cersion 0.82.1 corresponds to the article: 
S.K. Ignatov "StudDFT: A compact quantum chemistry program for educational and scientific purposes" Zhurn.Fiz.Khimii, (accepted in June, 2026)
It is placed here for the compatibility with the above paper.
The version 1.08.3 is the newer version having much more capabilities. 

