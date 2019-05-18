package com.renyong.modules.car.web;

import com.github.pagehelper.PageInfo;
import com.renyong.base.util.GenerateUtil;
import com.renyong.base.util.StringUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.car.model.Car;
import com.renyong.modules.car.service.CarService;
import com.renyong.modules.sys.service.SysAutoGenerateCodingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Auther: 任勇勇
 * @Date: 2019/4/12 12:28
 * @Description:
 */
@Controller
@RequestMapping("/car/")
public class CarController extends BaseController<CarService>{
    @Autowired
    private CarService carService;//汽车业务层
    @Autowired
    private SysAutoGenerateCodingService sysAutoGenerateCodingService;//自动编码类
    //查询一个
    @ModelAttribute("car")
    public Car get(String id){
        if(StringUtil.isBlank(id)){//新建
            return new Car();
        }
        return carService.get(id);
    }
    //去往列表页面
    @RequestMapping("list")
    public String list(Car car, Model model){
        PageInfo<Car> page = carService.findPage(car);
//        String a = GenerateUtil.getAutoCd("CAR_CD");
        model.addAttribute("car",car);//条件
        model.addAttribute("page",page);//记录行
        model.addAttribute("pagingBar",getPagingBar(page));//分页栏
        return "index";
    }
    //增加或修改记录行
    @RequestMapping("save")
    public String save(Car car){
        if(StringUtil.isBlank(car.getId())){//添加
            carService.insert(car);
        }else{//修改
            carService.update(car);
        }
        return "index";
    }
    //去往表单页面
    @RequestMapping("fromconfig")
    public String formCfg(Car car,Model model){
        return "index";
    }
    //删除某记录
    @RequestMapping("remove")
    public String remove(Car car){
        carService.delete(car);//逻辑删除
        return "index";
    }

}
