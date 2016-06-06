package com.hooper.hoshop.common.util;

import com.hooper.hoshop.common.constant.WebConstant;
import com.hooper.hoshop.dto.count.DateCounter;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 47123 on 2016/5/13.
 */
public class DateUtil {

    public static Date StrToDate(String str) {

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        Date date = null;
        try {
            date = format.parse(str);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }

    /**
     * 获取指定日期的字符串
     *
     * @param aDate
     * @param aFormat
     * @return
     */
    public static String getFormatDate(Date aDate, String aFormat) {

        SimpleDateFormat tDateF = null;
        if (aFormat == null) {
            tDateF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        } else if ("".equals(aFormat)) {
            tDateF = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        } else {
            tDateF = new SimpleDateFormat(aFormat);
        }

        return tDateF.format(aDate);
    }

    /**
     * 按照年月日比较两个 日期时间的大小
     *
     * @param dt1
     * @param dt2
     * @return
     */
    public static int compareDate(Date dt1, Date dt2) {

        Calendar cal1 = Calendar.getInstance();
        cal1.setTime(dt1);

        Calendar cal2 = Calendar.getInstance();
        cal2.setTime(dt2);

        int y1 = cal1.get(Calendar.YEAR);
        int m1 = cal1.get(Calendar.MONTH);
        int d1 = cal1.get(Calendar.DAY_OF_MONTH);

        int y2 = cal2.get(Calendar.YEAR);
        int m2 = cal2.get(Calendar.MONTH);
        int d2 = cal2.get(Calendar.DAY_OF_MONTH);

        if (y1 > y2) {
            return 1;

        } else if (y1 == y2) {
            if (m1 > m2) {
                return 1;

            } else if (m1 == m2) {
                if (d1 > d2) {
                    return 1;
                } else if (d1 == d2) {

                    return 0;
                } else {
                    return -1;

                }

            } else {
                return -1;
            }

        } else {
            return -1;
        }

    }

    /**
     * 获得当前年份
     *
     * @return 当前年份，格式如：2003
     */
    public static int getCurrentYear() {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");
        return Integer.parseInt(sdf.format(new java.util.Date()));
    }

    public static int getCurrentYear(Date date) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy");
        return Integer.parseInt(sdf.format(date));
    }

    public static int getCurrentMonth(Date date) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("M");
        return Integer.parseInt(sdf.format(date));
    }

    public static int getCurrentDay(Date date) {
        Calendar calendar = Calendar.getInstance();

        calendar.setTime(date);
        return calendar.get(Calendar.DATE);
    }

    /**
     * 获得当前月份
     *
     * @return 当前月份
     */
    public static int getCurrentMonth() {
        return getCurrentMonth("M");
    }

    /**
     * 获得当前月份
     *
     * @return 当前月份
     */
    public static int getCurrentMonth(String format) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);
        return Integer.parseInt(sdf.format(new java.util.Date()));
    }

    /**
     * 获得当前天
     *
     * @return 当前天
     */
    public static int getCurrentDay() {
        Calendar calendar = Calendar.getInstance();

        return calendar.get(Calendar.DATE);
    }

    public static Date transMillis2Date(long millis) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(millis);
        return calendar.getTime();
    }

    /**
     * 获得形如 1977-06-08 2:20 格式的当前年月日
     *
     * @return 当前年月日
     */
    public static String getCurrentDateTime() {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd H:mm");
        return sdf.format(new Date());
    }

    /**
     * 获得形如 19770608 12:12:12 格式的当前年月日
     *
     * @return 当前年月日
     */
    public static String getSimpleCurrentDate() {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyyMMdd HH:mm:ss");
        return sdf.format(new java.util.Date());
    }

    /**
     * 判断字符串是否符合日期格式
     *
     * @param strDate 字符串时间
     * @return
     */
    public static boolean isDate(String strDate) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        sdf.setLenient(false);
        try {
            sdf.parse(strDate);
            return true;
        } catch (ParseException ex) {
            return false;
        }
    }

    /**
     * 判断字符串是否符合日期格式
     *
     * @param strDate 字符串时间
     * @return
     */
    public static Date StringToDate(String strDate) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        sdf.setLenient(false);

        Date temp = null;
        try {
            temp = sdf.parse(strDate);

        } catch (ParseException ex) {
            return null;
        }

        return temp;
    }

    public static Date StringToDate(String strDate, String format) {
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(format);
        sdf.setLenient(false);

        Date temp = null;
        try {
            temp = sdf.parse(strDate);

        } catch (ParseException ex) {
            return null;
        }

        return temp;
    }

    /**
     * 返回两个日期相差天数,默认返回大的天数
     *
     * @param d1 日期
     * @param d2 日期
     * @return 天数
     */
    public static int diffDate(Date d1, Date d2) {
        if ((d1 == null) || (d2 == null))
            return 0;

        Calendar cal = Calendar.getInstance();

        int zoneoffset = cal.get(Calendar.ZONE_OFFSET);
        int dstoffset = cal.get(Calendar.DST_OFFSET);

        long dl1 = d1.getTime() + zoneoffset + dstoffset;
        long dl2 = d2.getTime() + zoneoffset + dstoffset;

        int intDaysFirst = (int) (dl1 / (60 * 60 * 1000 * 24)); // 60*60*1000
        int intDaysSecond = (int) (dl2 / (60 * 60 * 1000 * 24));

        return intDaysFirst > intDaysSecond ? intDaysFirst - intDaysSecond
                : intDaysSecond - intDaysFirst;
    }

    /**
     * 将给定的时间转换为格式是8位的字符串
     *
     * @param date 给定的时间
     * @return 格式化后的字符串形式的时间
     */
    public static String get8BitDate(java.util.Date date) {
        if (date == null) {
            return "";
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyyMMdd");
        return sdf.format(date);
    }

    public static String get6BitDate(java.util.Date date) {
        if (date == null) {
            return "";
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyMMdd");
        return sdf.format(date);
    }

    /**
     * 将给定的时间转换为格式是10位的字符串
     *
     * @param date 给定的时间
     * @return 格式化后的字符串形式的时间
     */
    public static String get10BitDate(java.util.Date date) {

        if (date == null) {
            return "";
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        return sdf.format(date);
    }

    /**
     * 将给定的yyyymmdd时间转换为格式转为yyyy-mm-dd的字符串
     *
     * @param strDate 给定的时间
     * @return 格式化后的字符串形式的时间
     */
    public static String get8ByteTo10Byte(String strDate) {
        if (strDate == null) {
            return "";
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyyMMdd");
        java.text.SimpleDateFormat sdf2 = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        Date d = null;
        try {
            d = sdf.parse(strDate);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        return sdf2.format(d);
    }

    /***************************************************************************
     * 根据月份获取当月的天数 不考虑闰年？？
     *
     * @param month
     * @return
     */
    public int getdayformonth(int month) {
        int a = 0;
        switch (month) {
            case 1:
                a = 31;
                break;
            case 2:
                a = 28;
                break;
            case 3:
                a = 31;
                break;
            case 4:
                a = 30;
                break;
            case 5:
                a = 31;
                break;
            case 6:
                a = 30;
                break;
            case 7:
                a = 31;
                break;
            case 8:
                a = 31;
                break;
            case 9:
                a = 30;
                break;
            case 10:
                a = 31;
                break;
            case 11:
                a = 30;
                break;
            case 12:
                a = 31;
                break;
            default:

        }
        return a;
    }

    /**
     * 指定月份天数
     *
     * @param year
     * @param month
     * @return
     */
    public static int getDaysOfMonth(int year, int month) {
        int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
        if (2 == month && 0 == (year % 4)
                && (0 != (year % 100) || 0 == (year % 400))) {
            days[1] = 29;
        }
        return (days[month - 1]);
    }

    /**
     * 比较日期1是否大于等于日期2
     *
     * @param s1 日期1
     * @param s2 日期2
     * @return
     */
    public static boolean yearMonthGreatEqual(String s1, String s2) {
        String temp1 = s1.substring(0, 4);
        String temp2 = s2.substring(0, 4);
        String temp3 = s1.substring(4, 6);
        String temp4 = s2.substring(4, 6);
        if (Integer.parseInt(temp1) > Integer.parseInt(temp2))
            return true;
        if (Integer.parseInt(temp1) == Integer.parseInt(temp2))
            return Integer.parseInt(temp3) >= Integer.parseInt(temp4);

        return false;
    }

    /**
     * 判断当前日期是星期几
     *
     * @param WeekDate
     * @return
     */
    public static int getWeek(String WeekDate) {
        Date dat = strToDate(WeekDate);
        Calendar cal = Calendar.getInstance();
        cal.setTime(dat);
        int w = cal.get(java.util.Calendar.DAY_OF_WEEK) - 1;
        if (w == 0)
            w = 7;
        return w;
    }

    /*
     * 利用一个字符串生成一个日期类型的对象
     */
    public static Date strToDate(String date) {
        Date d = null;
        if ((date != null) && (!"".equals(date))) {

            SimpleDateFormat tDateF = new SimpleDateFormat("yyyy-MM-dd");
            try {
                d = tDateF.parse(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        return d;
    }

	/*
     * public static void main(String args[]) {
	 *
	 * System.out.println( toDate("2011-07-16 17:24:36"));
	 *
	 * }
	 */

    /**
     * 获取 WeekDate之后5天的日期
     *
     * @param WeekDate
     * @param value
     * @return
     */

    public static String getAfterDay(String WeekDate, int value) {
        Date dat = strToDate(WeekDate);
        GregorianCalendar gc = new GregorianCalendar();
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        gc.setTime(dat);
        gc.add(5, value);
        gc.set(gc.get(Calendar.YEAR), gc.get(Calendar.MONTH), gc
                .get(Calendar.DATE));
        return sf.format(gc.getTime());
    }

    public static String getAfterDay(int value) {
        java.util.Calendar ca = java.util.Calendar.getInstance();
        ca.add(Calendar.DAY_OF_MONTH, value);
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        String result = sdf.format(ca.getTime());
        return result;
    }

    /**
     * 取得当月第一天，如：2010-03-01
     */
    public static String getFirstDayOfCurMonth() {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_MONTH, c.getActualMinimum(Calendar.DAY_OF_MONTH));
        Date date = c.getTime();
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }

    public static String gerLastDayOfCurMonth(Date crdate) {
        Calendar c = Calendar.getInstance();
        c.setTime(crdate);
        c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
        Date date = c.getTime();
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }

    /**
     * 取得当月最后一天，如：2010-03-31
     */
    public static String getLastDayOfCurMonth() {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.DAY_OF_MONTH, c.getActualMaximum(Calendar.DAY_OF_MONTH));
        Date date = c.getTime();
        return new SimpleDateFormat("yyyy-MM-dd").format(date);
    }

    /**
     * 取得格式化日期
     */
    public static String getFormatDate() {
        return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    /**
     * 取得格式化日期
     */
    public static Date getFormatDate(String date) {

        SimpleDateFormat st = new SimpleDateFormat("yyyy-MM-dd");

        Date reDate = null;

        try {
            reDate = st.parse(date);

        } catch (ParseException e) {

            e.printStackTrace();
        }

        return reDate;

    }

    /**
     * 取得格式化日期
     */
    public static String getYYYYMMDate() {
        return new SimpleDateFormat("yyyy-MM").format(new Date());
    }

    /**
     * 判断日期是否当前日期
     *
     * @param date
     * @return
     */
    public static boolean isCurrentDate(String date) {

        boolean b = false;

        Calendar calendar = Calendar.getInstance();

        String year = calendar.get(Calendar.YEAR) + "";
        String month = calendar.get(Calendar.MONTH) + 1 + "";

        if (month.length() == 1)
            month = "0" + month;
        String day = calendar.get(Calendar.DATE) + "";

        if (date == null)
            b = false;
        else {
            String yearStr = date.substring(0, 4);
            String monthStr = date.substring(5, 7);
            String dayStr = date.substring(8, 10);

            if (year.equals(yearStr) && month.equals(monthStr)
                    && day.equals(dayStr)) {

                b = true;
            } else {
                b = false;
            }
        }

        return b;
    }

    /**
     * 获得前一天的日期
     *
     * @return
     */
    public static String getBeforDay() {
        java.util.Calendar ca = java.util.Calendar.getInstance();
        ca.add(Calendar.DATE, -1);
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        String result = sdf.format(ca.getTime());
        return result;
    }

    public static String getBeforDay(int day) {
        java.util.Calendar ca = java.util.Calendar.getInstance();
        ca.add(Calendar.DATE, day);
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        String result = sdf.format(ca.getTime());
        return result;
    }

    public static Map<String, Long> getBeforDay_Long() {

        Map<String, Long> result = new HashMap<String, Long>();

        java.util.Calendar ca = Calendar.getInstance();
        ca.add(Calendar.DAY_OF_MONTH, -1);

        ca.set(Calendar.HOUR_OF_DAY, 0);
        ca.set(Calendar.MINUTE, 0);
        ca.set(Calendar.SECOND, 0);

        java.util.Calendar ca1 = Calendar.getInstance();
        ca1.add(Calendar.DAY_OF_MONTH, -1);

        ca1.set(Calendar.HOUR_OF_DAY, 23);
        ca1.set(Calendar.MINUTE, 59);
        ca1.set(Calendar.SECOND, 59);

        result.put("start", (ca.getTimeInMillis() / 1000));

        result.put("end", (ca1.getTimeInMillis() / 1000));

        return result;
    }

    public static String getBeforMonth(int mon) {
        java.util.Calendar ca = java.util.Calendar.getInstance();
        ca.setTime(DateUtil.getFormatDate(DateUtil
                .getFirstDayOfCurMonth()));
        ca.add(Calendar.MONTH, mon);
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(
                "yyyy-MM-dd");
        String result = sdf.format(ca.getTime());
        return result;
    }

    public static Date getRandMonth(Date time, int mon) {

        java.util.Calendar ca = java.util.Calendar.getInstance();

        ca.setTime(time);

        int day = ca.get(Calendar.DAY_OF_MONTH);

        ca.add(Calendar.MONTH, mon);

        ca.set(Calendar.DAY_OF_MONTH, day);

        return ca.getTime();
    }

    public static long[] getDuringDay(String date, int type) {

        long t[] = new long[2];

        if (type == 0) {
            // 指定日期查询
            Date d = getFormatDate(date);
            java.util.Calendar ca = java.util.Calendar.getInstance();
            ca.setTime(d);
            ca.set(Calendar.HOUR_OF_DAY, 0);
            ca.set(Calendar.MINUTE, 0);
            ca.set(Calendar.SECOND, 0);
            long t1 = ca.getTimeInMillis();
            ca.set(Calendar.HOUR_OF_DAY, 23);
            ca.set(Calendar.MINUTE, 59);
            ca.set(Calendar.SECOND, 59);
            long t2 = ca.getTimeInMillis();

            t[0] = t1;
            t[1] = t2;
        } else if (type == 1) {
            // 取最近一星期
            java.util.Calendar ca = java.util.Calendar.getInstance();

            long t1 = ca.getTimeInMillis();

            ca.add(Calendar.DAY_OF_MONTH, -7);

            long t2 = ca.getTimeInMillis();

            t[0] = t1;
            t[1] = t2;

        } else if (type == 2) {
            // 取最近一个月
            java.util.Calendar ca = java.util.Calendar.getInstance();

            long t1 = ca.getTimeInMillis();

            ca.add(Calendar.MONTH, -1);

            long t2 = ca.getTimeInMillis();
            t[0] = t1;
            t[1] = t2;

        } else if (type == 3) {
            // 取最近三个月的数据
            java.util.Calendar ca = java.util.Calendar.getInstance();

            long t1 = ca.getTimeInMillis();

            ca.add(Calendar.MONTH, -3);

            long t2 = ca.getTimeInMillis();
            t[0] = t1;
            t[1] = t2;
        }

        return t;

    }

    /**
     * 获取小时分钟中的小时
     *
     * @param a
     * @return
     */

    public final static String getHour(String a) // 获得小时
    {
        String[] temp = a.split(":");

        if (temp[0].equals("-1"))
            return "-1";

        int hour = 0;

        try {
            SimpleDateFormat df = new SimpleDateFormat("HH:mm");
            Date da = df.parse(a);
            Calendar MyDate = Calendar.getInstance();
            MyDate.setTime(da);
            hour = MyDate.get(Calendar.HOUR_OF_DAY);
        } catch (Exception e) {
        }

        return String.valueOf(hour);
    }

    /**
     * 获取小时分钟中的分钟
     *
     * @param a
     * @return
     */
    public final static String getMinute(String a) // 获得分钟
    {

        String[] temp = a.split(":");

        if (temp[1].equals("-1"))
            return "-1";

        int minute = 0;

        try {
            SimpleDateFormat df = new SimpleDateFormat("HH:mm");
            Date da = df.parse(a);
            Calendar MyDate = Calendar.getInstance();
            MyDate.setTime(da);
            minute = MyDate.get(Calendar.MINUTE);
        } catch (Exception e) {
        }

        return String.valueOf(minute);
    }

    /**
     * 操作传入日期前后翻的天数
     *
     * @param date
     * @param day
     * @return
     */
    public static Date addDay(Date date, int day) {

        Calendar cal = Calendar.getInstance();

        cal.setTime(date);

        cal.add(Calendar.DAY_OF_MONTH, day);

        return cal.getTime();

    }

    /**
     * 获取当前月的上个月的第一天和最后一天
     *
     * @return
     */
    public static Map<String, Long> get_before_month_days() {

        Calendar calendar = Calendar.getInstance();

        int month = calendar.get(Calendar.MONTH);

        calendar.set(Calendar.MONTH, month);
        calendar.set(Calendar.DAY_OF_MONTH, calendar
                .getActualMaximum(Calendar.DAY_OF_MONTH));
        Date date = calendar.getTime();

        return getFirstday_Lastday_Month(date);
    }

    /**
     * 获取指定的月份的上个月的第一天和最后一天
     *
     * @param date
     * @return
     */
    public static Map<String, Long> getFirstday_Lastday_Month(Date date) {

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(Calendar.HOUR_OF_DAY, 23);
        calendar.set(Calendar.MINUTE, 59);
        calendar.set(Calendar.SECOND, 59);
        calendar.add(Calendar.MONTH, -1);
        Date theDate = calendar.getTime();

        // 上个月第一天
        GregorianCalendar gcLast = (GregorianCalendar) Calendar.getInstance();
        gcLast.setTime(theDate);
        gcLast.set(Calendar.DAY_OF_MONTH, 1);
        gcLast.set(Calendar.HOUR_OF_DAY, 0);
        gcLast.set(Calendar.MINUTE, 0);
        gcLast.set(Calendar.SECOND, 0);

        // 上个月最后一天
        calendar.add(Calendar.MONTH, 1); // 加一个月
        calendar.set(Calendar.DATE, 1); // 设置为该月第一天
        calendar.add(Calendar.DATE, -1); // 再减一天即为上个月最后一天

        Map<String, Long> map = new HashMap<String, Long>();
        map.put("frist", gcLast.getTime().getTime() / 1000);
        map.put("last", calendar.getTime().getTime() / 1000);
        return map;
    }

    // 获取当前时间是周几
    public static int getCurrentWeekDay() {

        Calendar cal = Calendar.getInstance();

        return cal.get(Calendar.DAY_OF_WEEK);

    }

    // 获取当前时间是当月第几号
    public static int getCurrentMonthDay() {

        Calendar cal = Calendar.getInstance();

        return cal.get(Calendar.DAY_OF_MONTH);

    }

    private static final int FIRST_DAY = Calendar.MONDAY;
    private static final int FIRST_MONTH = Calendar.JANUARY;

    //获取本周时间
    public static long[] getWeekdays() {
        long[] times = new long[7];
        Calendar calendar = Calendar.getInstance();
        long hourMills = calendar.get(Calendar.HOUR_OF_DAY) * 3600000L;
        long minusMills = calendar.get(Calendar.MINUTE) * 60000L;
        long secondMills = calendar.get(Calendar.SECOND) * 1000L;
        while (calendar.get(Calendar.DAY_OF_WEEK) != FIRST_DAY) {
            calendar.add(Calendar.DATE, -1);
        }
        for (int i = 0; i < 7; i++) {
            times[i] = calendar.getTimeInMillis() - (hourMills + minusMills + secondMills);
            calendar.add(Calendar.DATE, 1);
        }
        return times;
    }

    //获取本年月时间
    public static long[] getMonthsOfYearMills() {
        long[] times = new long[12];
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMinimum(Calendar.DAY_OF_MONTH));
        long hourMills = calendar.get(Calendar.HOUR_OF_DAY) * 3600000L;
        long minusMills = calendar.get(Calendar.MINUTE) * 60000L;
        long secondMills = calendar.get(Calendar.SECOND) * 1000L;
        calendar.setTimeInMillis(calendar.getTimeInMillis() - (hourMills + minusMills + secondMills));
        while (calendar.get(Calendar.MONTH) != FIRST_MONTH) {
            calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) - 1);
        }
        for (int i = 0; i < 12; i++) {
            times[i] = calendar.getTimeInMillis();
            calendar.set(Calendar.MONTH, calendar.get(Calendar.MONTH) + 1);
        }
        return times;
    }

    // 获取当前时间是周几
    public static int getWeekDay(long mills) {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(mills - DateUtil.getOneDayMills() * 1);
        return cal.get(Calendar.DAY_OF_WEEK);
    }

    public static long getOneDayMills() {
        return 86399000L;//23:59:59
    }

    public static long getLastMonthMills() {
        return 2678400000L;//31days mills
    }

    public static void main(String[] args) {
        TreeSet set = new TreeSet();
        set.add(1);
        set.add(2);
        set.add(3);
        System.out.println(set.contains(3));
        System.out.println(set.contains(4));
    }
}
