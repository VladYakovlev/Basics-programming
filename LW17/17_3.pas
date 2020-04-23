PROGRAM Stat(INPUT, OUTPUT);
VAR
  Number, Average, Min, Max, NumbersAmount, Sum: INTEGER;
  OverFlow: BOOLEAN;
PROCEDURE ReadDigit(VAR InFile: TEXT; VAR Digit: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  Digit := -1;
  IF NOT EOLN(InFile)
  THEN
    BEGIN
      READ(InFile ,Ch);
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
PROCEDURE ReadNumber(VAR InFile: TEXT; VAR Number: INTEGER);
VAR
  Digit: INTEGER;
  NumFile: TEXT;
  OverFlow: BOOLEAN;
BEGIN{ReadNumber}
  Number := 0;
  OverFlow := FALSE;
  ReadDigit(InFile, Digit);
  REWRITE(NumFile);
  WHILE (Digit <> -1 ) AND ( NOT OverFlow)
  DO
    BEGIN
      IF Digit <> -1 
      THEN
        BEGIN
          IF (MAXINT DIV 10 < Number) OR (MAXINT DIV 10 = Number) AND (MAXINT MOD 10 < Digit)
          THEN
            OverFlow := TRUE
          ELSE
            BEGIN
              WRITE(NumFile, Digit);
              RESET(NumFile);
              READ(NumFile, Number);
              ReadDigit(InFile, Digit);
            END
        END;
      IF OverFlow = TRUE
      THEN
        Number := -1; 
    END;
END;{ReadNumber}
BEGIN
  ReadNumber(INPUT, Min);
  IF Min = -1 
  THEN 
    OverFlow := TRUE
  ELSE
    OverFlow := FALSE;
  Max := Min;
  Sum := Min;
  Average := 0;
  NumbersAmount := 1;
  WHILE (NOT EOF(INPUT)) AND (OverFlow = FALSE)
  DO
    BEGIN
      ReadNumber(INPUT, Number);
      IF Number = -1
      THEN
        OverFlow := TRUE;
      IF (Sum > (MAXINT - Number))
      THEN
        OverFlow := TRUE
      ELSE
        Sum := Sum + Number;
      IF NOT OverFlow
      THEN
        BEGIN
          IF Number < Min
          THEN
            Min := Number;
          IF Number > Max
          THEN
            Max := Number
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
