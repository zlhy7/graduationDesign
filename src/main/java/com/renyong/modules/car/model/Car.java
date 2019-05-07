package com.renyong.modules.car.model;

import com.renyong.base.model.BaseEntity;

/**
 * @Auther: 任勇勇
 * @Date: 2019/5/7 14:29
 * @Description: 汽车
 */
public class Car extends BaseEntity<Car> {
    private String brand;//品牌
    private String model;//型号
    private String color;//颜色
    private String carNumber;//车牌号
    public Car() {}
    public Car(String brand, String model, String color, String carNumber) {
        this.brand = brand;
        this.model = model;
        this.color = color;
        this.carNumber = carNumber;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getCarNumber() {
        return carNumber;
    }

    public void setCarNumber(String carNumber) {
        this.carNumber = carNumber;
    }

}
