PROGRAM Prime(INPUT, OUTPUT);
CONST
  Min = 2;
  Max = 100;
VAR  
  Sieve: SET OF Min .. Max;
  Count, CountMax, CheckNumber: Min .. Max;
BEGIN {Prime}
  Count := Min;
  CountMax := Max;
  Sieve := [Min .. Max]; 
  WRITE('Простые числа от 2 до ', Max, ': ', Min, ' ');
  WHILE (Count < CountMax)
  DO
    BEGIN
      CheckNumber := Count;
      WHILE CheckNumber <= CountMax
      DO
        BEGIN 
          IF (CheckNumber MOD Count = 0)
          THEN
            Sieve := Sieve - [CheckNumber]; 
          CheckNumber := CheckNumber + 1 
        END;
      WHILE NOT (CountMax IN Sieve)
      DO
        CountMax := CountMax - 1;
      WHILE NOT (Count IN Sieve)
      DO
        Count := Count + 1;
      WRITE(Count, ' ')
    END;
  WRITELN
END.{Prime}
