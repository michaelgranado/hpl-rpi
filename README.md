### UCSD IEEE Supercomputing Club Workshop: Compiling & Running HPL on a Raspberry Pi Cluster


1. **fortran_mpi.tar.gz**: This is just the same normal openmpi but in addition with gcc and g++, it is compiled and linked with gfortran. This allows you to
compile fortran-based MPI applications with mpi's fortran compiler toolchain. I have already compiled it so you can just run to unpack it and replace the old openmpi. Maybe keep the old one just in case as well:

      ```
        tar xvf fortran_mpi.tar.gz
        mv ~/openmpi ~/old_openmpi
        mv fortran_mpi ~/openmpi
      ```
  
    - **This is not needed, you can move to Step 2** but if you are curious on how to compile openmpi with fortran, the key is to just make sure you have gfortran:
  
      ```sudo apt-get install gfortran```
    
      and then when you run configure on openmpi, make sure to include ""CC=gcc CXX=g++ FC=gfortran""
      
2. Next you should get hpl 2.3. Any previous versions will probably not work because they will use deprecated openmpi functions

      ```
        wget http://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz
        tar xvf hpl-2.3.tar.gz
        cd hpl-2.3
      ```
3. Next you need the atlas linear algebra package and gfortran

      ```
        sudo apt-get install libatlas-base-dev gfortran
      ```
3. Generate a new config file for unknown architecture using the make_generic script. Rename it to Make.rpi for consistency.

      ```
        cd setup
        source make_generic
        cp Make.UNKNOWN ../Make.rpi
        cd ..
        vim Make.rpi
      ```
4. Now you have to create your own make file. Try to fill it out, and use mine as a reference if you are stuck. Once ready you should be able to compile hpl with:

      ```make arch=rpi```

Your executable will be in ```/home/pi/hpl-rpi/hpl-2.3/bin/rpi/```

5. Move my HPL.dat file into ```/home/pi/hpl-rpi/hpl-2.3/bin/rpi/```. Set Ps * Qs == Number of Pis * 4 and such that Ps <= Qs.

      ```
         cd /home/pi/hpl-rpi/hpl-2.3/bin/rpi/
         cp /home/pi/hpl-rpi/example_HPL.dat HPL.dat 
      ```
