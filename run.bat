cls
del lex.yy.c
del syntax.tab.c
del syntax.tab.h
del prog.exe
flex lexical.l
bison -d syntax.y
gcc lex.yy.c syntax.tab.c table_symbole.c -lfl -ly -o prog
prog<test.txt