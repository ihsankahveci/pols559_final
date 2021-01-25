library(lubridate)

ramadan_dates = list(
  ram01 = interval("2001-11-16", "2001-12-18"),
  ram02 = interval("2002-11-06", "2002-12-04"),
  ram03 = interval("2003-10-27", "2003-11-27"),
  ram04 = interval("2004-10-15", "2004-11-16"),
  ram05 = interval("2005-10-05", "2005-11-05"),
  ram06 = interval("2006-09-24", "2006-10-25"),
  ram07 = interval("2007-09-13", "2007-10-14"),
  ram08 = interval("2008-09-01", "2008-10-02"),
  ram09 = interval("2009-08-21", "2009-09-22"),
  ram10 = interval("2010-08-10", "2010-09-11"),
  ram11 = interval("2011-08-01", "2011-09-02"),
  ram12 = interval("2012-07-20", "2012-08-21"),
  ram13 = interval("2013-07-09", "2013-08-10"),
  ram14 = interval("2014-06-28", "2014-07-30"),
  ram15 = interval("2015-06-18", "2015-07-19"),
  ram16 = interval("2016-06-06", "2016-07-07"),
  ram17 = interval("2017-05-27", "2017-06-27"),
  ram18 = interval("2018-05-16", "2018-06-17"),
  ram19 = interval("2019-05-06", "2019-06-07"),
  ram20 = interval("2020-04-24", "2020-05-26"))


sacrifice_dates = list(
  sac01 = interval("2001-03-05", "2001-03-09"),
  sac02 = interval("2002-02-22", "2002-02-25"),
  sac03 = interval("2003-02-11", "2003-02-15"),
  sac04 = interval("2004-02-01", "2004-02-04"),
  sac05 = interval("2005-01-20", "2005-01-23"),
  sac06 = interval("2006-01-10", "2006-01-13"),
  sac07 = interval("2007-12-20", "2007-12-23"),
  sac08 = interval("2008-12-08", "2008-12-11"),
  sac09 = interval("2009-11-27", "2009-11-30"),
  sac10 = interval("2010-11-16", "2010-11-19"),
  sac11 = interval("2011-11-04", "2011-11-09"),
  sac12 = interval("2012-10-25", "2012-10-28"),
  sac13 = interval("2013-10-15", "2013-10-18"),
  sac14 = interval("2014-10-03", "2014-10-07"),
  sac15 = interval("2015-09-24", "2015-09-27"),
  sac16 = interval("2016-09-11", "2016-09-15"),
  sac17 = interval("2017-09-01", "2017-09-04"),
  sac18 = interval("2018-08-20", "2018-08-24"),
  sac19 = interval("2019-08-09", "2019-08-14"),
  sac20 = interval("2020-07-31", "2020-08-03"))



save(ramadan_dates, sacrifice_dates, file = "preprocessing/holy_dates.RData")

