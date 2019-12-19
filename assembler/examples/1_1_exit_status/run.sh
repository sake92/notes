
PROG=bla

as -o $PROG.o $PROG.s
ld -o $PROG $PROG.o

./$PROG
echo Exit status: $?

