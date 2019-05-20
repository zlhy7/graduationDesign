package com.renyong.modules.car.model;

import com.renyong.base.annotation.TableNote;
import com.renyong.base.model.BaseEntity;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/7 14:29
 * @Description: 汽车
 */
@TableNote("汽车")
public class Car extends BaseEntity<Car> {
    private static final long serialVersionUID = 1L;
    private String CD_NAME = "CAR_CD,setCarCd";//第一个用于自动编码，第二个用于反射解析方法
    private String carCd;//车辆编码
    private String carBrand;//品牌
    private String carModel;//型号
    private String carColor;//颜色
    private String carNumber;//车牌号

    public String getCD_NAME() {
        return CD_NAME;
    }

    public void setCD_NAME(String CD_NAME) {
        this.CD_NAME = CD_NAME;
    }

    public String getCarBrand() {
        return carBrand;
    }

    public void setCarBrand(String carBrand) {
        this.carBrand = carBrand;
    }

    public String getCarModel() {
        return carModel;
    }

    public void setCarModel(String carModel) {
        this.carModel = carModel;
    }

    public String getCarColor() {
        return carColor;
    }

    public void setCarColor(String carColor) {
        this.carColor = carColor;
    }

    public String getCarCd() {
        return carCd;
    }

    public void setCarCd(String carCd) {
        this.carCd = carCd;
    }

    public String getBrand() {
        return carBrand;
    }

    public void setBrand(String carBrand) {
        this.carBrand = carBrand;
    }

    public String getModel() {
        return carModel;
    }

    public void setModel(String carModel) {
        this.carModel = carModel;
    }

    public String getColor() {
        return carColor;
    }

    public void setColor(String carColor) {
        this.carColor = carColor;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

}
