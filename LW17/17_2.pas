PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  D := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F ,Ch);
      IF Ch = '0' THEN D := 0;
      IF Ch = '1' THEN D := 1; 
      IF Ch = '2' THEN D := 2;
      IF Ch = '3' THEN D := 3;
      IF Ch = '4' THEN D := 4;
      IF Ch = '5' THEN D := 5;
      IF Ch = '6' THEN D := 6;
      IF Ch = '7' THEN D := 7;
      IF Ch = '8' THEN D := 8;
      IF Ch = '9' THEN D := 9 
    END
END;{ReadDigit}
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
  Digit: INTEGER;
  NumFile: TEXT;
  OverFlow: BOOLEAN;
BEGIN{ReadNumber}
  N := 0;
  OverFlow := FALSE;
  ReadDigit(F, Digit);
  REWRITE(NumFile);
  WHILE (Digit <> -1 ) AND ( NOT OverFlow)
  DO
    BEGIN
      IF Digit <> -1 
      THEN
        BEGIN
          IF (MAXINT DIV 10 < N) OR (MAXINT DIV 10 = N) AND (MAXINT MOD 10 < Digit)
          THEN
            OverFlow := TRUE
          ELSE
            BEGIN
              WRITE(NumFile, Digit);
              RESET(NumFile);
              READ(NumFile, N);
              ReadDigit(F, Digit);
            END
        END;  
    END;
  IF OverFlow = FALSE
  THEN
    WRITELN(N)
  ELSE
    WRITELN(-1);
END;{ReadNumber}
VAR
  Number: INTEGER;
BEGIN
  ReadNumber(INPUT, Number)
END.
