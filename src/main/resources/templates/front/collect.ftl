<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>输入收款金额</title>
		<link rel="stylesheet" href="${request.contextPath}/wx/css/reset.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/myStyle.css">
		<script src="${request.contextPath}/wx/js/jquery-2.1.4.js"></script>
		<script src="${request.contextPath}/wx/js/global.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('wx/img/PingFang Regular.ttf'),
			}
		</style>
	</head>
	
	<body style="overflow: hidden; width: 100%; background: #f2f2f2;">
		<div class="flex">
			<div class="body">
				<div class="back">返回</div>
				<form id="collect">
				    <input type="hidden" value="0" id="clickCount" />
					<div class="playMoney">
						<span>收款金额</span>
						<div class="inputNum"><span>￥</span> 
						<input type="number" name="amount" id="amount" value=""/>
						</div>
						折扣：${discount}折，折扣后金额：<font id="afterdiscount">0</font>
						<input type="hidden" name="discount" value="${discount}" id="discount"/>
						<input type="hidden" name="userid" value="${userId}"/>
						<input type="hidden" name="shopId" value="${shopId}"/>
						<input type="hidden" name="salesId" value="${shopSalesId}"/>
						<input type="hidden" name="code" value="${code}"/>
						<input type="hidden" name="sign" value="${sign}"/>
						<a href="javascript:void(0);" class="confirmBtn">确定</a>
					</div>
				</form>
			</div>
		</div>
		<script>
		 $('.confirmBtn').click(function(){
		    var clickCount = $('#clickCount').val();
		    if(clickCount==='0'){
		       $('#clickCount').val('1');
			    }else{
			     alert('不可重复提交');
			     return ;   
			 }
		   	$.ajax({
				url : '${request.contextPath}/frontpage/hyPay/collect',
				type : 'post',
				data : $("#collect").serialize(),
				success : function(data) {
					if (data.code == '0000') {
						window.location.href="${request.contextPath}/frontpage/hyPay/paySuccShop?orderId="+data.message;
					}else{
					    $('#clickCount').val('0');
					    alert(data.message)
					}
	
				},
				error : function() {
	
				}
		   })
		 });
		 $("#amount").bind("input propertychange",function(event){
                var discount = $('#discount').val()/10;
                var afterAmount = ($("#amount").val()*discount).toFixed(2); 
		        $('#afterdiscount').html(afterAmount);
         });
		</script>
		
	</body>

</html>