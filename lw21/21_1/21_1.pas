PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
  SymbArea = ['A'..'Z', ' '];
  CodeArea = [' ' .. 'Z'];
TYPE
  StrLen = 0 .. Len;
  Str = ARRAY [StrLen] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: StrLen;
  
PROCEDURE Initialize(VAR Code: Chiper);
{Присвоить Code шифр замены}
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'G';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '&'
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str; VAR Code: Chiper; VAR CurrStrLen: StrLen);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: StrLen;
BEGIN {Encode}
  WRITE('Your message in encrypted form is: ');
  FOR Index := 1 TO CurrStrLen
  DO
    IF (S[Index] IN SymbArea) AND (Code[S[Index]] IN CodeArea)
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END; {Encode}
 
BEGIN {Encryption}
  {Инициализировать Code}
  Initialize(Code);
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
      WRITELN('Line length is ', I);
      Encode(Msg, Code, I);
    END
END.  {Encryption}
