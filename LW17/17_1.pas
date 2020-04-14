PROGRAM SumDigits(INPUT, OUTPUT);
VAR
  Sum, Digit: INTEGER;
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
BEGIN
  Sum := 0;
  ReadDigit(INPUT, Digit);
  WHILE Digit <> -1
  DO
    BEGIN
      IF Digit <> -1 
      THEN
        Sum := Sum + Digit;
      ReadDigit(INPUT, Digit);  
    END;
  WRITELN('Сумма цифр: ', Sum); 
END.
