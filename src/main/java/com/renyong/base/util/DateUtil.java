package com.renyong.base.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:41
 * @Description:
 */
public class DateUtil {
    private static SimpleDateFormat sdf;
    public static String formatDate(Date date,String format){
        sdf = new SimpleDateFormat(format);
        String dateStr = sdf.format(date);
        return dateStr;
    }
}
