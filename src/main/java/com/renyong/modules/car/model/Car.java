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
    private String carCd;//车辆编码
    private String carBrand;//品牌
    private String carModel;//型号
    private String carColor;//颜色
    private String carNumber;//车牌号
    public Car() {}
    public Car(String carBrand, String carModel, String carColor, String carNumber) {
        this.carBrand = carBrand;
        this.carModel = carModel;
        this.carColor = carColor;
        this.carNumber = carNumber;
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
