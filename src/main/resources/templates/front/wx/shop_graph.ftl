<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta name="format-detection"  content="telephone=no">
	<meta  http-equiv="x-rim-auto-match" content="none">
	
	<style type="text/css">
		body, html{width:100%;height:100%;margin:0;font-family:"微软雅黑";}
		#allmap{height:100%;width:100%;}
		#r-result{width:100%;overflow:scroll;display:block;}
		#r-result table{width:100%;}
			html {
		  		font-size: 10px; 
		  		
		  	}
			@media only screen and (min-width: 320px) {
			  	html {
			    		font-size: 11px; 
			    	} 
			}
			@media only screen and (min-width: 360px) {
			  	html {
			    		font-size: 10.5px; 
		    		} 
	    		}
			@media only screen and (min-width: 400px) {
			  	html {
			    		font-size: 11px; 
		    		} 
	    		}
			@media only screen and (min-width: 768px) {
			  	html {
			    		font-size: 11px; 
		    		} 
	    		}
			h2,p,a,div{
				margin: 0;
				padding: 0;
				border: 0;
			}
			.modal-comfirm {
				position: absolute;
				z-index: 9999;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				background-color: rgba(0, 0, 0, 0.6);
			}
			
			.modal-comfirm .content-body {
				-webkit-transform: translateX(-50%) translateY(-54%);
				width: 80%;
				border-radius: 10px;
				background:#fff;
				position: absolute;
				top: 50%;
				left: 50%;
				padding:12px 25px;
				box-sizing: border-box;
			}
			.win_title{
				text-align: center;
				color: #28282a; 
				font-weight: normal;
				line-height: 50px;
			}
			.win_con{
				text-align: center;
				color: #99989b; 
				line-height: 30px;
				padding: 0 14px;
			}
			.confirm_btn{
				background: #137bd7; 
				width: 66%; 
				height: 44px; 
				display:block; 
				line-height: 44px; 
				border-radius: 22px; 
				color: #fff;
				text-decoration: none; 
				margin: 10px auto;
				margin-top: 18px;
			}
			.font_30{
				font-size: 18px;
			}
			.font_36{
				font-size: 20px;
			}
	</style>
	<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=GjjKEaA7Xtnj7KmgdFG2tVCsQa0TisFN&s=1"></script>
	<script type="text/javascript">
			! function( userAgent ) {
			    var screen_w = parseInt(window.screen.width),
			        scale = screen_w / 640;
			    if ( /Android (\d+\.\d+)/.test( userAgent )){
			        var version = parseFloat( RegExp.$1 );
			        document.write( version > 2.3
		            ? '<meta name="viewport" content="width=410, minimum-scale = ' + scale + ", maximum-scale = " + scale + ', target-densitydpi=device-dpi">'
			            : '<meta name="viewport" content="width=410, target-densitydpi=device-dpi">' );
			    } else {
			           document.write( '<meta name="viewport" content="width=410, user-scalable=no, target-densitydpi=device-dpi">' );
			    }
			
			}( navigator.userAgent );
		</script>
	</head>
	<body>
		<div id="allmap"></div>

		<!--地图弹窗说明-->
		<div class="modal-comfirm" style="display:none;">
		  	<div class="content-body">
				<h2 class="font_36 win_title">${msg!'店铺'}</h2>
				<p class="font_30 win_con">${msg1!'查看离您当前位置最近的兑换点信息'}</p>
				<p style="text-align: center;">
			    	<a href="javascript:;" class="confirm_btn font_36">知道了</a>
			   	</p>
		  	</div>
		</div>
		<!--地图弹窗说明  END-->
	</body>

</html>

<script type="text/javascript">
   	$('.font_36').on('click',function(){
		$('.modal-comfirm').remove();
	})
	// 百度地图API功能
	var map = new BMap.Map("allmap",{minZoom:4,maxZoom:18});
	var point = new BMap.Point(108.37337,22.82298);
	map.centerAndZoom(point,18);
	map.enableScrollWheelZoom();
	map.enableInertialDragging();
	map.enableContinuousZoom();
	
	//步行规划类
	//var walking = new BMap.WalkingRoute(map, {renderOptions: {map: map, panel: "r-result", autoViewport: true}})
    var walking = new BMap.WalkingRoute(map, {renderOptions:{map: map, autoViewport: true}});
    var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true}});
	var size = new BMap.Size(15, 10);
    map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.ScaleControl());
    map.addControl(new BMap.MapTypeControl());
    map.addControl(new BMap.GeolocationControl());
      map.addControl(
      new BMap.CityListControl({
		    anchor: BMAP_ANCHOR_TOP_LEFT,
		    offset: size,
		    type: BMAP_NAVIGATION_CONTROL_ZOOM,
		    // 切换城市之间事件
		       onChangeBefore: function(){
		        
		     },
		    // 切换城市之后事件
		     onChangeAfter:function(){
		       //$('#r-result').hide();
		       //walking.clearResults();
		       //$('#allmap').height(window.screen.height)
		     }
         })
      );
      
	var myPoint;//我的位置
	var geolocation = new BMap.Geolocation();
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			//用于实现路线
			myPoint = r.point;
			//设置我所在位置的图标
			var label = new BMap.Label("当前位置",{offset:new BMap.Size(20,-10)});
			var mymarker = new BMap.Marker(new BMap.Point(r.point.lng,r.point.lat));  // 创建标注
				mymarker.setLabel(label);
				map.addOverlay(mymarker);               // 将标注添加到地图中
				mymarker.setAnimation(BMAP_ANIMATION_BOUNCE); 
	        //加载商户信息
                debugger;
                var simpleContent = '店名:'+"${hyShop.shopName}"+'<br/>';
                simpleContent += '地址:'+"${hyShop.shopAddress}";
                simpleContent += '<br/>电话：<a href=tel:'+"${hyShop.contactTel}"+'>'+"${hyShop.contactTel}"+'</a>←点击拨打<br/>';

                var content = '店名:'+"${hyShop.shopName}"+'<br/>';
                content += '地址:'+"${hyShop.shopAddress}";
                content += '<br/>电话：<a href="tel:'+"${hyShop.contactTel}"+'">'+"${hyShop.contactTel}"+'</a>←点击拨打<br/>';
                content += '<a href="javascript:routers('+"${hyShop.lnt}"+','+"${hyShop.lat}"+',\''+simpleContent+'\')">查看路线</a>';
                var point = new BMap.Point("${hyShop.lnt}","${hyShop.lat}");
                var marker = new BMap.Marker(point);  // 创建标注
                map.addOverlay(marker);               // 将标注添加到地图中
                //监听
                addClickHandler(content,marker);
                var opts = {
                    width : 250,     // 信息窗口宽度
                    height: 100,     // 信息窗口高度
                    title : "商家信息" , // 信息窗口标题
                }
                map.centerAndZoom(point,${zoom!'18'});
                var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
                //routers(val.lnt,val.lat);
                map.openInfoWindow(infoWindow,point); //开启信息窗口

		}
		else {
			alert('定位失败，请扫码重试');
		}        
	},{enableHighAccuracy: true})

	//步行路线规划
	window.routers=function(lnt,lat,content){
	//	walking.search(myPoint, new BMap.Point(lnt,lat));
		walking.clearResults();
	    driving.clearResults();
	
		
		map.centerAndZoom(myPoint, 11);
		var p2 = new BMap.Point(lnt,lat);
		if(1000>=(map.getDistance(myPoint,p2).toFixed(2))){
		 walking.setInfoHtmlSetCallback(function(poi,marker,html){
		if(typeof poi=== 'object' && poi.hasOwnProperty('title') && poi.title==='终点'){
		 var opts = {
								width : 250,     // 信息窗口宽度
								height: 100,     // 信息窗口高度
								title : "商家信息" , // 信息窗口标题
				}
				 var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
					 map.openInfoWindow(infoWindow,new BMap.Point(lnt,lat)); //开启信息窗口
		   }
		})
	         walking.search(myPoint, p2);
		}else{
		      driving.setInfoHtmlSetCallback(function(poi,marker,html){
		if(typeof poi=== 'object' && poi.hasOwnProperty('title') && poi.title==='终点'){
		 var opts = {
								width : 250,     // 信息窗口宽度
								height: 100,     // 信息窗口高度
								title : "商家信息" , // 信息窗口标题
				}
				 var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
					 map.openInfoWindow(infoWindow,new BMap.Point(lnt,lat)); //开启信息窗口
		   }
		})
			 driving.search(myPoint, p2);
		}
	}
	//地图点击事件
	function addClickHandler(content,marker){
		marker.addEventListener("click",function(e){
			openInfo(content,e)
		});
	}
	function openInfo(content,e){
		var opts = {
					width : 300,     // 信息窗口宽度
					height: 150,     // 信息窗口高度
					title : "商家信息" , // 信息窗口标题
					enableMessage:true//设置允许信息窗发送短息
		};
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象 
		map.openInfoWindow(infoWindow,point); //开启信息窗口
	}
	
</script>