<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>首页</title>
		<link rel="stylesheet" href="${pictureVisitUrl}/wx/css/reset.css">
		<link rel="stylesheet" href="${pictureVisitUrl}/wx/css/myStyle.css">
		<script src="${pictureVisitUrl}/wx/js/jquery-2.1.4.js"></script>
		<script src="${pictureVisitUrl}/wx/js/global.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${pictureVisitUrl}/images//img/PingFang Regular.ttf'),
			}
			
		</style>
	</head>
	
	<body style="overflow: hidden; width: 100%; background: #fff;">
		<div class="flex">
			<div class="body">
				<div class="headBox">
					<a href="#">
						<span></span>
						<span style="margin-top: 40px;">付款码</span>
					</a>
					<a href="#">
						<span></span>
						<span style="margin-top: 20px;">余额</span>
						<span>${(wx_user.hyEmployee.accountTotal)!0}</span>
					</a>
				</div>
				<div class="listBox">
					<div class="listHead">
						<div>我的订单</div>
						<span></span>
					</div>
					<ul class="oderLists">
						<li>
							<a href="#">
								<div class="goods">
									<img src="image/pics.jpg"/ width="80" height="80">
									<div class="goodsName">
										<span>商品名称</span>
										<span>2019年6月20日</span>
									</div>
								</div>
								<span class="money">-300</span>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="goods">
									<img src="image/pics.jpg" width="80" height="80">
									<div class="goodsName">
										<span>商品名称</span>
										<span>2019年6月20日</span>
									</div>
								</div>
								<span class="money">-300</span>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="goods">
									<img src="image/pics.jpg" width="80" height="80">
									<div class="goodsName">
										<span>商品名称</span>
										<span>2019年6月20日</span>
									</div>
								</div>
								<span class="money">-300</span>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="goods">
									<img src="image/pics.jpg" width="80" height="80">
									<div class="goodsName">
										<span>商品名称</span>
										<span>2019年6月20日</span>
									</div>
								</div>
								<span class="money">-300</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		
		<!-- 员工绑定——弹窗HTML -->
		<div class="modal-comfirm"  id="employeeNoWin" style="display: block;">
		  	<div class="content_zhongjiang">
		  		<div class="staffBindHead">员工绑定</div>
		  		<div class="bindInfoForm">
		  			<div class="infoOption"><span>员工号:</span><input id="employeeNo" type="text" /></div>
		  			<div class="infoOption">
		  				<span>手机号:</span>
		  				<div class="phone">
		  					<input class="phoneNum" id="phone" type="number" />
		  					<a href="#">发送验证码</a>
		  				</div>
		  			</div>
		  			<div class="infoOption"><span>验证码:</span><input id="verifyCode" type="number" /></div>
		  			<div class="btns">
		  				<a href="avascript:closeBind('employeeNoWin');">取消</a>
		  				<a href="javascript:nextStep();">确定</a>
		  			</div>
		  		</div>
		  	</div>
		</div>
		<!-- 员工绑定——弹窗HTML END-->	
		
		<!-- 付款二维码——弹窗HTML -->
		<div class="modal-comfirm"  style="display: none;">
		  	<div class="content_zhongjiang">
		  		<div class="checkHead">向商家付款</div>
		  		<img class="erWeiMa" src="image/code.jpg" width="300" height="300"/>
		  		<span class="closeBtn"></span>
		  	</div>
		</div>
		<!-- 付款二维码——弹窗HTML END-->	
		
		<!-- 订单筛选——弹窗HTML -->
		<div class="modal-comfirm"  style="display: none;">
		  	<ul class="seleOrder">
		  		<li>供应商-连锁店名称1</li>
		  		<li>供应商-连锁店名称2</li>
		  		<li>供应商-连锁店名称3</li>
		  		<li>供应商-连锁店名称4</li>
		  		<li>供应商-连锁店名称5</li>
		  		<li>供应商-连锁店名称6</li>
		  		<li>供应商-连锁店名称7</li>
		  		<li>供应商-连锁店名称8</li>
		  	</ul>
		</div>
		<!-- 订单筛选——弹窗HTML END-->	
	</body>

</html>
<script src="${pictureVisitUrl}/js/common/dateutil.js"></script>
<script type="text/javascript">
$().ready(function(){

	var $phoneNum=$("#phone");
	var $sendCode = $("#verifyCode");
	//获取验证码
	$sendCode.click(function(){
		debugger;
		var phone=$phoneNum.val();
		//校验参数
		if(!(/^1[3|4|5|7|8][0-9]\d{8}$/.test(phone))){
			alert("手机格式不正确！");
			return false;
		}
		//
		sendVerifyCode(phone);
	});
})


//获取验证码倒计时
var wait=120; //设置初始倒计时间
function time(t) {
	if (wait == 0) {
	    t.removeAttribute("disabled");   //按钮恢复点击
	    t.value="重新获取验证码";
	    $(t).removeClass('disabled');	//按钮样式恢复
	    wait = 120; //重置倒计时间
	} else {
	    t.setAttribute("disabled", true); //按钮不可点击
	    $(t).addClass('disabled'); //按钮样式置灰
	    t.value="请"+wait+"秒内输入验证码";
	    wait--;
	    setTimeout(function() {
	        time(t)
	    },
	    1000)
	}
}



//提交绑定
function nextStep(){
        debugger;
        var $verifyCode=$("#verifyCode");
        var code=$verifyCode.val();
        if(!(/^\d+$/.test(code))){
            alert("验证码格式不正确！");
            return false;
        }
        var phone=$("#phone").val();
        //校验参数
        if(!(/^1[3|4|5|7|8][0-9]\d{8}$/.test(phone))){
            alert("手机格式不正确！");
            return false;
        }
        var employeeNo=$("#employeeNo").val();
        //校验参数
        if(!(/^\d+$/.test(employeeNo))){
            alert("员工号格式不正确！");
            return false;
        }

         $.ajax({
           url: "${request.contextPath}/frontpage/userBind/binds",
            data: {"verifyCode":code,"phone":phone,"employeeNo":employeeNo},
            type: "POST",
            dataType: "json",
            cache: false,
            success: function(data) {
                if(data.status=="success"){
                   alert("绑定成功");
                   //绑定成功，重新跳转 首页
                   location.href="";
                 }else{
                    alert(data.error);
                 }
            }
        });

}
//发送验证码
function sendVerifyCode(phone){
debugger;
	$.ajax({
		url: "${request.contextPath}/frontpage/userBind/sendSms",
		data: {"phone": phone},
		type: "POST",
		dataType: "json",
		cache: false,
		success: function(data) {
			if(data.status=="success"){
				var $sendCode = $("#sendCode");
				time(sendCode);
	         }else{
	         	alert(data.error);
	         }
		}
	});
}

//关闭弹窗
function closeBind(obj_id){
    $("#"+obj_id).css('display','none');
    //$("#"+obj_id)[0].style.display = 'none'

}
</script>