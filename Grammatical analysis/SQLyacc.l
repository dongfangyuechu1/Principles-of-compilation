%{
/****************************************************************************
SQL.l
ParserWizard generated Lex file.

Date: 2020年6月7日
****************************************************************************/
#include "SQLyacc.tab.h"
#include <stdio.h>


int yylex(void);

%}

%option noyywrap
%option caseless

digit	[0-9]
digits	{digit}+
optional_fraction	("."{digits})
letter [a-zA-Z][a-zA-Z0-9_]*
string \'[^\']*\'
strings \"[^\"]*\"

create create
drop drop
use use
select select
insert insert
delete delete
update update
from from
where where
into into
values values
set set
database database
table table

and and
or or

int int
double double
char char


%%

{create} {return CREATE;}
{drop} { return DROP;}
{use} {return USE;}
{select} { return SELECT;} 
{insert} { return INSERT;} 
{delete} { return DELETE;}
{update} { return UPDATE;}
{from} { return FROM;}
{where} { return WHERE;}
{into} { return INTO;}
{values} { return VALUES;}
{set} { return SET;} 
{database} { return DATABASE;} 
{table} { return TABLE;} 

{and} { return AND;}
{or} {return OR;}

{int} { return INT;}
{double} { return DOUBLE;}
{char} { return CHAR;}

{letter} {
    
	return ID;}
{string} {
    
	return STRING;}
{strings} {
    
	return STRINGS;}
            
{digits} {
    
	return INTNUMBER;}
{digits}{optional_fraction} {
    
	return DOUBLENUMBER;}

";" |
"(" |
")" |
"," |
"+" |
"-" |
"*" |
"/" |
"." |
"=" |
"<" |
">" |
"!" {return yytext[0];}

[ \n\t]+  
%%

