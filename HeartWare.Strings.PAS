UNIT HeartWare.Strings;

INTERFACE

USES System.SysUtils;

TYPE
  TextString    = RECORD
                  PRIVATE
                    STR                 : STRING;
                    CLASS FUNCTION      Compare(CONST S1,S2 : STRING) : INTEGER; static; INLINE;
                    CLASS FUNCTION      Equals(CONST S1,S2 : STRING) : BOOLEAN; static;
                    CLASS FUNCTION      Differs(CONST S1,S2 : STRING) : BOOLEAN; static;
                    CLASS FUNCTION      Greater(CONST S1,S2 : STRING) : BOOLEAN; static;
                    CLASS FUNCTION      Less(CONST S1,S2 : STRING) : BOOLEAN; static;
                    CLASS FUNCTION      GreaterOrEqual(CONST S1,S2 : STRING) : BOOLEAN; static;
                    CLASS FUNCTION      LessOrEqual(CONST S1,S2 : STRING) : BOOLEAN; static;
                    CLASS FUNCTION      Contains(CONST S1,S2 : STRING) : BOOLEAN; static;
                  PUBLIC
                    CLASS OPERATOR      Implicit(CONST S : STRING) : TextString; INLINE;
                    CLASS OPERATOR      Implicit(CONST T : TextString) : STRING; INLINE;
                    CLASS OPERATOR      Implicit(CONST T : TextString) : PChar; INLINE;
                    CLASS OPERATOR      Equal(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      Equal(CONST T : TextString ; CONST S : STRING) : BOOLEAN; INLINE;
                    CLASS OPERATOR      Equal(CONST S : STRING ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      NotEqual(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      NotEqual(CONST T : TextString ; CONST S : STRING) : BOOLEAN; INLINE;
                    CLASS OPERATOR      NotEqual(CONST S : STRING ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThan(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThan(CONST T : TextString ; CONST S : STRING) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThan(CONST S : STRING ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThan(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThan(CONST T : TextString ; CONST S : STRING) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThan(CONST S : STRING ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThanOrEqual(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThanOrEqual(CONST T : TextString ; CONST S : STRING) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThanOrEqual(CONST S : STRING ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThanOrEqual(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThanOrEqual(CONST T : TextString ; CONST S : STRING) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThanOrEqual(CONST S : STRING ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(CONST T : TextString ; CONST S : STRING) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(CONST S : STRING ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(C : CHAR ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(CONST T : TextString ; CONST ARR : ARRAY OF STRING) : BOOLEAN;
                    CLASS OPERATOR      LeftShift(CONST T : TextString ; Width : Cardinal) : TextString; INLINE;
                    CLASS OPERATOR      RightShift(CONST T : TextString ; Width : Cardinal) : TextString; INLINE;
                  PUBLIC
                    FUNCTION            IsEmpty : BOOLEAN; INLINE;
                    FUNCTION            POS(CONST SearchFor : STRING ; StartPos : INTEGER = 1) : INTEGER; INLINE;
                    PROCEDURE           INSERT(CONST Source : STRING ; Index : INTEGER); INLINE;
                    PROCEDURE           DELETE(Index,Count : INTEGER); INLINE;
                    FUNCTION            COPY(Index : INTEGER ; Count : INTEGER = MAXINT) : STRING; INLINE;
                  END;

PROCEDURE INSERT(CONST Source : STRING ; VAR Text : TextString ; Index : INTEGER); OVERLOAD; INLINE;
PROCEDURE DELETE(VAR Text : TextString ; Index,Count : INTEGER); OVERLOAD; INLINE;
PROCEDURE INSERT(CONST Source : STRING ; VAR Dest : STRING ; Index : INTEGER); OVERLOAD; INLINE;
PROCEDURE DELETE(VAR S : STRING ; Index,Count : INTEGER); OVERLOAD; INLINE;

IMPLEMENTATION

PROCEDURE INSERT(CONST Source : STRING ; VAR Text : TextString ; Index : INTEGER);
  BEGIN
    System.INSERT(Source,Text.STR,Index)
  END;

PROCEDURE DELETE(VAR Text : TextString ; Index,Count : INTEGER);
  BEGIN
    System.DELETE(Text.STR,Index,Count)
  END;

PROCEDURE INSERT(CONST Source : STRING ; VAR Dest : STRING ; Index : INTEGER);
  BEGIN
    System.INSERT(Source,Dest,Index)
  END;

PROCEDURE DELETE(VAR S : STRING ; Index,Count : INTEGER);
  BEGIN
    System.DELETE(S,Index,Count)
  END;

{ TextString }

CLASS FUNCTION TextString.Compare(CONST S1,S2 : STRING) : INTEGER;
  BEGIN
    Result:=STRING.CompareText(S1,S2)
  END;

CLASS FUNCTION TextString.Contains(CONST S1,S2 : STRING) : BOOLEAN;
  BEGIN
    Result:=(SYSTEM.POS(S1.ToUpper,S2.ToUpper)>0)
  END;

FUNCTION TextString.COPY(Index,Count : INTEGER) : STRING;
  BEGIN
    Result:=System.COPY(STR,Index,Count)
  END;

PROCEDURE TextString.DELETE(Index,Count : INTEGER);
  BEGIN
    System.DELETE(STR,Index,Count)
  END;

CLASS FUNCTION TextString.Differs(CONST S1,S2 : STRING) : BOOLEAN;
  BEGIN
    Result:=NOT Equals(S1,S2)
  END;

CLASS OPERATOR TextString.Equal(CONST S : STRING ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Equals(S,T.STR)
  END;

CLASS FUNCTION TextString.Equals(CONST S1,S2 : STRING): BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)=0)
  END;

CLASS FUNCTION TextString.Greater(CONST S1,S2 : STRING) : BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)>0)
  END;

CLASS FUNCTION TextString.GreaterOrEqual(CONST S1,S2 : STRING) : BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)>=0)
  END;

CLASS OPERATOR TextString.LeftShift(CONST T : TextString ; Width : Cardinal) : TextString;
  BEGIN
    Result.STR:=T.STR.PadRight(Width)
  END;

CLASS FUNCTION TextString.Less(CONST S1,S2 : STRING) : BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)<0)
  END;

CLASS FUNCTION TextString.LessOrEqual(CONST S1,S2 : STRING) : BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)<=0)
  END;

CLASS OPERATOR TextString.LessThan(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Less(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.LessThan(CONST T : TextString ; CONST S : STRING) : BOOLEAN;
  BEGIN
    Result:=Less(T.STR,S)
  END;

CLASS OPERATOR TextString.LessThan(CONST S : STRING ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Less(S,T.STR)
  END;

CLASS OPERATOR TextString.LessThanOrEqual(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=LessOrEqual(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.LessThanOrEqual(CONST T : TextString ; CONST S : STRING) : BOOLEAN;
  BEGIN
    Result:=LessOrEqual(T.STR,S)
  END;

CLASS OPERATOR TextString.LessThanOrEqual(CONST S : STRING ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=LessOrEqual(S,T.STR)
  END;

CLASS OPERATOR TextString.Equal(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Equals(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.Equal(CONST T : TextString ; CONST S : STRING) : BOOLEAN;
  BEGIN
    Result:=Equals(T.STR,S)
  END;

CLASS OPERATOR TextString.GreaterThan(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Greater(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.GreaterThan(CONST T : TextString ; CONST S : STRING) : BOOLEAN;
  BEGIN
    Result:=Greater(T.STR,S)
  END;

CLASS OPERATOR TextString.GreaterThan(CONST S : STRING ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Greater(S,T.STR)
  END;

CLASS OPERATOR TextString.GreaterThanOrEqual(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=GreaterOrEqual(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.GreaterThanOrEqual(CONST T : TextString ; CONST S : STRING) : BOOLEAN;
  BEGIN
    Result:=GreaterOrEqual(T.STR,S)
  END;

CLASS OPERATOR TextString.GreaterThanOrEqual(CONST S : STRING ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=GreaterOrEqual(S,T.STR)
  END;

CLASS OPERATOR TextString.Implicit(CONST T : TextString) : STRING;
  BEGIN
    Result:=T.STR
  END;

CLASS OPERATOR TextString.In(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Contains(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.In(CONST T : TextString ; CONST S : STRING) : BOOLEAN;
  BEGIN
    Result:=Contains(T.STR,S)
  END;

CLASS OPERATOR TextString.In(CONST S : STRING ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Contains(S,T.STR)
  END;

CLASS OPERATOR TextString.NotEqual(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Differs(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.NotEqual(CONST T : TextString ; CONST S : STRING) : BOOLEAN;
  BEGIN
    Result:=Differs(T.STR,S)
  END;

CLASS OPERATOR TextString.NotEqual(CONST S : STRING ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Differs(S,T.STR)
  END;

FUNCTION TextString.POS(CONST SearchFor : STRING ; StartPos : INTEGER = 1) : INTEGER;
  BEGIN
    Result:=SYSTEM.POS(SearchFor.ToUpper,STR.ToUpper)
  END;

CLASS OPERATOR TextString.RightShift(CONST T : TextString ; Width : Cardinal) : TextString;
  BEGIN
    Result.STR:=T.STR.PadLeft(Width)
  END;

CLASS OPERATOR TextString.Implicit(CONST S : STRING) : TextString;
  BEGIN
    Result.STR:=S
  END;

CLASS OPERATOR TextString.Implicit(CONST T : TextString) : PChar;
  BEGIN
    Result:=POINTER(T.STR)
  END;

CLASS OPERATOR TextString.In(C : CHAR ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=(T.POS(C)>0)
  END;

CLASS OPERATOR TextString.In(CONST T : TextString ; CONST ARR : ARRAY OF STRING) : BOOLEAN;
  VAR
    S   : STRING;

  BEGIN
    FOR S IN ARR DO IF T=S THEN EXIT(TRUE);
    Result:=FALSE
  END;

PROCEDURE TextString.INSERT(CONST Source : STRING ; Index : INTEGER);
  BEGIN
    SYSTEM.INSERT(Source,STR,Index)
  END;

FUNCTION TextString.IsEmpty : BOOLEAN;
  BEGIN
    Result:=STR.IsEmpty
  END;

END.
