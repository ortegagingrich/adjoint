      subroutine setprob

      use adjoint_module, only: read_adjoint_data, set_time_window
      implicit double precision (a-h,o-z)
      character*25 fname
      common /cparam/ rho,bulk,cc,zz

c
c     # Set the material parameters for the acoustic equations
c
c
      iunit = 7
      fname = 'setprob.data'
c     # open the unit with new routine from Clawpack 4.4 to skip over
c     # comment lines starting with #:
      call opendatafile(iunit, fname)
                
c
c     # Density and bulk modulus:

      read(7,*) rho
      read(7,*) bulk
c
c     # Compute sound speed and impendance:

      cc = dsqrt(bulk/rho)
      zz = rho*cc

c     # Setting time range of interest
      t_rangeStart = 1.5d0
      t_final = 1.5d0

      call read_adjoint_data()
      call set_time_window(t_rangeStart, t_final)

      return
      end
