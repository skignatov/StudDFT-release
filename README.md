# StudDFT

Scientific-educational quantum chemistry program implementing HF and DFT
(RHF/RKS/UHF/UKS) with ECP support, analytical gradients, and
Hessians. Written in Fortran 2008, built with Intel Fortran.
Parallelization with OpenMP.
Current build is StudDFT.exe, release x64 for Win7/10/11

## Features
- RHF / RKS / UHF / UKS with optional ECPs
- Obara-Saika and McMurchie-Davidson integral recurrences
- Analytical energy gradients and Hessians
- Geometry optimization, frequency analysis
- LDA and GGA functionals (SVWN, BLYP, B3LYP, PBE, BP86, ...)

## Setting Up (Windows)
Download directory tree (at least `/basis_data` and `/windows`) with all their content to you location.
Place `sd.bat` to your working directory and edit it as described inside.

## Run program (Windows)
    sd <yourfile>.inp

See `examples/` for example inputs.

## Documentation
See `docs/` for short manual.
