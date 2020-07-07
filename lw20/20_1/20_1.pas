PROGRAM PseudographicPrinting(INPUT, OUTPUT);
CONST
  MinValueOfCoord = 1;
  MaxValueOfCoord = 25;
  MinSymbol = 'A';
  MaxSymbol = 'Z';
TYPE
  Sets = SET OF MinValueOfCoord .. MaxValueOfCoord;
VAR
  Symbol: CHAR;
PROCEDURE PrintSymbolByCoord(VAR FOut: TEXT; VAR Symbol: CHAR);
  VAR
    Indication: INTEGER;
    ProgramError: BOOLEAN;
    SetForTyping: Sets;
  BEGIN
    ProgramError := FALSE;
    CASE Symbol OF
      'A': SetForTyping := [2, 3, 4, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
      'B': SetForTyping := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
      'C': SetForTyping := [2, 3, 4, 5, 6, 11, 16, 22, 23, 24, 25];
      'D': SetForTyping := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
      'E': SetForTyping := [2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 22, 23, 24, 25];
      'F': SetForTyping := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21];
      'G': SetForTyping := [2, 3, 4, 5, 6, 11, 14, 15, 16, 20, 22, 23, 24, 25];
      'H': SetForTyping := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
      'I': SetForTyping := [2, 3, 4, 8, 13, 18, 22, 23, 24];
      'J': SetForTyping := [1, 2, 3, 4, 5, 8, 13, 18, 21, 22];
      'K': SetForTyping := [1, 4, 6, 8, 11, 12, 16, 18, 21, 24];
      'L': SetForTyping := [1, 6, 11, 16, 21, 22, 23, 24, 25];
      'M': SetForTyping := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
      'N': SetForTyping := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
      'O': SetForTyping := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
      'P': SetForTyping := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 21];
      'Q': SetForTyping := [2, 3, 6, 9, 11, 14, 17, 18, 19, 25];
      'R': SetForTyping := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 19, 21, 25];
      'S': SetForTyping := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
      'T': SetForTyping := [1, 2, 3, 4, 5, 8, 13, 18, 23];
      'U': SetForTyping := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
      'V': SetForTyping := [1, 5, 6, 10, 11, 15, 17, 19, 23];
      'W': SetForTyping := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 24];
      'X': SetForTyping := [1, 5, 7, 9, 13, 17, 19, 21, 25];
      'Y': SetForTyping := [1, 5, 7, 9, 13, 18, 23];
      'Z': SetForTyping := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25]
    ELSE
      ProgramError := TRUE
    END;
    IF NOT ProgramError
    THEN
      FOR Indication := MinValueOfCoord TO MaxValueOfCoord
      DO
        BEGIN
          IF Indication IN SetForTyping
          THEN
            WRITE(FOut, '*')
          ELSE
            WRITE(FOut, ' ');
          IF ((Indication MOD 5) = 0)
          THEN
            WRITELN(FOut)
        END
    ELSE
      WRITE(FOut, 'This symbol is not in the typing set.')    
  END;    
BEGIN
  IF NOT EOLN(INPUT)
  THEN
    READ(INPUT, Symbol);
  PrintSymbolByCoord(Output, Symbol)
END.
