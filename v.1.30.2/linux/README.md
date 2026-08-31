# StudDFT

Scientific-educational quantum chemistry program implementing HF, DFT, and MP2
Linux (Ubuntu 22) version, compiled with gfortran v.11, static build with OpenLAPACK/OpenBlas, OpenMP parallelism

## Features
- RHF/UHF, RKS/UKS, MP2/UMP2/PUMP2 calculations
- LDA, GGA, hybrid GGA, RS-GGA, and meta-GGA functionals (SVWN, BLYP, BP86, BPW91, PBE, B3LYP, PBE0, WB97X, WB97XD, r2SCAN)
- Cartesian and spherical basis sets with optional ECPs
- SP energy, geometry optimization, frequency calculations, PES scanning
- Analytical energy gradients and Hessians
- Energy level smearing for better SCF convergence
- RI-DFT, TD-DFT, CDFT, RT-TDDFT, Ehrenfest MD (FullEdition)
Full features list see in `StudDFT_Short_Manual_<version>.pdf`

## Start calculations (Linux)

1. Download StudDFT archive from github to your current directory. In your browser, click on tar.gz file to get inside and then click the button 'Download raw file'. 
   From the linux console, you can use wget (or curl) command with 'raw github address':

    `wget https://github.com/skignatov/StudDFT-release/raw/refs/heads/main/v.1.29.8/linux/studdft_v1_30_2-FE-openblas_static.tar.gz`

2.  Untar the archive to the specified `existing` directory (e.g. to /home/student):

    `tar -xzvf studdft_v1_30_2-FE_openblas_static.tar.gz -C /home/student`

     The directory /home/student/studdft_v1_29_8-FE_openblas_static will appear. 
     You can rename it to the shorter name if you wish:

    `mv /home/student/studdft_v1_30_2-FE_openblas_static  /home/student/studdft`

3. Go to the new directory and add the execute permissions for two files: studdft (the program executable itself) and sdft (the running script):

   `cd /home/student/studdft`

   `chmod +x studdft`

   `chmod +x sdft`   

4. Open your .bashrc with any text editor and add two lines (after the line with your current PATH):

   `export STUDDFT=/home/student/studdft`

   `export PATH=$STUDDFT:$PATH`

   Actualize your .bashrc to make the new variables in action:
   
   `source ./.bashrc`

5. Go to your work directory (e.g. /home/student/work) and run calculations with your input file, say, h2o.inp (you can copy the sample file h2o.inp from this site):

   `sdft h2o.inp`

   After successful run the output files `h2o.log`, `h2o.hess`, `h2o.molden` will appear in your work directory.
   If you have Molden or Avogadro software on your system, you can visualize the optimized geometry and vibrational frequencies saved in the `h2o.molden` file.


6. If needed, you may edit `sdft` file with any ASCII text editor to correct the OMP variables for your computer: 

      `set OMP_NUM_THREADS=4`       <-- set number of cores on your processor (1, 2, 4, 8...) (set to 4 by default)

      `set OMP_STACKSIZE=64M`       <-- set reasonable OMP stack size (32M, 64M, 128M ...)

## Documentation
See `StudDFT_Short_Manual_<version>.pdf` for the keyword list of StudDFT.
See `../docs/` for additional documentation.
See `../examples/` for sample inputs.
Download and unpack `tests` to check the test results for 50+ molecules with various methods.

