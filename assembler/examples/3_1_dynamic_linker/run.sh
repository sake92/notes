
PROG=hello_world_lib
DYN_LINKER="/lib64/ld-linux-x86-64.so.2"

as  -o $PROG.o $PROG.s

# 1. use dynamic-linker specified at DYN_LINKER
# 2. -lc means "load the 'c' library", it expands to "libc.so"
ld  -o $PROG   -dynamic-linker $DYN_LINKER   -lc   $PROG.o

./$PROG

