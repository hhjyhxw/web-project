<!DOCTYPE html>
<html class="flex-layout">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black" />
		<meta name="format-detection" content="telephone=no" />
		<meta name="viewport" content="width=device-width,height=device-height,inital-scale=1.0,maximum-scale=1.0,user-scalable=no;">
		<title>每日账单记录</title>
		<!-- <link rel="stylesheet" href="${request.contextPath}/wx/css/reset.css"> -->
		<link rel="stylesheet" href="${request.contextPath}/wx/css/myStyle.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/style.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/styles.css">
		<script src="${request.contextPath}/wx/js/jquery-2.1.4.js"></script>
		<script src="${request.contextPath}/wx/js/global.js"></script>
		<style type="text/css">
	
		</style>
	</head>
	
	<body>
		<div class="bilrecord">

           <div class="bill_head">
			   <a href="${request.contextPath}/frontpage/shopSalesCenter/index" style="color: #000; font-size:1.8rem;">
			 <span><i class="icon-isimui-left" style="color: #000;"></i> 每日账单记录</span>
			</a>
             <span class="icon-i2" style="padding-right:3rem;"></span>
		   </div>

		   <div class="bilrecord_list">
			   <ul id="detaillist">

			   </ul>
		   </div>
		</div>
	</body>

</html>
<script src="${request.contextPath}/js/common/dateutil.js"></script>
<script>

$().ready(function(){
   getTotalGroupByDate();
});
function getTotalGroupByDate(){
            $.ajax({
              url: "${request.contextPath}/frontpage/shopSalesCenter/getTotalGroupByDate",
               data: {"date":''},
               type: "GET",
               dataType: "json",
               cache: false,
                async: false,
               success: function(data) {
                    var result = '';
                    if(data!=null){
                       $.each(data, function(i, n){
                            result+='<li>'
                            result+='   <span>'+getDateTime(n.time,'yyyy_MM_dd')+'</span>'
                            result+='    <span class="text_color">+'+n.pay_amount+'</span>'
                            result+=' </li>'
                       });
                     }else{
                         result+='<li  style="text-align:center;top:10px;justify-content:center;">暂没有数据</li>'
                     }
                     $('#detaillist').html(result);
               },
               error : function(data) {
                     var result='<li  style="text-align:center;top:10px;justify-content:center;">暂没有数据</li>'
                     $('#detaillist').html(result);
               }
           });
        }
	</script>