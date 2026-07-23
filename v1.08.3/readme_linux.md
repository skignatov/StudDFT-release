*** StudDFT installation and run on linux (appropriate kernel 22.04+, glibc 2.35+) ***

1. Copy archive studdft_linux_portable_v.1.08.3.tar.gz to your LINUX system (use only BINARY transfer mode if you transfer the archive between Windows and Linux!)

2. Untar it to any convenient dir, e.g. to home/student/studdft :

         `tar -xzvf studdft_linux_portable_v.1.08.3.tar.gz -C /home/student/studdft`

3. Add path to this place to your PATH:

         `export PATH=/home/student/studdft:$PATH'

   (To make this path permanent, add this line to the end of your .bashrc and run the command:  `source ./.bashrc`) 

4. For better perfromance, you can edit the file `/home/student/studdft/sdft` (as described inside it) to set the correct number of cpu/cores

5. Go to dir with your tasks (e.g. `h2o.inp`) and run:
  
         `sdft h2o.inp`

   or (for background calculation)

         sdft h2o.inp &

6. Inspect the output file `h2o.log` for calculation results.