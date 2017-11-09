<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="style/js/AjaxUpload.js" type="text/javascript"></script>
<script type="text/javascript">
window.onload = function() {  
    init();  //初始化  
}  
  
//初始化  
function init() {  
	alert("asd");
    //初始化图片上传  
    var btnImg = document.getElementById("btnUploadImg");  
    var img = document.getElementById("imgShow");  
    var hidImgName = document.getElementById("hidImgName");  
    document.getElementById("btnDeleteImg").onclick = function() { DelImg(img, hidImgName); };  
    g_AjxUploadImg(btnImg, img, hidImgName);  
}  
  
  
var g_AjxTempDir = "/file/temp/";  

//图片上传  
function g_AjxUploadImg(btn, img, hidPut) {  
    var button = btn, interval;  
    new AjaxUpload(button, {  
        action: '/Common/UploadHandler.ashx?fileType=img',  
        data: {},  
        name: 'myfile',  
        onSubmit: function(file, ext) {  
            if (!(ext && /^(jpg|JPG|png|PNG|gif|GIF)$/.test(ext))) {  
                alert("您上传的图片格式不对，请重新选择！");  
                return false;  
            }  
        },  
        onComplete: function(file, response) {  
            flagValue = response;  
            if (flagValue == "1") {  
                alert("您上传的图片格式不对，请重新选择！");  
            }  
            else if (flagValue == "2") {  
                alert("您上传的图片大于200K，请重新选择！");  
            }  
            else if (flagValue == "3") {  
                alert("图片上传失败！");  
            }  
            else {  
                hidPut.value = response;  
                img.src = g_AjxTempDir + response;  
            }  
        }  
    });  
}  
  
//删除图片  
function DelImg(img, hidPut) {  
    hidPut.value = "";  
    img.src = "/images/nophoto.gif";  
}  
</script>
</head>
<body>
<div class="uploadImg">  
    <img id="imgShow" src="/images/nophoto.gif" />  
    <input type="hidden" id="hidImgName" />  
    <input type="button" id="btnUploadImg" value="上传" />  
    <input type="button" id="btnDeleteImg" value="删除" />  
</div>
</body>
</html>