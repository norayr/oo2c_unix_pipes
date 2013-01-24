MODULE chrtest;
IMPORT Out;
VAR i : INTEGER;
ch : CHAR;

BEGIN
i := -1;
ch := CHR(i);
i := ORD(ch);
Out.Int(i, 0); Out.Ln;

END chrtest.
