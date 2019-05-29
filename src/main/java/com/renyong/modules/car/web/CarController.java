package com.renyong.modules.car.web;

import com.github.pagehelper.PageInfo;
import com.renyong.base.util.GenerateUtil;
import com.renyong.base.util.StringUtil;
import com.renyong.base.web.BaseController;
import com.renyong.modules.car.model.Car;
import com.renyong.modules.car.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.PrintWriter;
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
    public String list(Car car,Model model){
        PageInfo<Car> page = carService.findPage(car);
        model.addAttribute("car",car);//条件
        model.addAttribute("page",page);//记录行
        model.addAttribute("pagingBar",getPagingBar(page));//分页栏
//        model.addAttribute("autocompleteData",getUserRealName(page.getList()));//自动完成框数据源
        return "modules/car/car_list";
    }
    //增加或修改记录行
    @RequestMapping("save")
    public String save(Car car){
        if(StringUtil.isBlank(car.getId())){//添加
            carService.insert(car);
        }else{//修改
            carService.update(car);
        }
        return "redirect:list";
    }
    //去往表单页面
    @RequestMapping("fromconfig")
    public String formCfg(Car car,Model model){
        if(StringUtil.isBlank(car.getId())){
            String code = GenerateUtil.getAutoCd("CAR_CD");
            car.setCarCd(code);
        }
        model.addAttribute("car",car);
        return "modules/car/car_form";
    }
    //删除某记录
    @RequestMapping("remove")
    public String remove(Car car){
        carService.delete(car);
        return "redirect:list";
    }
    //获取全部名称供页面自动完成框使用
    public String getUserRealName(List<Car> carList){
        StringBuffer sb = new StringBuffer("[");
        /*for (Car car:carList){
            if(sb.indexOf(car.getRealName())==-1){//已存在
                sb.append("'"+car.getRealName()+"',");
            }
        }
        if(sb.length()>1){
            sb.deleteCharAt(sb.length()-1);
        }
        sb.append("]");*/
        return sb.toString();
    }
}
