MODULE test;
IMPORT Strings, Ascii, stdio;

(*TYPE PCHAR* = POINTER [CSTRING] TO ARRAY OF CHAR;*)
TYPE String = stdio.String;

TYPE TextFile* = POINTER TO TextFileDesc;

TYPE TextFileDesc* = RECORD;
         text- : stdio.PtrFILE;
	 eof-  : BOOLEAN;
	 END;

VAR StringLength : LONGINT;	

(*VAR l : LONGINT;
f : stdio.PtrFILE;
s0, s1, s2, s3 : stdio.String;
status : LONGINT;
*)

PROCEDURE OberonStringtoPchar( VAR s : ARRAY OF CHAR) : String;
VAR l, i : LONGINT;
p : String;
BEGIN
   l := Strings.Length(s);
   INC(l);
   NEW(p, l);
   i := 0;
   REPEAT
     p[i] := s[i];
   UNTIL i = l;
   RETURN p;
END OberonStringtoPchar;

PROCEDURE POpen*(VAR f : TextFile; VAR(*CONST*) s : ARRAY OF CHAR ; mode : CHAR);
VAR s0, s1 : String;
l : LONGINT;
BEGIN
NEW(s0,2);
s0^[0] := mode; s0^[1] := Ascii.nul;
l := Strings.Length(s);
NEW(s1,l+1);

f.text := stdio.popen(s, s0);
f.eof := FALSE;

END POpen;

PROCEDURE PClose(VAR f : TextFile);
VAR l : LONGINT;
BEGIN
l := stdio.pclose(f.text);
END PClose;

PROCEDURE Read*(VAR(*CONST*) f  : TextFile; VAR ch : CHAR);
VAR l : LONGINT;
BEGIN
   l := stdio.fgetc(f.text);
   IF l = 0 THEN
      ch := Ascii.nul
   ELSIF l = stdio.EOF THEN
      f.eof := TRUE;
      ch := Ascii.nul
   ELSE
      ch := CHR((SHORT(SHORT(l))))
   END
END Read;
(*
PROCEDURE read(VAR(*CONST*) f : TextFile; VAR ch : CHAR; VAR l : LONGINT);
BEGIN
   l := stdio.fgetc(f.text);
   ch := CHR((SHORT(SHORT(l))));
   IF l = stdio.EOF THEN f.eof := TRUE;
END read;
*)

PROCEDURE ReadLine(VAR(*CONST*) f : TextFile; VAR s : ARRAY OF CHAR);
VAR (*s : ARRAY StringLength of CHAR;*)
ch : CHAR;
l : LONGINT;
s0 : ARRAY 2 OF CHAR;
BEGIN
   Strings.Assign("", s);
   REPEAT
      Read(f, ch);
      IF (ch # Ascii.cr) & (ch # Ascii.lf)  THEN
         s0[0] := ch;
	 s0[1] := Ascii.nul;
	 Strings.Append(s0, s)
      END;
   UNTIL (f.eof = TRUE) OR (ch = Ascii.nul) OR (ch = Ascii.cr) OR (ch = Ascii.lf);

END ReadLine;

PROCEDURE EOF*(VAR(*CONST*) f: TextFile): BOOLEAN;
BEGIN
RETURN f.eof;
END EOF;

PROCEDURE SetStringLength*(i : LONGINT);
BEGIN
StringLength := i;
END SetStringLength;

PROCEDURE GetStringLength*() : LONGINT;
BEGIN
RETURN StringLength;
END GetStringLength;

BEGIN
StringLength := 255;

END test.
(*
l := stdio.printf ("aaa\n");

s0 := "/bin/ls";
s1 := "r";
f := stdio.popen(s0, s1);
Out.String("stdio.popen");Out.Ln;

REPEAT
   l := stdio.fgetc(f);
   Out.Char(CHR((SHORT(SHORT(l)))));
UNTIL l = stdio.EOF;
status := stdio.pclose(f);
END test.
*)
