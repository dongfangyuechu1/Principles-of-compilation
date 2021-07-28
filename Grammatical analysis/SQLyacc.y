%{
	#include<stdio.h>
	extern int yylex(void);
	int yyerror(char * msg);

%}
%token CREATE
%token DROP
%token USE
%token SELECT
%token INSERT
%token DELETE
%token UPDATE
%token FROM
%token WHERE
%token INTO
%token VALUES
%token SET
%token DATABASE
%token TABLE
%token AND
%token OR
%token INT
%token DOUBLE
%token CHAR
%token ID
%token STRING
%token STRINGS
%token INTNUMBER
%token DOUBLENUMBER

%left OR
%left AND

%%
statements: statements statement | statement
statement:  createdbsql | usesql | createtablesql | selectsql | insertsql | updatesql | deletesql

createdbsql: CREATE DATABASE database ';'{printf("CREATE DATABASE;\n");}
database: ID

usesql: USE DATABASE database ';'{printf("USE DATABASE;\n");}

createtablesql: CREATE TABLE table '(' fieldsdefinition ')' ';' {printf("CREATE TABLE;\n");}
table:ID
fieldsdefinition: field_type | fieldsdefinition ',' field_type
field_type: field type
field: ID
type: CHAR '(' INTNUMBER ')' | INT

selectsql: SELECT fields_star FROM tables ';' {printf("SELECT\n");}
		 | SELECT fields_star FROM tables WHERE conditions ';' {printf("SELECT\n");}
fields_star: table_fields | '*'
table_fields: table_fields ',' table_field | table_field
table_field: field | table '.' field
tables: tables ',' table | table
conditions: condition 
          | '(' conditions ')'
          | conditions AND conditions 
		  | conditions OR conditions
condition: comp_left comp_op comp_right
comp_left: table_field | INTNUMBER
comp_right: table_field | INTNUMBER
comp_op: '<' | '>' | '=' | '!' '='

insertsql: INSERT INTO table VALUES '(' values ')' ';' {printf("INSERT\n");}
		 | INSERT INTO table '(' col_names ')' VALUES '(' values ')' ';' {printf("INSERT\n");}
col_names: col_names ',' col_name | col_name
col_name: ID
values: values ',' value | value
value: STRING | INTNUMBER

updatesql: UPDATE table SET update_data ';' {printf("UPDATE\n");}
		 | UPDATE table SET update_data WHERE conditions ';' {printf("UPDATE\n");}
update_data: comp_left '=' comp_right

deletesql: DELETE FROM table ';' {printf("DELETE\n");} 
		 | DELETE FROM table WHERE conditions ';' {printf("DELETE\n");} 

%%

int main()
{
	while(1){
		yyparse();
	}
	return 0;
}

int yyerror(char * msg)
{
    printf("%s is error in line",msg);
    return 1;
}
