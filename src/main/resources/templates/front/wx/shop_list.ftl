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
	    <div class="body" style="overflow: auto;">
		    <div class="flex">
				<div class="listBox">
				    <div class="listHead" style="border-bottom:0px;">
				       <h2 class="orderStateTab">
                             <span class="tabItem" id="shopListTab"><i></i>分店列表</span>
                        </h2>
                    </div>
					<ul class="oderLists" id="shopList" style="height: 900px;overflow: auto;">
                        <li>

                        </li>
                    </ul>
				</div>
			</div>
		</div>
	</body>

</html>
<script src="${request.contextPath}/js/common/dateutil.js"></script>
<script type="text/javascript">
$().ready(function(){
     //默认获取店铺列表列表
     getShopList();
      $(".tabItem").click(function(){
          var types = $(this).attr("id");
          $(this).siblings(".tabItem").removeClass("onOrderState").find("i").remove();;
          $(this).addClass("onOrderState").prepend("<i></i>") ;
           getShopList();
      });

})

 //获取店铺列表
 function getShopList(){
     $.ajax({
            url: "${request.contextPath}/frontpage/mycenter/shopList",
             data: {"parentId":"${shop.parentId}"},
             type: "GET",
             dataType: "json",
             cache: false,
              async: false,
             success: function(data) {
                 var result = '';
                 if(data!=null){
                    $.each(data, function(i, n){
                         result+='<li><a  style="height: 145px;" href="${request.contextPath}/frontpage/shopCenter/shopGraph?id='+n.id+'">'
                         result+='<div class="goods" style="width: 56%;">'
                             result+='<div class="goodsName">'
                                 result+='<span>'+n.shopName+'</span>'
                                 result+='<span>'+n.shopAddress+'</span>'
                              result+='</div>'
                         result+='</div>'
                         result+='<span class="money" style="width: 42%;">'+n.contactTel+'</span>'
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