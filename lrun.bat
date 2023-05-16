cls
del lex.yy.c
del syntax.tab.c
del syntax.tab.h
del prog
flex lexical.l
gcc lex.yy.c -lfl -o prog
prog<test2.txt