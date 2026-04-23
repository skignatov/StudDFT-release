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
1. Download StudDFT.zip from `/windows_x64` to your local disk and unzip. You will have directory like `c:\StudDFT` with programs inside. 
   Do not put it to the secured Windows directories like "Program Files" etc.
2. Assuming you have the folder `c:\StudDFT` , enter it and open the batch-file sd.bat with any ASCII text editor (far, wordpad, notepad ...)
   Check that the variable STUDDFT points to your sirectory:

      set STUDDFT=c:\StudDFT

   (the directory `/basis_data` should be present in this location, e.g. c:\StudDFT\basis_data).

3. Correct the OMP variables for your runs: 

      set OMP_NUM_THREADS=6  	<-- set number of cores on your processor
      set OMP_STACKSIZE=128M    <-- set reasonable OMP stack size (32M, 64M, 128M ...)

5. Save corrected sd.bat and copy it to your working directory where your input files are stored. Alternatively, put it to any folder indicated in the PATH system variable.

6. Run program from your working directory with the input file `yourfile.inp` using the command:

    sd yourfile.inp

7. After successful run the output file `yourfile.log` will be created.


## Documentation
See `docs/` for short manual.
See `examples/` for example inputs.
