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
		<link rel="stylesheet" href="${request.contextPath}/wx/css/reset.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/myStyle.css">
		<script src="${request.contextPath}/wx/js/jquery-2.1.4.js"></script>
		<script src="${request.contextPath}/wx/js/global.js"></script>
		<script src="${request.contextPath}/wx/js/pay.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('${request.contextPath}/images//img/PingFang Regular.ttf'),
			}
			
		

		.sendButton{
                font-size: 22px;
                border-top: 1px solid #666;
                border-right: 1px solid #666;
                border-bottom: 1px solid #666;
                background: #c9c9c9;
                border-radius: 0 8px 8px 0;
                padding: 0 3px;
                float: right;
                width: 33%;
                height: 50px;
                line-height: 50px;
                font-size: 20px
		}
		.orderStateTab{
        	padding: 0 60px;
        	width: 100%;
        	height: 85px;
        	line-height: 85px;
        	border-bottom: 6px solid #e3edff;
        	background: #fff;
        	font-size: 28px;
        	font-weight: bold;
        	color: #000;
            display: flex;
            justify-content: center;
        }
        .orderStateTab span{
            display: inline-block;
            width: 212px;
            text-align: center;
        }
        .orderStateTab span:last-child{
        	margin-right: 0;
        }
        .orderStateTab span.onOrderState{
        	color: #4c88e5;
        	position: relative;
        }
        .orderStateTab span.onOrderState i{
            position: absolute;
            left: 45px;
            bottom: 0;
            width: 121px;
            height: 6px;
            background: #4c88e5;
        }
		</style>
	</head>
	
	<body style="overflow: hidden; width: 100%; background: #fff;">
		<div class="flex">
			<div class="body" style="overflow: auto;">
				<div class="headBox">
					<a href="javascript:void(0);" onclick="getQrcode();">
						<span></span>
						<span style="margin-top: 40px;">付款码</span>
					</a>
					<a href="#">
						<span></span>
						<span style="margin-top: 20px;">余额</span>
						<span id="mymoney">
						    0
						</span>
					</a>
				</div>
				<div class="listBox">
				    <div class="listHead" style="border-bottom:0px;">
				       <h2 class="orderStateTab">
                            <span class="tabItem onOrderState" id="myorderListTab"><i></i>我的订单</span>
                            <span class="tabItem" id="shopListTab">店铺列表</span>
                        </h2>
                    </div>
					<ul class="oderLists" id="orderList">

						<li>

						</li>
					</ul>
					<ul class="oderLists" id="shopList">
                        <li>

                        </li>
                    </ul>
				</div>
			</div>
		</div>
		
		<!-- 员工绑定——弹窗HTML -->
		<div class="modal-comfirm"  id="employeeNoWin" style="display: none;">
		  	<div class="content_zhongjiang" style="width: 86%;">
		  		<div class="staffBindHead">员工绑定</div>
		  		<div class="bindInfoForm">
		  			<div class="infoOption"><span>员工号:</span><input style="width: 70%; height: 55px;line-height: 55px;" id="employeeNo" type="text" /></div>
		  			<div class="infoOption">
		  				<span>手机号:</span>
		  				<div class="phone">
		  					<input class="phoneNum" style=" width: 63%;" id="phone" type="number" />
		  					<!--  <a href="" id="sendCode">发送验证码</a>  -->
		  					<span> <input  class="sendButton"  style="   float: right;width: 33%; height: 55px;line-height: 55px;font-size: 20px" type="button" value="发送验证码" id="sendCode" /></span>
		  				</div>
		  			</div>
		  			<div class="infoOption"><span>验证码:</span><input style="width: 70%; height: 55px;line-height: 55px;" id="verifyCode" type="number" /></div>
		  			<div class="btns">
		  				<a href="javascript:closeBind('employeeNoWin');">取消</a>
		  				<a href="javascript:nextStep();">确定</a>
		  			</div>
		  		</div>
		  	</div>
		</div>
		<!-- 员工绑定——弹窗HTML END-->	
		
		<!-- 付款二维码——弹窗HTML -->
		<div class="modal-comfirm qrcode"  style="display:none;">
		    <input type="hidden" id="code" value="" />
		  	<div class="content_zhongjiang">
		  		<div class="checkHead">向商家付款</div>
		  		<img class="erWeiMa" src="${request.contextPath}/wx/image/code.jpg" width="300" height="300"/>
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
<script src="${request.contextPath}/js/common/dateutil.js?v=2"></script>
<script type="text/javascript">
$().ready(function(){
     //获取我的余额mymoney
    getMymoney();
     //默认获取订单列表
      getOderList();
      $(".tabItem").click(function(){
          var types = $(this).attr("id");
          $(this).siblings(".tabItem").removeClass("onOrderState").find("i").remove();;
          $(this).addClass("onOrderState").prepend("<i></i>") ;
          if(types=="myorderListTab"){
              getOderList();
          }
          if(types=="shopListTab"){
              getShopList();
          }
      });

	var $phoneNum=$("#phone");
	//获取验证码
	$("#sendCode").click(function(){
		debugger;
		var phone=$phoneNum.val();
		//校验参数
		if(!(/^1[3|4|5|7|8|9][0-9]\d{8}$/.test(phone))){
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
	    t.value="获取验证码";
	    $(t).removeClass('disabled');	//按钮样式恢复
	    wait = 120; //重置倒计时间
	} else {
	    t.setAttribute("disabled", true); //按钮不可点击
	    $(t).addClass('disabled'); //按钮样式置灰
	    t.value=wait+"s";
	    wait--;
	    setTimeout(function() {
	        time(t)
	    },
	    1000)
	}
}

//提交绑定
function nextStep(){
        var employeeNo=$("#employeeNo").val();
        //校验参数
        if(!(/^\d+$/.test(employeeNo))){
            alert("员工号格式不正确！");
            return false;
        }

        var phone=$("#phone").val();
        //校验参数
        if(!(/^1[3|4|5|7|8|9][0-9]\d{8}$/.test(phone))){
            alert("手机格式不正确！");
            return false;
        }

        var $verifyCode=$("#verifyCode");
        var code=$verifyCode.val();
       if(!(/^\d+$/.test(code))){
           alert("验证码格式不正确！");
           return false;
        }

         $.ajax({
           url: "${request.contextPath}/frontpage/userBind/binds",
            data: {"verifyCode":code,"phone":phone,"employeeNo":employeeNo},
            type: "POST",
            dataType: "json",
            cache: false,
             async: false,
            success: function(data) {
                if(data.status=="success"){
                   alert("绑定成功");
                   //绑定成功，重新跳转 首页
                   closeBind('employeeNoWin');
                   window.location.href="${request.contextPath}/frontpage/userBind/mycenter";
                   window.event.returnValue=false;
                      //刷新我的余额
                     getMymoney();
                 }else{
                    alert(data.message);
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
		 async: false,
		success: function(data) {
		debugger;
			if(data.status=="success"){
				var $sendCode = $("#sendCode");
				time(sendCode);
	         }else{
	         	alert(data.message);
	         }
		},
		error:function(data) {
		    debugger;
		}
	});
}

//关闭弹窗
function closeBind(obj_id){
       debugger;
    $("#"+obj_id).css('display','none');
    //$("#"+obj_id)[0].style.display = 'none'

}
//获取订单列表
function getOderList(){
    $.ajax({
           url: "${request.contextPath}/frontpage/mycenter/myorderList",
            data: {"pageSize":100,"pageNum":1},
            type: "GET",
            dataType: "json",
            cache: false,
             async: false,
            success: function(data) {
                var result = '';
                if(data.list!=null){
                   $.each(data.list, function(i, n){
                        result+='<li><a href="#">'
                        result+='<div class="goods">'
                            result+='<div class="goodsName">'
                                result+='<span>'+n.shopName+'</span>'
                                result+='<span>'+getDateTime(n.createTime,'yyyy-MM-dd HH:mm:ss')+'</span>'
                             result+='</div>'
                        result+='</div>'
                        result+='<span class="money">'+n.payAmount+'</span>'
                        result+='</a></li>'
                   });
                 }else{
                     result+='<li>暂没有数据</li>'
                 }
                 $('#orderList').html(result);
                 $('#shopList').css("display","none");
                 $('#orderList').css("display","block");
            }
        });
 }

 //获取店铺列表
 function getShopList(){
     $.ajax({
            url: "${request.contextPath}/frontpage/mycenter/shopList",
             data: {"parentId":"0"},
             type: "GET",
             dataType: "json",
             cache: false,
              async: false,
             success: function(data) {
                 var result = '';
                 if(data!=null){
                    $.each(data, function(i, n){
                         result+='<li><a  style="height:100px;line-height:100px;" href="${request.contextPath}/frontpage/mycenter/shopListPage?parentId='+n.id+'">'
                         result+='<div class="goods" style="width: 56%;">'
                             result+='<div class="goodsName">'
                                 result+='<span style="display: inline-block;">'+n.shopName+'</span>'
                              result+='</div>'
                         result+='</div>'
                         result+='<span class="money" style="width: 42%;color:gray"><strong>></strong></span>'
                         result+='</a></li>'
                    });
                  }else{
                      result+='<li>暂没有数据</li>'
                  }
                  $('#shopList').html(result);
                  $('#orderList').css("display","none");
                  $('#shopList').css("display","block");
             }
         });
  }
   //获取我的余额
   function getMymoney(){
       $.ajax({
              url: "${request.contextPath}/frontpage/mycenter/getHyEmployee",
               data: '',
               type: "GET",
               dataType: "json",
               cache: false,
                async: false,
               success: function(data) {
                   if(data!=null){
                       $('#mymoney').html((data.accountTotal-data.accountFreeze).toFixed(2));
                    }else{
                         $("#employeeNoWin").css('display','block');
                    }
               },
               error : function(data) {
                    $("#employeeNoWin").css('display','block');
               }
           });
    }


</script>