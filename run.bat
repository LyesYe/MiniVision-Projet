del lex.yy.c
flex lexical.l
bison -d syntax.y 
gcc lex.yy.c syntax.tab.c -lfl -ly -o prog
prog.exe<test.txt