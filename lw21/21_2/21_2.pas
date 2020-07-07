PROGRAM Encryption(INPUT, OUTPUT);
CONST
  Len = 20;
  SymbArea = ['A' .. 'Z', ' '];
  CodeArea = [' ' .. 'Z'];
TYPE
  StrLen = 0 .. Len;
  Str = ARRAY [StrLen] OF ' ' .. 'Z';
  Chiper = ARRAY [' ' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  I: StrLen;
  ChiperTxt: TEXT;
  Error: BOOLEAN;
  SpaceChiper: CHAR;

PROCEDURE Initialize(VAR Code: Chiper; VAR CodeTxt: TEXT; VAR Error: BOOLEAN);
VAR
  UsedChar: SET OF CHAR;
  Ch1, Ch2, Ch3: CHAR; 
BEGIN {Initialize}
  UsedChar := [];
  RESET(CodeTxt);
  Error := FALSE; 
  WHILE NOT EOF(CodeTxt) AND NOT Error 
  DO
    BEGIN
      IF NOT EOLN(CodeTxt)
      THEN
        BEGIN
          WHILE NOT EOLN(CodeTxt)
          DO
            BEGIN
              Ch1 := Ch2;
              Ch2 := Ch3;
              READ(CodeTxt, Ch3)
            END; 
          IF (Ch1 IN SymbArea) AND (Ch2 = '=') AND NOT (Ch3 IN UsedChar) AND (Ch3 IN CodeArea)
          THEN
            BEGIN
              Code[Ch1] := Ch3;
              UsedChar := UsedChar + [Ch3]
            END 
          ELSE
            IF (Ch1 IN SymbArea) AND (Ch3 IN UsedChar)
            THEN
              BEGIN
                Error := TRUE;
                WRITELN('Error: Multiple letters have the same cipher.') 
              END
            ELSE
              IF Ch2 <> '='
              THEN
                BEGIN
                  Error := TRUE;
                  WRITELN('Error: Invalid data format.') 
                END
      END;     
      READLN(CodeTxt)
    END
END; {Initialize}
 
PROCEDURE Encode(VAR S: Str; VAR Code: Chiper; VAR CurrStrLen: StrLen);
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
  ASSIGN(ChiperTxt, 'Cipher.txt');
  RESET(ChiperTxt);
  Initialize(Code, ChiperTxt, Error);
  WHILE NOT Error AND NOT EOF
  DO
    BEGIN
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
END. {Encryption}
