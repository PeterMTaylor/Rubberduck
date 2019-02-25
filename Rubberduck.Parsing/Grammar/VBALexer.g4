/*
* Copyright (C) 2014 Ulrich Wolffgang <u.wol@wwu.de>
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License
* along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

lexer grammar VBALexer;

options {
    superClass = VBABaseLexer;
    contextSuperClass = VBABaseParser;
}

ABS : A B S;
ANY : A N Y;
ARRAY : A R R A Y;
CBOOL : C B O O L;
CBYTE : C B Y T E;
CCUR : C C U R;
CDATE : C D A T E;
CDBL : C D B L;
CDEC : C D E C;
CINT : C I N T;
CIRCLE : C I R C L E;
CLNG : C L N G;
CLNGLNG : C L N G L N G;
CLNGPTR : C L N G P T R;
CSNG : C S N G;
CSTR : C S T R;
CURRENCY : C U R R E N C Y;
CVAR : C V A R;
CVERR : C V E R R;
DEBUG : D E B U G;
DOEVENTS : D O E V E N T S;
EXIT : E X I T;
FIX : F I X;
INPUTB : I N P U T B;
INT : I N T;
LBOUND : L B O U N D;
LEN : L E N;
LENB : L E N B;
LONGLONG : L O N G L O N G;
LONGPTR : L O N G P T R;
MIDB : M I D B;
OPTION : O P T I O N;
PSET : P S E T;
SCALE : S C A L E;
SGN : S G N;
UBOUND : U B O U N D;
COMMA : ',';
COLON : ':';
SEMICOLON : ';';
EXCLAMATIONPOINT : '!';
DOT : '.';
HASH : '#';
AT : '@';
PERCENT : '%';
DOLLAR : '$';
AMPERSAND : '&';
ACCESS : A C C E S S;
ADDRESSOF : A D D R E S S O F;
ALIAS : A L I A S;
AND : A N D;
ATTRIBUTE : A T T R I B U T E;
APPEND : A P P E N D;
AS : A S;
BEGINPROPERTY : B E G I N P R O P E R T Y; //Used in module configurations.
BEGIN : B E G I N;
BINARY : B I N A R Y;
BOOLEAN : B O O L E A N;
BYVAL : B Y V A L;
BYREF : B Y R E F;
BYTE : B Y T E;
CALL : C A L L;
CASE : C A S E;
CDECL : C D E C L;
CLASS : C L A S S;
CLOSE : C L O S E;
CONST : C O N S T;
DATABASE : D A T A B A S E;
DATE : D A T E;
DECLARE : D E C L A R E;
DEFBOOL : D E F B O O L; 
DEFBYTE : D E F B Y T E;
DEFDATE : D E F D A T E;
DEFDBL : D E F D B L;
DEFCUR : D E F C U R;
DEFINT : D E F I N T;
DEFLNG : D E F L N G;
DEFLNGLNG : D E F L N G L N G;
DEFLNGPTR : D E F L N G P T R;
DEFOBJ : D E F O B J;
DEFSNG : D E F S N G;
DEFSTR : D E F S T R;
DEFVAR : D E F V A R;
DIM : D I M;
DO : D O;
DOUBLE : D O U B L E;
EACH : E A C H;
ELSE : E L S E;
ELSEIF : E L S E I F;
EMPTY : E M P T Y;
// Apparently END_ENUM and END_TYPE don't allow line continuations (in the VB editor)
END_ENUM : E N D WS+ E N U M;
END_FUNCTION : E N D (WS | LINE_CONTINUATION)+ F U N C T I O N;
// We allow "EndIf" without the whitespace as well for the preprocessor.
END_IF : E N D (WS | LINE_CONTINUATION)* I F;
ENDPROPERTY : E N D P R O P E R T Y; //Used in module configurations.
END_PROPERTY : E N D (WS | LINE_CONTINUATION)+ P R O P E R T Y;
END_SELECT : E N D (WS | LINE_CONTINUATION)+ S E L E C T;
END_SUB : E N D (WS | LINE_CONTINUATION)+ S U B;
END_TYPE : E N D WS+ T Y P E;
END_WITH : E N D (WS | LINE_CONTINUATION)+ W I T H;
END : E N D;
ENUM : E N U M;
EQV : E Q V;
ERASE : E R A S E;
ERROR : E R R O R;
EVENT : E V E N T;
EXIT_DO : E X I T (WS | LINE_CONTINUATION)+ D O;
EXIT_FOR : E X I T (WS | LINE_CONTINUATION)+ F O R;
EXIT_FUNCTION : E X I T (WS | LINE_CONTINUATION)+ F U N C T I O N;
EXIT_PROPERTY : E X I T (WS | LINE_CONTINUATION)+ P R O P E R T Y;
EXIT_SUB : E X I T (WS | LINE_CONTINUATION)+ S U B;
FALSE : F A L S E;
FRIEND : F R I E N D;
FOR : F O R;
FUNCTION : F U N C T I O N;
GET : G E T;
GLOBAL : G L O B A L;
GOSUB : G O S U B;
GOTO : G O T O;
IF : I F;
IMP : I M P;
IMPLEMENTS : I M P L E M E N T S;
IN : I N;
INPUT : I N P U T;
IS : I S;
INTEGER : I N T E G E R;
LOCK : L O C K;
LONG : L O N G;
LOOP : L O O P;
LET : L E T;
LIB : L I B;
LIKE : L I K E;
LINE_INPUT : L I N E (WS | LINE_CONTINUATION)+ I N P U T;
LOCK_READ : L O C K (WS | LINE_CONTINUATION)+ R E A D;
LOCK_WRITE : L O C K (WS | LINE_CONTINUATION)+ W R I T E;
LOCK_READ_WRITE : L O C K (WS | LINE_CONTINUATION)+ R E A D (WS | LINE_CONTINUATION)+ W R I T E;
LSET : L S E T;
ME : M E;
MID : M I D;
MOD : M O D;
NAME : N A M E;
NEXT : N E X T;
NEW : N E W;
NOT : N O T;
NOTHING : N O T H I N G;
NULL : N U L L;
OBJECT: O B J E C T;
ON : O N;
ON_ERROR : O N (WS | LINE_CONTINUATION)+ E R R O R;
ON_LOCAL_ERROR : O N (WS | LINE_CONTINUATION)+ L O C A L (WS | LINE_CONTINUATION)+ E R R O R;
OPEN : O P E N;
OPTIONAL : O P T I O N A L;
OPTION_BASE : O P T I O N (WS | LINE_CONTINUATION)+ B A S E;
OPTION_EXPLICIT : O P T I O N (WS | LINE_CONTINUATION)+ E X P L I C I T;
OPTION_COMPARE : O P T I O N (WS | LINE_CONTINUATION)+ C O M P A R E;
OPTION_PRIVATE_MODULE : O P T I O N (WS | LINE_CONTINUATION)+ P R I V A T E (WS | LINE_CONTINUATION)+ M O D U L E;
OR : O R;
OUTPUT : O U T P U T;
PARAMARRAY : P A R A M A R R A Y;
PRESERVE : P R E S E R V E;
PRINT : P R I N T;
PRIVATE : P R I V A T E;
PROPERTY_GET : P R O P E R T Y (WS | LINE_CONTINUATION)+ G E T;
PROPERTY_LET : P R O P E R T Y (WS | LINE_CONTINUATION)+ L E T;
PROPERTY_SET : P R O P E R T Y (WS | LINE_CONTINUATION)+ S E T;
PTRSAFE : P T R S A F E;
PUBLIC : P U B L I C;
PUT : P U T;
RANDOM : R A N D O M;
RANDOMIZE : R A N D O M I Z E;
RAISEEVENT : R A I S E E V E N T;
READ : R E A D;
READ_WRITE : R E A D (WS | LINE_CONTINUATION)+ W R I T E;
REDIM : R E D I M;
REM : R E M;
RESET : R E S E T;
RESUME : R E S U M E;
RETURN : R E T U R N;
RSET : R S E T;
SEEK : S E E K;
SELECT : S E L E C T;
SET : S E T;
SHARED : S H A R E D;
SINGLE : S I N G L E;
SPC : S P C;
STATIC : S T A T I C;
STEP : S T E P;
STOP : S T O P;
STRING : S T R I N G;
SUB : S U B;
TAB : T A B;
TEXT : T E X T;
THEN : T H E N;
TO : T O;
TRUE : T R U E;
TYPE : T Y P E;
TYPEOF : T Y P E O F;
UNLOCK : U N L O C K;
UNTIL : U N T I L;
VARIANT : V A R I A N T;
VERSION : V E R S I O N;
WEND : W E N D;
WHILE : W H I L E;
WIDTH : W I D T H;
WITH : W I T H;
WITHEVENTS : W I T H E V E N T S;
WRITE : W R I T E;
XOR : X O R;
ASSIGN : ':=';
DIV : '/';
INTDIV : '\\';
EQ : '=';
GEQ : '>=' | '=>';
GT : '>';
LEQ : '<=' | '=<';
LPAREN : '(';
LT : '<';
MINUS : '-';
MULT : '*';
NEQ : '<>' | '><';
PLUS : '+';
POW : '^';
RPAREN : ')';
L_SQUARE_BRACKET : '[';
R_SQUARE_BRACKET : ']';
L_BRACE : '{';
R_BRACE : '}';
STRINGLITERAL : '"' (~["\r\n] | '""')* '"';
OCTLITERAL : '&O' [0-8]+ INTEGERTYPESUFFIX?;
HEXLITERAL : '&H' [0-9A-F]+ INTEGERTYPESUFFIX?;
FLOATLITERAL :
    FLOATINGPOINTLITERAL FLOATINGPOINTTYPESUFFIX?
    | DECIMALLITERAL FLOATINGPOINTTYPESUFFIX;
fragment FLOATINGPOINTLITERAL :
    DECIMALLITERAL EXPONENT
    | DECIMALLITERAL '.' DECIMALLITERAL?  EXPONENT?
    | '.' DECIMALLITERAL EXPONENT?;
INTEGERLITERAL : DECIMALLITERAL INTEGERTYPESUFFIX?;
fragment INTEGERTYPESUFFIX : [%&^];
fragment FLOATINGPOINTTYPESUFFIX : [!#@];
fragment EXPONENT : EXPONENTLETTER EXPONENTSIGN? DIGIT+;
fragment EXPONENTLETTER : [DEde];
fragment EXPONENTSIGN : [+-];
fragment DECIMALLITERAL : DIGIT+;
DATELITERAL : HASH ((WS | LINE_CONTINUATION)+)? DATEORTIME HASH;
fragment DATEORTIME : DATEVALUE WS? TIMEVALUE | DATEVALUE | TIMEVALUE;
fragment DATEVALUE : DATEVALUEPART DATESEPARATOR DATEVALUEPART (DATESEPARATOR DATEVALUEPART)?;
fragment DATEVALUEPART : DIGIT+ | MONTHNAME;
fragment DATESEPARATOR : WS? [/,-]? WS?;
fragment MONTHNAME : ENGLISHMONTHNAME | ENGLISHMONTHABBREVIATION;
fragment ENGLISHMONTHNAME : JANUARY | FEBRUARY | MARCH | APRIL | MAY | JUNE | JULY | AUGUST | SEPTEMBER | OCTOBER | NOVEMBER | DECEMBER;
fragment ENGLISHMONTHABBREVIATION : JAN | FEB | MAR | APR | JUN | JUL | AUG | SEP | OCT | NOV | DEC;
fragment TIMEVALUE : DIGIT+ AMPM | DIGIT+ TIMESEPARATOR DIGIT+ (TIMESEPARATOR DIGIT+)? AMPM?;
fragment TIMESEPARATOR : WS? (':' | '.') WS?;
fragment AMPM : WS? (A M | P M | A | P);
fragment JANUARY : J A N U A R Y;
fragment FEBRUARY : F E B R U A R Y;
fragment MARCH : M A R C H;
fragment APRIL : A P R I L;
fragment MAY : M A Y;
fragment JUNE : J U N E;
fragment JULY : J U L Y;
fragment AUGUST : A U G U S T;
fragment SEPTEMBER : S E P T E M B E R;
fragment OCTOBER : O C T O B E R;
fragment NOVEMBER : N O V E M B E R;
fragment DECEMBER : D E C E M B E R;
fragment JAN : J A N;
fragment FEB : F E B;
fragment MAR: M A R;
fragment APR : A P R;
fragment JUN : J U N;
fragment JUL: J U L;
fragment AUG : A U G;
fragment SEP : S E P;
fragment OCT : O C T;
fragment NOV : N O V;
fragment DEC : D E C;
NEWLINE : '\r' '\n' | [\r\n\u2028\u2029];
SINGLEQUOTE : '\'';
UNDERSCORE : '_';
WS : [ \t];
GUIDLITERAL : '{' [0-9A-F]+ '-' [0-9A-F]+ '-' [0-9A-F]+ '-' [0-9A-F]+ '-' [0-9A-F]+ '}';
IDENTIFIER :  ~[[\](){}\r\n\t.,'"|!@#$%^&*\-+:=; 0-9-/\\-] ~[[\](){}\r\n\t.,'"|!@#$%^&*\-+:=; -]*;
LINE_CONTINUATION : [ \t]+ UNDERSCORE [ \t]* '\r'? '\n' WS_NOT_FOLLOWED_BY_LINE_CONTINUATION*;
// The following rule is needed in order to capture hex literals without format prefixes which start with a digit. Needed for VBForm resources.
BARE_HEX_LITERAL : [0-9] [0-9a-fA-F]*; 
fragment WS_NOT_FOLLOWED_BY_LINE_CONTINUATION : [ \t] {!IsChar(CharAtRelativePosition(1),'_') || !IsChar(CharAtRelativePosition(2),'\r','\n','\t',' ')}?;
fragment LETTER : [a-zA-Z_äöüÄÖÜ];
fragment DIGIT : [0-9];
fragment LETTERORDIGIT : [a-zA-Z0-9_äöüÄÖÜ];
fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');
ERRORCHAR : .;
