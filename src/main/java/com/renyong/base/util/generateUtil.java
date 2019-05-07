package com.renyong.base.util;

import java.util.Random;
import java.util.UUID;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/14 16:30
 * @Description:  生成编码工具类
 */
public class generateUtil {
    private static Random random = new Random(); // 随机数生成器
    private static StringBuffer carID  = new StringBuffer(); // 随机车牌号
    public static String uuid() {//生成uuid
        return UUID.randomUUID().toString().replaceAll("-", "");
    }
    // 车牌号的组成一般为：省份+地区代码+5位数字/字母
    private static String generateCarID() {
        char[] provinceAbbr = { // 省份简称 4+22+5+3
                '京', '津', '沪', '渝',
                '冀', '豫', '云', '辽', '黑', '湘', '皖', '鲁', '苏', '浙', '赣',
                '鄂', '甘', '晋', '陕', '吉', '闽', '贵', '粤', '青', '川', '琼',
                '宁', '新', '藏', '桂', '蒙',
                '港', '澳', '台'
        };
        String alphas = "QWERTYUIOPASDFGHJKLZXCVBNM1234567890"; // 26个字母 + 10个数字
        carID.setLength(0);
        // 省份+地区代码+·  如 湘A· 这个点其实是个传感器，不过加上美观一些
        carID.append(provinceAbbr[random.nextInt(34)]);// 注意：分开加，因为加的是2个char
        carID.append(alphas.charAt(random.nextInt(26)) + "·");
        // 5位数字/字母
        for (int i = 0; i < 5; i++) {
            carID.append(alphas.charAt(random.nextInt(36)));
        }
        return carID.toString();
    }
}
