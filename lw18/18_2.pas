PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  SecondName: TEXT;
  Ch: CHAR;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      REWRITE(SecondName);
      READ(INPUT, Ch);
      WRITE(SecondName, Ch);
      WHILE (Ch <> ' ') 
      DO
        BEGIN
          READ(INPUT, Ch);
          WRITE(SecondName, Ch);
        END; 
      WHILE WhichScore <= NumberOfScores 
      DO
        BEGIN
          READ(NextScore);
          IF (NextScore <= 100) AND (NextScore >= 0)
          THEN
            BEGIN
              TotalScore := TotalScore + NextScore;
              WhichScore := WhichScore + 1
            END
          ELSE
            BEGIN
              WRITE('Введеное число не находится в диапозоне от 0 до 100');
              EXIT
            END;
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      RESET(SecondName);
      IF Ave MOD 10 >= 5
      THEN
        BEGIN 
          Student := Student + 1;
          WHILE NOT EOLN(SecondName)
          DO
            BEGIN
              READ(SecondName, Ch);
              WRITE(OUTPUT, Ch);
            END;
          WRITELN(Ave DIV 10 + 1)
        END 
      ELSE
        BEGIN
          Student := Student + 1;
          WHILE NOT EOLN(SecondName)
          DO
            BEGIN
              READ(SecondName, Ch);
              WRITE(OUTPUT, Ch);
            END;
          WRITELN(Ave DIV 10);
        END;
      ClassTotal := ClassTotal + TotalScore;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize *NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10)
END.  {AverageScore}

