<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>支付成功</title>
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
	
	<body style="overflow: hidden; width: 100%; background: #f2f2f2;">
		<div class="flex">
			<div class="body">
				<div class="back"><a href="${request.contextPath}/frontpage/userBind/mycenter">返回</a></div>
				<div class="orderDetailHead" style="background: #fff; padding-top: 0;margin-bottom: 0;">
					<div class="state">支付成功</div>
					<span style="margin-top: 35px;">收款方(${shopName})</span>
					<span>￥${amount}</span>
				</div>
				<div style="background: #fff;padding: 20px 0;">
					<div class="detail"><span>支付时间：</span><span>${orderDate}</span></div>
					<div class="detail"><span>支付单号：</span><span>${orderNo}</span></div>
				</div>
			</div>
		</div>
		
		
	</body>

</html>