# Units of measure in (Fortran) programs

[![CI](https://github.com/arjenmarkus/handling-units/actions/workflows/CI.yml/badge.svg)](https://github.com/arjenmarkus/handling-units/actions/workflows/CI.yml) [[__View Paper Preview__](https://github.com/arjenmarkus/handling-units/blob/previews/main/handling_units_dimensions.pdf)]

Many solutions have been suggested for a wide range of programming languages to deal with
*units of measure* in a consistent way. And by that we mean:

* Variable `a` may represent a length and variable `b` may represent a temperature. The program
  may want to multiply them or divide them, `a*b`or `a/b` but the sum `a+b` is not defined.
* Input may be expected in meters, but may I use inches instead? Should this be
  seen as an error or is it possible to automatically convert to the right unit?

We examine the various uses (implicit and explicit) of units -- and dimensions -- in typical
programs, so that it becomes possible to formulate a set of requirements that specific implementations
or language features may conform to. Failing to meet a requirement does not mean that the implementation
is unuseable: it may simply impose restrictions on the use within an actual program.
