/* The grammar from Figure 10.8, extended with report functions */

{
#include	"dot.h"
}

%start LC, S;

S:
	{start("S","'n'","S_after_F",0,0);}
	'n'{term_done("'n'");}
	{LC_done("F");}S_after_F{nt_done();}
	{stop("S");}
|
	{start("S","'('","E","')'","S_after_F");}
	'('{term_done("'('");}E{nt_done();}')'{term_done("')'");}
	{LC_done("F");}S_after_F{nt_done();}
	{stop("S");}
;
S_after_F:
	{start("S_after_F","S_after_T",0,0,0);}
	{LC_done("T");}S_after_T{nt_done();}
	{stop("S_after_F");}
;
S_after_T:
	{start("S_after_T","S_after_E",0,0,0);}
	{LC_done("E");}S_after_E{nt_done();}
	{stop("S_after_T");}
|
	{start("S_after_T","'*'","F","S_after_T",0);}
	'*'{term_done("'*'");}F{nt_done();}
	{LC_done("T");}S_after_T{nt_done();}
	{stop("S_after_T");}
;
S_after_E:
	{start("S_after_E","'+'","T","S_after_E",0);}
	'+'{term_done("'+'");}T{nt_done();}
	{LC_done("E");}S_after_E{nt_done();}
	{stop("S_after_E");}
|
	{start("S_after_E","S_after_S",0,0,0);}
	{LC_done("S");}S_after_S{nt_done();}
	{stop("S_after_E");}
;
S_after_S:
	{start("S_after_S",0,0,0,0);}
	{stop("S_after_S");}
;

E:
	{start("E","'n'","E_after_F",0,0);}
	'n'{term_done("'n'");}
	{LC_done("F");}E_after_F{nt_done();}
	{stop("E");}
|
	{start("E","'('","E","')'","E_after_F");}
	'('{term_done("'('");}E{nt_done();}')'{term_done("')'");}
	{LC_done("F");}E_after_F{nt_done();}
	{stop("E");}
;
E_after_F:
	{start("E_after_F","E_after_T",0,0,0);}
	{LC_done("T");}E_after_T{nt_done();}
	{stop("E_after_F");}
;
E_after_T:
	{start("E_after_T","E_after_E",0,0,0);}
	{LC_done("E");}E_after_E{nt_done();}
	{stop("E_after_T");}
|
	{start("E_after_T","'*'","F","E_after_T",0);}
	'*'{term_done("'*'");}F{nt_done();}
	{LC_done("T");}E_after_T{nt_done();}
	{stop("E_after_T");}
;
E_after_E:
	{start("E_after_E","'+'","T","E_after_E",0);}
	'+'{term_done("'+'");}T{nt_done();}
	{LC_done("E");}E_after_E{nt_done();}
	{stop("E_after_E");}
|
	{start("E_after_E",0,0,0,0);}
	{stop("E_after_E");}
;

T:
	{start("T","'n'","T_after_F",0,0);}
	'n'{term_done("'n'");}
	{LC_done("F");}T_after_F{nt_done();}
	{stop("T");}
|
	{start("T","'('","E","')'","T_after_F");}
	'('{term_done("'('");}E{nt_done();}')'{term_done("')'");}
	{LC_done("F");}T_after_F{nt_done();}
	{stop("T");}
;
T_after_F:
	{start("T_after_F","T_after_T",0,0,0);}
	{LC_done("T");}T_after_T{nt_done();}
	{stop("T_after_F");}
;
T_after_T:
	{start("T_after_T","'*'","F","T_after_T",0);}
	'*'{term_done("'*'");}F{nt_done();}
	{LC_done("T");}T_after_T{nt_done();}
	{stop("T_after_T");}
|
	{start("T_after_T",0,0,0,0);}
	{stop("T_after_T");}
;

F:
	{start("F","'n'","F_after_F",0,0);}
	'n'{term_done("'n'");}
	{LC_done("F");}F_after_F{nt_done();}
	{stop("F");}
|
	{start("F","'('","E","')'","F_after_F");}
	'('{term_done("'('");}E{nt_done();}')'{term_done("')'");}
	{LC_done("F");}F_after_F{nt_done();}
	{stop("F");}
;
F_after_F:
	{start("F_after_F",0,0,0,0);}
	{stop("F_after_F");}
;