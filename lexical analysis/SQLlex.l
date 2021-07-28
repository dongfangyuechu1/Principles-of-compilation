%{
#include<stdio.h>

int yylex(void);
%}

/*option设置*/
%option caseless
%option noyywrap

/*定义*/
CREATE CREATE
TABLE TABLE
DATABASE DATABASE
USE USE
SELECT SELECT
INSERT INSERT
DELETE DELETE
UPDATE UPDATE
FROM FROM
WHERE WHERE
INTO INTO
VALUES VALUES
SET SET
INT INT
DOUBLE DOUBLE
CHAR CHAR
AND AND
OR OR
char [a-zA-Z]
digit [0-9]
digit_ [1-9]
digits {digit}+
optional_fraction ("."{digits})?
optional_exponent (E[+-]?{digits})?
integer {digit_}{digit}*|0
float {integer}{optional_fraction}{optional_exponent}
id {char}({char}|{digit})*
string \".*\"
%%
"+"  {printf("+");return 0;}
"-"  {printf("-");return 0;}
"*"  {printf("*");return 0;}
"/"  {printf("/");return 0;}

"("  {printf("(");return 0;}
")"  {printf(")");return 0;}
";"  {printf(";");return 0;}
","  {printf(",");return 0;}
"."  {printf(".");return 0;}

"<"  {printf("<");return 0;}
">"  {printf(">");return 0;}
"="  {printf("=");return 0;}
"!"  {printf("!");return 0;}

{CREATE} {printf("CREATE");return 0;}
{TABLE} {printf("TABLE");return 0;}
{DATABASE} {printf("DATABASE");return 0;}
{USE}	{printf("USE");return 0;}
{SELECT} {printf("SELECT");return 0;}
{INSERT} {printf("INSERT");return 0;}
{DELETE} {printf("DELETE");return 0;}
{UPDATE} {printf("UPDATE");return 0;}
{FROM} {printf("FROM");return 0;}
{WHERE} {printf("WHERE");return 0;}
{INTO} {printf("INTO");return 0;}
{VALUES} {printf("VALUES");return 0;}
{SET} {printf("SET");return 0;}
{INT} {printf("INT");return 0;}
{DOUBLE} {printf("DOUBLE");return 0;}
{CHAR} {printf("CHAR");return 0;}
{AND} {printf("AND");return 0;}
{OR} {printf("OR");return 0;}

{string} {printf("string");return 0;}
{integer} {printf("integer");return 0;}
{float} {printf("float");return 0;}
{id} {printf("ID");return 0;}




%%
int main()
{
	for(;;)
	    yylex();
	
	return 0;
}
