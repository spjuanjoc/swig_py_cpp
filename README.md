# SWIG python3 C++17
Use SWIG to create a Python wrapper for Cpp code

## Tools
* python3: python3.6
* c++ std 17 
* gcc 7.4
* swig
* Linux terminal

### Steps
1. Generate python interface via SWIG
2. Generate object code for shared library
3. Generate shared library
4. Import module in python and run function

----
Open a terminal window and go to 
the directory where the source code is placed.

###1.  SWIG wrapper
Create wrapper `foo_wrap.cxx` and `foo.py`:

~~~~{shell script}
~/.../$ swig -python -py3 -c++ foo.i
~~~~

###2. Compile 
Create objects `foo_wrap.o` and `foo.o`:
~~~~{shell script}
~/.../$ g++ -c -fPIC foo.cpp foo_wrap.cxx -I/usr/include/python3.6
~~~~

###3. Link
Create C++ shared library `_foo.so`:
~~~~{shell script}
~/.../$ g++ -shared foo.o foo_wrap.o -o _foo.so
~~~~ 

**Note**: underscore is mandatory

###4. Run
Use python to import the C++ module:
~~~~{shell script}
$ python3
~~~~
~~~~{python}
>>> import foo
>>> foo.hello()
~~~~

### Output
Expected output is:
~~~~{python}
Hello, SWIG!
~~~~

See this GeeksForGeeks article 
[Wrapping C/C++ for Python using SWIG](https://www.geeksforgeeks.org/wrapping-cc-python-using-swig-set-1/) 
for details

