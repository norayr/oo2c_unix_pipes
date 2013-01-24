MODULE stdio [ INTERFACE "C" ];

IMPORT SYSTEM;
CONST
  EOF* = -1;
  SEEK_SET* = 0;
  SEEK_CUR* = 1;
  SEEK_END* = 2;
TYPE
  _IO_FILE_tag* = RECORD  END;
  FILE* = SYSTEM.PTR;
  PtrFILE* = POINTER TO ARRAY OF FILE;
  String* = POINTER [CSTRING] TO ARRAY OF CHAR;
  Ptr* = SYSTEM.PTR;
  size_t* = LONGINT;
VAR
  stdin* : POINTER TO _IO_FILE_tag;
  stdout* : POINTER TO _IO_FILE_tag;
  stderr* : POINTER TO _IO_FILE_tag;
  PROCEDURE fclose* (__stream : PtrFILE) : LONGINT;
  PROCEDURE fflush* (__stream : PtrFILE) : LONGINT;
  PROCEDURE fcloseall* () : LONGINT;
  PROCEDURE fopen* (__filename : String; __modes : String) : PtrFILE;
  PROCEDURE freopen* (__filename : String; __modes : String; __stream : PtrFILE) : PtrFILE;
  PROCEDURE fdopen* (__fd : LONGINT; __modes : String) : PtrFILE;
  PROCEDURE clearerr* (__stream : PtrFILE);
  PROCEDURE feof* (__stream : PtrFILE) : LONGINT;
  PROCEDURE ferror* (__stream : PtrFILE) : LONGINT;
  PROCEDURE popen* (__command : String; __modes : String) : PtrFILE;
  PROCEDURE pclose* (__stream : PtrFILE) : LONGINT;
  PROCEDURE fprintf* (__stream : PtrFILE; __format : String) : LONGINT;
  PROCEDURE printf* (__format : String) : LONGINT;
  PROCEDURE sprintf* (__s : String; __format : String) : LONGINT;
  PROCEDURE fscanf* (__stream : PtrFILE; __format : String) : LONGINT;
  PROCEDURE scanf* (__format : String) : LONGINT;
  PROCEDURE sscanf* (__s : String; __format : String) : LONGINT;
  PROCEDURE fgets* (__s : String; __n : LONGINT; __stream : PtrFILE) : String;
  PROCEDURE gets* (__s : String) : String;
  PROCEDURE fgets_unlocked* (__s : String; __n : LONGINT; __stream : PtrFILE) : String;
  PROCEDURE fputs* (__s : String; __stream : PtrFILE) : LONGINT;
  PROCEDURE puts* (__s : String) : LONGINT;
  PROCEDURE ungetc* (__c : LONGINT; __stream : PtrFILE) : LONGINT;
  PROCEDURE fread* (__ptr : Ptr; __size : size_t; __n : size_t; __stream : PtrFILE) : size_t;
  PROCEDURE fwrite* (__ptr : Ptr; __size : size_t; __n : size_t; __s : PtrFILE) : size_t;
  PROCEDURE fseek* (__stream : PtrFILE; __off : LONGINT; __whence : LONGINT) : LONGINT;
  PROCEDURE ftell* (__stream : PtrFILE) : LONGINT;
  PROCEDURE rewind* (__stream : PtrFILE);
  PROCEDURE fgetc* (__stream : PtrFILE) : LONGINT;
  PROCEDURE getc* (__stream : PtrFILE) : LONGINT;
  PROCEDURE getchar* () : LONGINT;
END stdio.
