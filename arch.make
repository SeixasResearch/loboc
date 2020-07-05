# 
# Copyright (C) 1996-2016	The SIESTA group
#  This file is distributed under the terms of the
#  GNU General Public License: see COPYING in the top directory
#  or http://www.gnu.org/copyleft/gpl.txt.
# See Docs/Contributors.txt for a list of contributors.
#
#-------------------------------------------------------------------
# arch.make file for gfortran compiler.
# To use this arch.make file you should rename it to
#   arch.make
# or make a sym-link.
# For an explanation of the flags see DOCUMENTED-TEMPLATE.make

.SUFFIXES:
.SUFFIXES: .f .F .o .c .a .f90 .F90

SIESTA_ARCH = grc 

CC = mpicc
FPP = $(FC) -E -P
FC = mpiifort
FC_SERIAL = ifort

FFLAGS =  -fPIC -O2 -xHost -g -traceback -ftz -fp-speculation=safe -fp-model source

AR = ar
RANLIB = ranlib

SYS = nag

SP_KIND = 4
DP_KIND = 8
KINDS = $(SP_KIND) $(DP_KIND)

LDFLAGS = -O2 -xHost -g -traceback -ftz -fp-speculation=safe -fp-model source \
          -L/sw/apps/intel19/compilers_and_libraries_2019.4.243/linux/compiler/lib/intel64_lin \
          -L/sw/apps/intel19/compilers_and_libraries_2019.4.243/linux/mkl/lib/intel64_lin
#-L/opt/apps/util/easybuild/software/icc/2018.3.222-GCC-7.3.0-2.30/lib/intel64
#-L/opt/apps/util/easybuild/software/imkl/2018.3.222-iimpi-2018b/lib
#-L/opt/apps/util/easybuild/software/imkl/2018.3.222-iimpi-2018b/mkl/lib/intel64
#-L/opt/apps/util/easybuild/software/netCDF-Fortran/4.4.4-intel-2018b/lib

COMP_LIBS =  
NETCDF_LIBS = 
NETCDF_INCLUDE = 
WXML = libwxml.a

FPPFLAGS = $(DEFS_PREFIX)-DFC_HAVE_ABORT -DMPI
MPI_INTERFACE = libmpi_f90.a
MPI_INCLUDE = .
#FFTW_INCFLAGS = -I/sw/apps/intel17/compilers_and_libraries_2017.8.262/linux/mkl/include/fftw
#FFTW_LIBS = -L/sw/apps/intel17/compilers_and_libraries_2017.8.262/linux/mkl/lib/intel64_lin -Wl,-Bstatic -Wl,--start-group -lfftw3xc_intel -lmkl_blacs_intelmpi_lp64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -Wl,--end-group -Wl,-Bdynamic

LIBS = -Wl,-Bstatic -Wl,--start-group -lmkl_scalapack_lp64 -lmkl_blacs_intelmpi_lp64 -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -Wl,--end-group -Wl,-Bdynamic

# Dependency rules ---------

FFLAGS_DEBUG = -g -O1 -fp-model source   # your appropriate flags here...

# The atom.f code is very vulnerable. Particularly the Intel compiler
# will make an erroneous compilation of atom.f with high optimization
# levels.
atom.o: atom.F
	$(FC) -c $(FFLAGS_DEBUG) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_fixed_F) $< 
state_analysis.o: state_analysis.F
	$(FC) -c $(FFLAGS_DEBUG) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_fixed_F) $< 

.c.o:
	$(CC) -c $(CFLAGS) $(INCFLAGS) $(CPPFLAGS) $< 
.F.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_fixed_F)  $< 
.F90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FPPFLAGS) $(FPPFLAGS_free_F90) $< 
.f.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FCFLAGS_fixed_f)  $<
.f90.o:
	$(FC) -c $(FFLAGS) $(INCFLAGS) $(FCFLAGS_free_f90)  $<


