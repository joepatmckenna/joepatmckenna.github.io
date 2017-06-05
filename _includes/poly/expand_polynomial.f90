! Copyright 2017 Joseph P. McKenna

! This program is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.

! This program is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
! GNU General Public License for more details.

! You should have received a copy of the GNU General Public License
! along with this program.  If not, see <http://www.gnu.org/licenses/>.

program main
  implicit none
  integer, parameter :: dp = kind(0.d0)

  integer :: n
  real(dp) :: a
  real(dp), allocatable :: root(:), coeff(:)

  allocate(root(n),coeff(0:n))

  ! expand the polynomial 1*(x-1)^4
  n=4; a=1; root=1
  coeff = expand_polynomial(n, a, root)
  print '(5(f0.1,x))', coeff

  deallocate(root,coeff)

contains

  ! compute coefficients of the polynomial
  ! a*(x-root(1))*...*(x-root(n))
  ! returns array coeff where
  ! coeff(i) = coefficient of x^i for i=0 to n
  function expand_polynomial(n,a,root) result(coeff)
    implicit none

    integer, intent(in) :: n
    real(dp), intent(in) :: a, root(n)
    real(dp) :: coeff(0:n)

    integer :: i, j, k, l
    integer, allocatable :: s(:)
    real(dp), allocatable :: r(:)

    coeff=0._dp
    coeff(n)=1._dp
    do i=1,n
       allocate(s(i),r(i))
       s=(/(j,j=1,i)/)
       s(i)=s(i)-1
       do while(sum(s)<sum((/(j,j=n-i+1,n)/)))
          ! select subset of i roots
          do j=0,i-1
             if (s(i-j)<n-j) then
                s(i-j:i)=(/(k,k=s(i-j)+1,s(i-j)+j+1)/)
                exit
             end if
          end do
          do j=1,i
             r(j)=root(s(j))
          end do
          ! add product of roots to running sum
          coeff(n-i)=coeff(n-i)+product(r)
       end do
       deallocate(s,r)
    end do
    ! scale coeff
    coeff=a*coeff
    ! correct sign of coeff
    do i=n-1,0,-2
       coeff(i)=-coeff(i)
    end do
  end function expand_polynomial

end program main
