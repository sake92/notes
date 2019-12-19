
PROG=max

as -o $PROG.o $PROG.s
ld -o $PROG $PROG.o

./$PROG
echo Max element: $?
