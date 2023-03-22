cls
del lex.yy.c
flex lexical.l
gcc lex.yy.c -lfl -o prog
prog.exe<test.txt