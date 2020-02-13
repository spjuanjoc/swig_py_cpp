// foo.i SWIG interface file
%module foo
%{
#include "foo.h"
%};

%include "foo.h"

void hello();
