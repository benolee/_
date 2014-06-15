#include	"table.h"

const char *initial_state = "{1}";
const struct transition transition[] = {
	/* ACTION table */
	{"{1}", "(",			"{1}'('", +1,	"shift ("},
	{"{1}", "n",			"{1}'n'", +1,	"shift n"},
	{"'T'{2}", "[#-)]",		"'E'", 0,	"E->T"},
	{"'n'{3}", "[#-)]",		"'T'", 0,	"T->n"},
	{"{4}", "-",			"{4}'-'", +1,	"shift -"},
	{"'E'{4}", "[#]",		"'S'", 0,	"S->E"},
	{"{5}", "[#]",			0, 0,		"accept"},
	{"{6}", "(",			"{6}'('", +1,	"shift ("},
	{"{6}", "n",			"{6}'n'", +1,	"shift n"},
	{"{7}", "(",			"{7}'('", +1,	"shift ("},
	{"{7}", "n",			"{7}'n'", +1,	"shift n"},
	{"'E'{*}'-'{*}'T'{8}", "[#-)]",	"'E'", 0,	"E->E-T"},
	{"{9}", ")",			"{9}')'", +1,	"shift )"},
	{"{9}", "-",			"{9}'-'", +1,	"shift -"},
	{"'('{*}'E'{*}')'{10}", "[#-)]","'T'", 0,	"T->(E)"},

	/* GOTO table */
	{"{1}'('", "",			"{1}'('{6}", 0,	"GOTO"},
	{"{1}'n'", "",			"{1}'n'{3}", 0,	"GOTO"},
	{"{1}'T'", "",			"{1}'T'{2}", 0,	"GOTO"},
	{"{1}'E'", "",			"{1}'E'{4}", 0,	"GOTO"},
	{"{1}'S'", "",			"{1}'S'{5}", 0,	"GOTO"},
	{"{4}'-'", "",			"{4}'-'{7}", 0,	"GOTO"},
	{"{6}'('", "",			"{6}'('{6}", 0,	"GOTO"},
	{"{6}'n'", "",			"{6}'n'{3}", 0,	"GOTO"},
	{"{6}'E'", "",			"{6}'E'{9}", 0,	"GOTO"},
	{"{6}'T'", "",			"{6}'T'{2}", 0,	"GOTO"},
	{"{7}'('", "",			"{7}'('{6}", 0,	"GOTO"},
	{"{7}'n'", "",			"{7}'n'{3}", 0,	"GOTO"},
	{"{7}'T'", "",			"{7}'T'{8}", 0,	"GOTO"},
	{"{9}')'", "",			"{9}')'{10}", 0,	"GOTO"},
	{"{9}'-'", "",			"{9}'-'{7}", 0,	"GOTO"},

	{0}
};