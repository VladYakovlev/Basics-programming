PROGRAM SortDate(INPUT, OUTPUT);
USES
  OperationDates;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TempFile, DateFile: FileOfDate;
  FInput: TEXT;
BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TempFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  WHILE NOT EOF(FInput)
  DO
  {ѕоместить новую дату в DateFile в соответствующее место}
    BEGIN
      RESET(DateFile);
      ReadDate(FInput, D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {копируем элементы меньшие,чем D из DateFile в TFile}
          REWRITE(TempFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate, D)
              THEN
                WRITE(TempFile, VarDate)
              ELSE
                Copying := FALSE
            END;
          {копируем D в TempFile}
          WRITE(TempFile, D);
          {копируем остаток DateFile в TempFile}
          IF NOT Copying
          THEN
            WRITE(TempFile, VarDate);
          WHILE NOT EOF(DateFile)
          DO
            BEGIN
              READ(DateFile, VarDate);
              WRITE(TempFile, VarDate)
            END;
          {копируем TFile в DateFile}
          RESET(TempFile);
          REWRITE(DateFile);
          WHILE NOT EOF(TempFile)
          DO
            BEGIN
              READ(TempFile, VarDate);
              WRITE(DateFile, VarDate)
            END;
        END;
    END;
  { опируем DateFile в OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile);
END.{SortDate}
