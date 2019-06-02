//返回json数组某一属性的集合，参数1：json数组，参数2：要返回的属性名
function getPropertyArr(data, propertyName) {
    var arr1 = [];
    for (var i = 0; i < data.length; i++) {
        arr1.push(data[i][propertyName]);
    }
    return arr1;
}

/**
 *  json[{key:arr}...{key:arr}]转换为[arr...arr]
 */
function jsonToArr(arr) {
    var targetArr = [];
    for (var i=0;i<arr.length;i++){
        for (var j in targetArr[i]){
            targetArr.push(targetArr[i][j]);
        }
    }
    return targetArr;
}