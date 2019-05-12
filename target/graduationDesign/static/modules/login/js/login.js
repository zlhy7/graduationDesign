//登录部分
function verificationNull(name) { //验证账号密码是否为空
	with(name) {
		if(value == null || value == "") {
			alert("用户名或密码为空");
			return false;
		} else {
			return true;
		}
	}
}
function verificationUser(name) { //验证账号为8~10个数字
	var zheng = /^\d{8,10}$/;
	with(name) {
		if(zheng.test(value)) {
			return true;
		} else {
			alert("用户名输入必须8~10个数字");
			return false;
		}
	}
}
function verification1(zz) {
	with(zz) {
		if(verificationNull(user) == false || verificationNull(pwd) == false) {
			return false;
		} else if(verificationUser(user) == false) {
			return false;
		} else {
			return true;
		}
	}
}
window.onload = function() {
	var reg = document.getElementById("register"); //注册界面
	var show = document.getElementById("show"); //免费注册
	var close = document.getElementById("close"); //注册界面关闭按钮
	var reg_reset = document.getElementById("register_reset");//注册重置按钮
	var inps = document.getElementsByClassName("register_form")[0].getElementsByTagName("input"); //用户名,真实姓名,密码,确认密码,电话
	show.onclick = function() {
		$("#register").fadeIn('slow');
	}
	close.onclick = function() {
		reg.style.display = 'none';
		reg_reset.click();//模拟点击注册重置按钮
	}
	//	出生日期
	var year = document.getElementById("year");
	var month = document.getElementById("month");
	var day = document.getElementById("day");
	var month_day = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
	for(var i = 1990; i <= (new Date()).getYear() + 1900; i++) { //年份设置,最大今年
		year.innerHTML = year.innerHTML + "<option value=" + i + ">" + i + "年</option>";
	}
	for(var i = 1; i < 13; i++) { //月份固定
		month.innerHTML = month.innerHTML + "<option value=" + i + ">" + i + "月</option>";
	}
	function thisMonthDay(month_id) {
		if((year.value % 4 == 0 && year.value % 100 != 0) || year.value % 400 == 0) { //判断平闰年
			month_day[1] = 29;
		} else {
			month_day[1] = 28;
		}
		day.innerHTML = "";
		for(var i = 1; i < month_day[month_id - 1] + 1; i++) { //日,根据年份,月份决定
			day.innerHTML = day.innerHTML + "<option value=" + i + ">" + i + "日</option>";
		}
	}
	thisMonthDay(1); //1990年1月  默认
	year.onchange = function() {
		thisMonthDay(month.value);
	}
	month.onchange = function() {
		thisMonthDay(this.value);
	}
	day.onchange = function() {
		console.log(this.value);
	}
	//地址部分
	var province = document.getElementById("provinces"); //省
	var city = document.getElementById("city"); //市
	var county = document.getElementById("county"); //县
	var citys = ["西安市", "铜川市", "宝鸡市", "咸阳市", "渭南市", "延安市", "汉中市", "榆林市", "安康市", "商洛市"];
	var countys = [
		["新城区", "碑林区", "莲湖区", "灞桥区", "未央区", "雁塔区", "阎良区", "临潼区", "长安区", "高陵区"],
		["宜君县", "王益区", "印台区", "耀州区", "新区"],
		["金台区", "渭滨区", "陈仓区", "凤翔县", "岐山县", "扶风县", "眉县", "陇县", "千阳县", "麟游县", "太白县", "凤县"],
		["秦都区", "渭城区", "杨凌区", "兴平市", "武功县", "泾阳县", "三原县", "礼泉县", "乾县县", "永寿县", "彬县", "长武县", "旬邑县", "淳化县"],
		["临渭区", "华州区", "韩城市", "华阴市", "潼关县", "大荔县", "澄城县", "合阳县", "蒲城县", "富平县", "白水县"],
		["宝塔区", "安塞县", "志丹县", "吴起县", "黄龙县", "黄陵县", "洛川县", "富县", "甘泉县", "延川县", "延长县", "宜川县", "子长县"],
		["汉台区", "南郑区", "城固县", "洋县", "西乡县", "勉县", "宁强县", "略阳县", "镇巴县", "留坝县", "佛坪县"],
		["榆阳区", "横山区", "神木市", "府谷县", "靖边县", "定边县", "绥德县", "米脂县", "佳县", "吴堡县", "清涧县", "子洲县"],
		["汉滨区", "汉阴县", "石泉县", "宁陕县", "紫阳县", "岚皋县", "平利县", "镇坪县", "旬阳县", "白河县"],
		["商州区", "洛南县", "丹凤县", "商南县", "山阳县", "柞水县"]
	];
	province.innerHTML = "<option value='0'>陕西省</option>";//省份
	for(var i = 0; i < citys.length; i++) { //市固定
		city.innerHTML = city.innerHTML + "<option value=" + i + ">" + citys[i] + "</option>";
	}
	function thisCountys(city_id){
		county.innerHTML = "";
		for (var i = 0; i < countys[city_id].length; i++) {
			county.innerHTML = county.innerHTML + "<option value=" + i + ">" + countys[city_id][i] + "</option>";
		}
	}
	thisCountys(0);
	city.onchange = function(){
		thisCountys(this.value);
	}
	//注册部分
	var register_submit = document.getElementById("register_submit");//注册按钮
	
}