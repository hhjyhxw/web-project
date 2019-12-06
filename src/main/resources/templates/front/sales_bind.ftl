<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>店员绑定</title>
		<link rel="stylesheet" href="${request.contextPath}/wx/css/reset.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/myStyle.css">
		<script src="${request.contextPath}/wx/js/jquery-2.1.4.js"></script>
		<script src="${request.contextPath}/wx/js/global.js"></script>
		<style type="text/css">
			@font-face {
		        font-family: 'PingFang';
		        src: url('/img/PingFang Regular.ttf'),
			}
		</style>
	</head>
	
	<body style="overflow: hidden; width: 100%; background: #fff;">
		<div class="flex">
			<div class="body formBox">
				<form action="${request.contextPath}/frontpage/sales_bind/bind" method="post" id="form">
					<div class="formInfoWrite" style="border-top:30px solid #fe9900; padding-top: 50px;"><span>用户名: </span><input type="text" name="name" id="name"/></div>
					<div class="formInfoWrite"><span>手机号: </span><input type="text" name="phone" id="phone" /></div>
					<a class="bindBtn" style="width:41%;">绑 定</a>
				</form>
			</div>
		</div>
	<script>
	  $('.bindBtn').click(function(){
	     if($('#name').val()===''){
		       $("#name").focus();
		       return ;
	     }
	     if($('#phone').val()===''){
		     $("#phone").focus();
		       return ;
	     }
	     $('#form').submit();
	  })
	</script>	
		
	</body>

</html>