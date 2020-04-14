PROGRAM Stat(INPUT, OUTPUT);
VAR
  Number, Average, Min, Max, NumbersAmount, Sum: INTEGER;
  OverFlow: BOOLEAN;
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
      IF OverFlow = TRUE
      THEN
        N := -1; 
    END;
END;{ReadNumber}
BEGIN
  Min := -1;
  Max := -1;
  Sum := 0;
  Average := 0;
  NumbersAmount := 0;
  OverFlow := FALSE;
  WHILE (NOT EOF(INPUT)) AND (OverFlow = FALSE)
  DO
    BEGIN
      ReadNumber(INPUT, Number);
      IF Number = -1
      THEN
        OverFlow := TRUE;
      Sum := Sum + Number;
      IF (Sum > (MAXINT - Number))
      THEN
        OverFlow := TRUE;
      IF NOT OverFlow
      THEN
        BEGIN
          IF (Min > Number) OR (Min = -1)
          THEN
            Min := Number;
          IF (Max < Number) OR (Max = -1)
          THEN
            Max := Number;
        END; 
      NumbersAmount := NumbersAmount + 1;
    END;
  IF NOT OverFlow
  THEN
    BEGIN
      IF NumbersAmount <> 0 
      THEN
        BEGIN
          WRITELN('Min: ', Min);
          WRITELN('Max: ', Max);
          WRITE('Average: ');
          WRITELN(Sum DIV NumbersAmount, '.', Sum MOD NumbersAmount * 100 DIV NumbersAmount)
        END
      ELSE
        WRITELN('Empty File');
    END
  ELSE
    WRITELN('Overflow')
END.
