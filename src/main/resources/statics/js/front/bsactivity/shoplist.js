$(function () {
        //加载微信配置
        var link = (window.location.href).split('#')[0];
         console.log("link=="+link);
        $.ajax({
            url:fontbaseURL + "/frontpage/jsSdkConfig/getJsSdkConfig",//后台给你提供的接口
            type:"GET",
            data:{"url":link},
            async:false,
            dataType:"json",
            success:function (data){
                 console.log("data=="+JSON.stringify(data));
                wx.config({
                    debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来
                    appId: data.appid, // 必填，公众号的唯一标识
                    timestamp: data.timeStamp, // 必填，生成签名的时间戳
                    nonceStr: data.nonceStr, // 必填，生成签名的随机串
                    signature: data.sign,// 必填，签名，见附录1
                    jsApiList: [
                        "getLocation",
                        "onMenuShareTimeline",
                        "onMenuShareAppMessage",
                        "onMenuShareAppMessage"
                    ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
                });
                wx.error(function (res) {
                    alert(res);
                     console.log("res=="+JSON.stringify(res));
                });
            },
            error:function (error){
             console.log("error=="+JSON.stringify(error));
                alert(error)
            }
        });

      wx.ready(function(){
          // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
           /* wx.hideMenuItems({
                menuList: ['menuItem:favorite', 'menuItem:share:facebook',
                  'menuItem:copyUrl', 'menuItem:readMode',
                  'menuItem:openWithQQBrowser',
                  'menuItem:openWithSafari', 'menuItem:share:email']
                // 要隐藏的菜单项，只能隐藏“传播类”和“保护类”按钮，所有menu项见附录3
              });*/
            wx.getLocation({
                    //type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                    type: 'gcj02',
                    success: function (res) {
                         //alert("定位成功=="+JSON.stringify(res));
                        latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                        longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。
                        var speed = res.speed; // 速度，以米/每秒计
                        var accuracy = res.accuracy; // 位置精度
                        //显示地图
                        //$('#reposition').show();
                        //var position = Convert_GCJ02_To_BD09(latitude,longitude);
                        var position = GCJ02_To_BD09(latitude,longitude);
                        var lng = position[0];
                        var lat = position[1];

                        toReposition(lng,lat);
                        //toReposition(longitude,latitude);
                    },
                    cancel: function (res) {
                        alert("用户拒绝授权获取地理位置");
                    },
                    fail: function (res) {
                        alert("获取位置失败=="+JSON.stringify(res)+",请重试");
                        //alert("获取地理位置失败,请检查是否开启定位功能哦");
                    }
           });
       });


         var mySwiper = new Swiper ('.swiper-container', {
            direction: 'horizontal', // horizontal；垂直切换选项 vertical
            loop: true, // 循环模式选项

            // 如果需要分页器
            pagination: {
              el: '.swiper-pagination',
            },
            // 如果需要前进后退按钮
            navigation: {
              nextEl: '.swiper-button-next',
              prevEl: '.swiper-button-prev',
            },
            // 如果需要滚动条
            scrollbar: {
              el: '.swiper-scrollbar',
            },
          })

         //获取广告列表
         adlist();
});



    //火星坐标系 (GCJ-02) 与百度坐标系 (BD-09) 的转换算法 将 GCJ-02 坐标转换成 BD-09 坐标
    function GCJ02_To_BD09(lat,lng){
        var pi = 3.1415926535897932384626;
        var x = lng;
        var y = lat;
        var z = Math.sqrt(x * x + y * y) + 0.00002 * Math.sin(y * pi);
        var theta = Math.atan2(y, x) + 0.000003 * Math.cos(x * pi);
        var bd_lon = z * Math.cos(theta) + 0.0065;
        var bd_lat = z * Math.sin(theta) + 0.006;
        return new Array(bd_lon,bd_lat);
    }

    function toReposition(lng,lat){
            var map = new BMap.Map("allmap");
            var point = new BMap.Point(lng,lat);
            var gc = new BMap.Geocoder();
            gc.getLocation(point, function(rs) {
                var addComp = rs.addressComponents;
                var formatted_address = rs.formatted_address;
                var mapAddress = addComp.province+addComp.city + addComp.district
                + addComp.street + addComp.streetNumber;
                //修改详细地址的值
                $("#detailaddress").val(addComp.city + addComp.district+ addComp.street + addComp.streetNumber);
            });
        //根据经纬度查询用户附近店铺列表 //后台给你提供的接口
        $.ajax({
            url:fontbaseURL + "/frontpage/bsactivity/shop/listinfo",
            type:"GET",
            data:{"lnt":lng,"lat":lat},
            async:true,
            dataType:"json",
            success:function (data){
               console.log("data=="+JSON.stringify(data));
               debugger;
               if(data.code==0){
                    vm.shoplist = data.shoplist;
               }
            },
            error:function (error){
                alert(error)
            }
        });
    }

    function adlist(){
            //根据经纬度查询用户附近店铺列表 //后台给你提供的接口
        $.ajax({
            url:fontbaseURL + "/frontpage/bsactivity/shop/adlist",
            type:"GET",
            async:true,
            dataType:"json",
            success:function (data){
               console.log("data=="+JSON.stringify(data));
               if(data.code==0){
                    vm.adlist = data.adlist;
               }
            },
            error:function (error){
                alert(error)
            }
        });
    }

var vm = new Vue({
	el:'#icloudapp',
	data:{
	    detailaddress:'西乡塘区衡阳东路',
        shoplist:[
            {shopName:'test',
            contactPhone:'145822',
            cityName:'faf',
            countyName:'country',
            address:'afaf',
            distance:320,

            }
        ],
        adlist:[]
	},
	methods: {

	}
});
