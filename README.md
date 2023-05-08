1. **fortran_mpi.tar.gz**: This is just the same normal openmpi but in addition with gcc and g++, it is compiled and linked with gfortran. This allows you to
compile fortran-based MPI applications with mpi's fotran compiler toolchain. I have already compiled it so you can just run to unpack it:

    ```tar xf fortran_mpi.tar.gz```
  
    - if you are curious on how to compile openmpi with fortran, the key is to just make sure you have gfortran:
  
      ```sudo apt-get install gfortran```
    
      and then when you run configure on openmpi, make sure to include ""CC=gcc CXX=g++ FC=gfortran""
      
2. Next you should get hpl 2.3. Any previous versions will probably not work because they will use deprecated openmpi functions

      ```
        wget http://www.netlib.org/benchmark/hpl/hpl-2.3.tar.gz
        tar xzvf hpl-2.3.tar.gz
        cd hpl-2.3
      ```
3. Generate a new config file for unknown architecture using the make_generic script. Rename it to Make.rpi for consistency.

      ```
        sh setup/make_generic
        mv setup/Make.UNKNOWN ./Make.rpi
      ```
4. Now you have to create your own make file. Try to fill it out, and use mine as a reference if you are stuck. Once ready you should be able to compile hpl with:

      ```make arch=rpi```

Don't forget to leave a comment, drop a like, and subsribe
