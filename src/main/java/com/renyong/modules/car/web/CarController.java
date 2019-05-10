package com.renyong.modules.car.web;

import com.renyong.base.util.StringUtil;
import com.renyong.modules.car.model.Car;
import com.renyong.modules.car.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/12 12:28
 * @Description:
 */
@Controller
@RequestMapping("/car/")
public class CarController{
    @Autowired
    private CarService carService;//汽车业务层
    //查询一个
    @ModelAttribute
    public Car get(String id){
        if(StringUtil.isBlank(id)){//新建
            return new Car();
        }
        return carService.get(id);
    }
    @RequestMapping("list")
    public String list(Car car,Model model){
        return "index";
    }
}
