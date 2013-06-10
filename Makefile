#
# test Makefile
#
#

ifndef buildDir
buildDir = $(CURDIR)
endif

#
# Directories
#
MSObjDir =	$(buildDir)/obj
MSSrcDir =	$(buildDir)/src
MSIncDir =	$(buildDir)/include

# Python 
PYTHON_VERSION = 2.7
PYTHON_PATH = /usr/local/uvcdat/1.3.1/Library/Frameworks/Python.framework/Versions/2.7/
PYTHON_OBJECTS =
# Include files and libraries for python.
# Please run 'python-config --ldflags'
# on your system and edit the following 2 lines accordingly.
PYTHON_INCLUDE = -I$(PYTHON_PATH)/include/python$(PYTHON_VERSION)
# PYTHON_INCLUDE = -I$(PYTHON_PATH)/include/python$(PYTHON_VERSION) -fno-strict-aliasing -DNDEBUG -g -fwrapv -O3 -Wall
PYTHON_LIBS = -L/usr/local/uvcdat/1.3.1/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config -ldl -lpython2.7
# PYTHON_LIBS = -L/usr/local/uvcdat/1.3.1/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/config -ldl -framework CoreFoundation -lpython2.7

NUMPY_PATH = /usr/local/uvcdat/1.3.1/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/numpy/
NUMPY_INCLUDE = -I$(NUMPY_PATH)/core/include/numpy
NUMPY_OBJECTS = 

#
# Source files
#
MSOBJECT = $(MSObjDir)/main.o $(MSObjDir)/uvcdatWrappers.o
OBJECTS = $(MSOBJECT) $(NUMPY_OBJECTS)

INCLUDE_FLAGS =	-I$(MSIncDir) $(PYTHON_INCLUDE) $(NUMPY_INCLUDE)
#
# Compile and link flags
#
INCLUDES +=	$(INCLUDE_FLAGS) $(LIB_INCLUDES) $(SVR_INCLUDES)
CFLAGS_OPTIONS := $(CFLAGS) $(MY_CFLAG)
CFLAGS := $(CFLAGS_OPTIONS) $(INCLUDES) $(MODULE_CFLAGS)

LIBS := $(PYTHON_OBJECTS) $(PYTHON_LIBS)

.PHONY: all rules microservices server client clean
.PHONY: server_ldflags client_ldflags server_cflags client_cflags
.PHONY: print_cflags

# Build everything
all:	wrapperTest
	@true

# List module's objects for inclusion in the clients
client_ldflags:
	@true

# List module's includes for inclusion in the clients
client_cflags:
	@true

# List module's objects for inclusion in the server
server_ldflags:
	@echo $(OBJECTS) $(PYTHON_OBJECTS) $(PYTHON_LIBS)

# List module's includes for inclusion in the server
server_cflags:
	@echo $(INCLUDE_FLAGS)

# Build client additions
client:
	@true

# Build server additions
server:
	@true

# Build rules
rules:
	@true

# Clean
clean:
	@echo "Clean cdms module..."
	@rm -f $(MSOBJECT)
	@rm -f wrapperTest
	@rm -f python/*.pyc

# Show compile flags
print_cflags:
	@echo "Compile flags:"
	@echo "    $(CFLAGS_OPTIONS)"

#
# Compilation targets
#
$(MSOBJECT): $(MSObjDir)/%.o: $(MSSrcDir)/%.c $(DEPEND)
	@echo "Compile cdms module `basename $@`..."
	@$(CC) -c $(CFLAGS) -o $@ $<
	
wrapperTest: $(OBJECTS)
	gcc -o $@ $^ $(CFLAGS) $(LIBS)
