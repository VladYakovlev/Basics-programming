PROCEDURE ReadDigit(VAR InF: TEXT; VAR Digit: INTEGER);
  VAR
    Ch: CHAR;
  BEGIN{ReadDigit}
    Digit := -1;
    IF NOT EOLN(InF)
    THEN
      BEGIN
        READ(InF ,Ch);
        IF Ch = '0' THEN Digit := 0;
        IF Ch = '1' THEN Digit := 1; 
        IF Ch = '2' THEN Digit := 2;
        IF Ch = '3' THEN Digit := 3;
        IF Ch = '4' THEN Digit := 4;
        IF Ch = '5' THEN Digit := 5;
        IF Ch = '6' THEN Digit := 6;
        IF Ch = '7' THEN Digit := 7;
        IF Ch = '8' THEN Digit := 8;
        IF Ch = '9' THEN Digit := 9
      END
  END;{ReadDigit}
PROCEDURE ReadNumber(VAR InF: TEXT; VAR Number: INTEGER);
VAR
  Digit: INTEGER;
BEGIN{ReadNumber}
  Number := 0;
  ReadDigit(InF, Digit);
  WHILE (Digit <> -1 ) AND (Number <> -1)
  DO
    BEGIN
      IF Digit <> -1 
      THEN
        BEGIN
          IF (MAXINT DIV 10 < Number) OR (MAXINT DIV 10 = Number) AND (MAXINT MOD 10 < Digit)
          THEN
            Number := -1  
          ELSE
            BEGIN
              Number := Number * 10;
              Number := Number + Digit;
            END;
          ReadDigiT(InF, Digit)     
        END;  
    END;
END;{ReadNumber}
VAR
  Number: INTEGER;
BEGIN
  ReadNumber(INPUT, Number);
  WRITELN(Number)
END.
