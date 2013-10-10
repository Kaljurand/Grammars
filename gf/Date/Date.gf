abstract Date = Number ** {

flags startcat = Date ;

cat
  Date ; Year ; Month ; Day ; Timestamp ; Hour ; Minute ; Weekday ;
  YearNumber ;

fun
  SmallNum : Sub1000 -> YearNumber;

  DFull : Year -> Month -> Day -> Timestamp -> Date ;

  MkYear : YearNumber -> Year ;

  MJan, MFeb, MMar, MApr, MMay, MJun, MJul, MAug, MSep, MOct, MNov, MDec : Month ;

  -- TODO: enumerate all days instead
  MkDay : YearNumber -> Day ;

  MkTime : Hour -> Minute -> Timestamp;

  H00, H01, H02, H03, H04, H05, H06, H07, H08, H09, H10, H11, H12,
  H13, H14, H15, H16, H17, H18, H19, H20, H21, H22, H23 : Hour ;

  M00, M01, M02, M03, M04, M05, M06, M07, M08, M09,
  M10, M11, M12, M13, M14, M15, M16, M17, M18, M19,
  M20, M21, M22, M23, M24, M25, M26, M27, M28, M29,
  M30, M31, M32, M33, M34, M35, M36, M37, M38, M39,
  M40, M41, M42, M43, M44, M45, M46, M47, M48, M49,
  M50, M51, M52, M53, M54, M55, M56, M57, M58, M59 : Minute ;

  WSun, WMon, WTue, WWed, WThu, WFri, WSat : Weekday ;

-- noncanonical ways

  DToday, DYesterday, DTomorrow : Timestamp -> Date ;

}
