UNIT HeartWare.Strings;

INTERFACE

USES System.SysUtils,
     HeartWare.Types;

TYPE
  TextString    = RECORD
                  PRIVATE
                    STR                 : LongString;
                    CLASS FUNCTION      Compare(CONST S1,S2 : LongString) : CpuInt; static; INLINE;
                    CLASS FUNCTION      Equals(CONST S1,S2 : LongString) : BOOLEAN; static;
                    CLASS FUNCTION      Differs(CONST S1,S2 : LongString) : BOOLEAN; static;
                    CLASS FUNCTION      Greater(CONST S1,S2 : LongString) : BOOLEAN; static;
                    CLASS FUNCTION      Less(CONST S1,S2 : LongString) : BOOLEAN; static;
                    CLASS FUNCTION      GreaterOrEqual(CONST S1,S2 : LongString) : BOOLEAN; static;
                    CLASS FUNCTION      LessOrEqual(CONST S1,S2 : LongString) : BOOLEAN; static;
                    CLASS FUNCTION      Contains(CONST S1,S2 : LongString) : BOOLEAN; static;
                  PUBLIC
                    CLASS OPERATOR      Implicit(CONST S : LongString) : TextString; INLINE;
                    CLASS OPERATOR      Implicit(CONST T : TextString) : LongString; INLINE;
                    CLASS OPERATOR      Implicit(CONST T : TextString) : PChar; INLINE;
                    CLASS OPERATOR      Equal(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      Equal(CONST T : TextString ; CONST S : LongString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      Equal(CONST S : LongString ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      NotEqual(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      NotEqual(CONST T : TextString ; CONST S : LongString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      NotEqual(CONST S : LongString ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThan(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThan(CONST T : TextString ; CONST S : LongString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThan(CONST S : LongString ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThan(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThan(CONST T : TextString ; CONST S : LongString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThan(CONST S : LongString ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThanOrEqual(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThanOrEqual(CONST T : TextString ; CONST S : LongString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      GreaterThanOrEqual(CONST S : LongString ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThanOrEqual(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThanOrEqual(CONST T : TextString ; CONST S : LongString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      LessThanOrEqual(CONST S : LongString ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(CONST T1,T2 : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(CONST T : TextString ; CONST S : LongString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(CONST S : LongString ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(C : CHAR ; CONST T : TextString) : BOOLEAN; INLINE;
                    CLASS OPERATOR      In(CONST T : TextString ; CONST ARR : ARRAY OF LongString) : BOOLEAN;
                    CLASS OPERATOR      LeftShift(CONST T : TextString ; Width : CpuWord) : TextString; INLINE;
                    CLASS OPERATOR      RightShift(CONST T : TextString ; Width : CpuWord) : TextString; INLINE;
                  PUBLIC
                    FUNCTION            POS(CONST SearchFor : LongString) : CpuWord; INLINE;
                    FUNCTION            IsEmpty : BOOLEAN; INLINE;
                  END;

IMPLEMENTATION

{ TextString }

CLASS FUNCTION TextString.Compare(CONST S1,S2 : LongString) : CpuInt;
  BEGIN
    Result:=STRING.CompareText(S1,S2)
  END;

CLASS FUNCTION TextString.Contains(CONST S1,S2 : LongString) : BOOLEAN;
  BEGIN
    Result:=(SYSTEM.POS(S1.ToUpper,S2.ToUpper)>0)
  END;

CLASS FUNCTION TextString.Differs(CONST S1,S2 : LongString) : BOOLEAN;
  BEGIN
    Result:=NOT Equals(S1,S2)
  END;

CLASS OPERATOR TextString.Equal(CONST S : LongString ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Equals(S,T.STR)
  END;

CLASS FUNCTION TextString.Equals(CONST S1,S2 : LongString): BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)=0)
  END;

CLASS FUNCTION TextString.Greater(CONST S1,S2 : LongString) : BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)>0)
  END;

CLASS FUNCTION TextString.GreaterOrEqual(CONST S1,S2 : LongString) : BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)>=0)
  END;

CLASS OPERATOR TextString.LeftShift(CONST T : TextString ; Width : CpuWord) : TextString;
  BEGIN
    Result.STR:=T.STR.PadRight(Width)
  END;

CLASS FUNCTION TextString.Less(CONST S1,S2 : LongString) : BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)<0)
  END;

CLASS FUNCTION TextString.LessOrEqual(CONST S1,S2 : LongString) : BOOLEAN;
  BEGIN
    Result:=(Compare(S1,S2)<=0)
  END;

CLASS OPERATOR TextString.LessThan(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Less(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.LessThan(CONST T : TextString ; CONST S : LongString) : BOOLEAN;
  BEGIN
    Result:=Less(T.STR,S)
  END;

CLASS OPERATOR TextString.LessThan(CONST S : LongString ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Less(S,T.STR)
  END;

CLASS OPERATOR TextString.LessThanOrEqual(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=LessOrEqual(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.LessThanOrEqual(CONST T : TextString ; CONST S : LongString) : BOOLEAN;
  BEGIN
    Result:=LessOrEqual(T.STR,S)
  END;

CLASS OPERATOR TextString.LessThanOrEqual(CONST S : LongString ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=LessOrEqual(S,T.STR)
  END;

CLASS OPERATOR TextString.Equal(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Equals(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.Equal(CONST T : TextString ; CONST S : LongString) : BOOLEAN;
  BEGIN
    Result:=Equals(T.STR,S)
  END;

CLASS OPERATOR TextString.GreaterThan(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Greater(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.GreaterThan(CONST T : TextString ; CONST S : LongString) : BOOLEAN;
  BEGIN
    Result:=Greater(T.STR,S)
  END;

CLASS OPERATOR TextString.GreaterThan(CONST S : LongString ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Greater(S,T.STR)
  END;

CLASS OPERATOR TextString.GreaterThanOrEqual(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=GreaterOrEqual(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.GreaterThanOrEqual(CONST T : TextString ; CONST S : LongString) : BOOLEAN;
  BEGIN
    Result:=GreaterOrEqual(T.STR,S)
  END;

CLASS OPERATOR TextString.GreaterThanOrEqual(CONST S : LongString ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=GreaterOrEqual(S,T.STR)
  END;

CLASS OPERATOR TextString.Implicit(CONST T : TextString) : LongString;
  BEGIN
    Result:=T.STR
  END;

CLASS OPERATOR TextString.In(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Contains(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.In(CONST T : TextString ; CONST S : LongString) : BOOLEAN;
  BEGIN
    Result:=Contains(T.STR,S)
  END;

CLASS OPERATOR TextString.In(CONST S : LongString ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Contains(S,T.STR)
  END;

CLASS OPERATOR TextString.NotEqual(CONST T1,T2 : TextString) : BOOLEAN;
  BEGIN
    Result:=Differs(T1.STR,T2.STR)
  END;

CLASS OPERATOR TextString.NotEqual(CONST T : TextString ; CONST S : LongString) : BOOLEAN;
  BEGIN
    Result:=Differs(T.STR,S)
  END;

CLASS OPERATOR TextString.NotEqual(CONST S : LongString ; CONST T : TextString) : BOOLEAN;
  BEGIN
    Result:=Differs(S,T.STR)
  END;

FUNCTION TextString.POS(CONST SearchFor : LongString) : CpuWord;
  BEGIN
    Result:=SYSTEM.POS(SearchFor.ToUpper,STR.ToUpper)
  END;

CLASS OPERATOR TextString.RightShift(CONST T : TextString ; Width : CpuWord) : TextString;
  BEGIN
    Result.STR:=T.STR.PadLeft(Width)
  END;

CLASS OPERATOR TextString.Implicit(CONST S : LongString) : TextString;
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

CLASS OPERATOR TextString.In(CONST T : TextString ; CONST ARR : ARRAY OF LongString) : BOOLEAN;
  VAR
    S   : LongString;

  BEGIN
    FOR S IN ARR DO IF T=S THEN EXIT(TRUE);
    Result:=FALSE
  END;

FUNCTION TextString.IsEmpty : BOOLEAN;
  BEGIN
    Result:=STR.IsEmpty
  END;

END.

