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
		<!-- <link rel="stylesheet" href="${request.contextPath}/wx/css/reset.css"> -->
		<link rel="stylesheet" href="${request.contextPath}/wx/css/myStyle.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/laydate.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/laydates.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/styles.css">
		<link rel="stylesheet" href="${request.contextPath}/wx/css/style.css">
		<script src="${request.contextPath}/wx/js/jquery-2.1.4.js"></script>
		<script src="${request.contextPath}/wx/js/global.js"></script>
		<style type="text/css">
		
		</style>
	</head>
	
	<body>
		<div>
		<div class="head">
            <div class="head_left">
				<p class="head_textColor1">0</p>
				<p class="head_textColor2">今天收款</p>
			</div>
			
            <div class="head_right">
					<a href="${request.contextPath}/frontpage/shopSalesCenter/billrecord">
				<p id="totalAmount">0</p>
				<p>总收款</p>
			</a>
			</div>
		
		</div>

		<div class="content">
			<div class="content_tite">
			<div class="content_tite_l">
					<span class="icon-i1" style="color: #ff6600;"></span>
               <span>我的收款</span>
			</div>
			<div class="content_tite_r">
			
					<!-- <input type="button"  value="打开"> -->
				    <span class="icon-i4" id="J-xl-2-btn"></span>
			</div>
		</div>
		</div>

		<div class="date_time">
				<span class="this_time" >当前日期:</span>
				<span class="this_time this_time1" id="J-xl-2">2019-7-17</span>
			<!-- <span>当前日期：2019年7月17日</span> -->
		</div>

		<div class="list">
          <ul id="detaillist">
		  </ul>
		</div>

	</div>

	</body>
</html>
<script src="${request.contextPath}/wx/js/laydate.dev.js"></script>
<script src="${request.contextPath}/js/common/dateutil.js"></script>
	<script>
	     var data=new Date();
         var monthCurr=data.getMonth()+1;
         var yearCurr=data.getFullYear();
         var dayCurr=data.getDate();
         var monLength=monthCurr.toString().length;
         if(monLength==1){
           monthCurr="0"+monthCurr
         }
         var dayLength=dayCurr.toString().length;
          if(dayLength==1){
            dayCurr="0"+monthCurr
          }
      $("#J-xl-2").text(yearCurr+"-"+monthCurr+"-"+dayCurr);
      document.getElementById('J-xl-2-btn').onclick = function(){
            laydate({
                elem: '#J-xl-2'
                ,choose:getData
            });
        }
        function getData(){
             getDayTotal($("#J-xl-2").text());
             getCollectDetailList($("#J-xl-2").text());
        }

        $().ready(function(){
             //默认获取今天收款总额
             getDayTotal($("#J-xl-2").text());
              //获取总的收款额
             getAllTotal();
             //默认获取今天收款明细
             getCollectDetailList($("#J-xl-2").text());
        });

        function getDayTotal(date){
            $.ajax({
              url: "${request.contextPath}/frontpage/shopSalesCenter/getDayTotal",
               data: {"date":date},
               type: "POST",
               dataType: "json",
               cache: false,
                async: false,
               success: function(data) {
                   if(data!=null){
                       $('.head_textColor1').html(data.toFixed(2));
                    }else{
                         $('.head_textColor1').html(0);
                    }
               },
               error : function(data) {
                     $('.head_textColor1').html(0);
               }
           });
        }
        function getAllTotal(){
            $.ajax({
              url: "${request.contextPath}/frontpage/shopSalesCenter/getAllTotal",
               data: '',
               type: "POST",
               dataType: "json",
               cache: false,
                async: false,
               success: function(data) {
                   if(data!=null){
                       $('#totalAmount').html(data.toFixed(2));
                    }
               },
               error : function(data) {

               }
           });
        }
         function getCollectDetailList(date){
            $.ajax({
              url: "${request.contextPath}/frontpage/shopSalesCenter/getCollectDetailList",
               data: {"date":date},
               type: "GET",
               dataType: "json",
               cache: false,
                async: false,
               success: function(data) {
                    var result = '';
                    if(data!=null && data.length>0){
                       $.each(data, function(i, n){
                            result+='<li>'
                            result+='   <span class="icon-i3 mon" style="width: 10%; line-height: 6rem;"></span>'
                            result+='   <span style="width: 43%;"><p>'+n.saleName+'收款</p><p>'+getDateTime(n.createTime,'yyyy-MM-dd HH:mm:ss')+'</p></span>'
                            result+='   <span class="money" style="width: 40%;">+'+n.payAmount+'</span>'
                            result+=' </li>'
                       });
                     }else{
                         result+='<li style="text-align:center;top:10px;justify-content:center;">暂没有数据</li>'
                     }
                     $('#detaillist').html(result);
               },
               error : function(data) {
                       var result='<li style="text-align:center;top:10px;justify-content:center;">暂没有数据</li>';
                     $('#detaillist').html(result);
               }
           });
        }
	</script>