$(function () {
   //加载
});

var vm = new Vue({
	el:'#icloudapp',
	data:{
		qcode: {},//二维码
		goods: {},//商品对象
		showerror:false,//用于控制正常显示商品或者展示错误消息；true：显示提示消息；fasle显示商品消息
		exchangeSuccess:false,//true显示兑换成功消息，false显示兑换失败消息
		msg:'',
		goodimg:'',
		dcurrency:0,//我的龙币
		dcurrencyInfo:'您目前龙币余额为:0',//龙币描述
		btnshow:true,
		exchangeNum:1,//兑换数量
		goodsId:null,//兑换商品id
		totalAmount:null,//兑换总额


	},
	methods: {
		getGoodsAndQcode: function () {
			$.get(fontbaseURL + "/frontpage/bsactivity/order/queryGoodsByqcode", function(r){
			    console.log("r=="+JSON.stringify(r));
			    if(r.qcode==null || r.goods==null){
                   vm.msg = r.msg;
                   vm.showerror = true;//显示非商品内容
			    }else{
                    vm.goodimg = imgURL+r.goods.goodimg;
                    console.log("vm.goodimg=="+JSON.stringify(vm.goodimg));
                    vm.goods = r.goods;
                    vm.qcode = r.qcode;
                    vm.goodsId = r.goods.id;
                    vm.totalAmount = r.goods.marketPrice;
                    vm.getMylongcoin();
			    }

            })
		},
		//获取我的龙币
        getMylongcoin: function () {
			$.get(fontbaseURL + "/frontpage/bsactivity/user/userInfo", function(r){
			    console.log("r=="+JSON.stringify(r));
			    if(r.code==0){
			      vm.dcurrency = r.dcurrency;//我的龙币余额
			      vm.dcurrencyInfo = '您目前龙币余额为:'+r.dcurrency;
			      if(vm.goods.marketPrice>parseInt(r.dcurrency)){
                     vm.btnshow = false;//不能兑换商品
			      }
			    }else{
//                  vm.dcurrencyInfo = '您当前扫码微信号还不是真龙会员';
                  vm.dcurrencyInfo = r.msg;
                   vm.dcurrencyInfo = r.msg!=null?(r.msg!=''?r.msg:'正在查询您的龙币'):'正在查询您的龙币';
                  vm.btnshow = false;//不能兑换商品
			    }

            })
		},
		//减
		minus: function () {
		    let num = vm.exchangeNum-1;
		    if(num==0){
                return;
		    }else if(num<0){
                vm.exchangeNum = 1;
                vm.totalAmount = vm.goods.marketPrice;
		    }else{
		        //增加总量，增加总额
		        vm.exchangeNum = num;
		        vm.totalAmount = vm.goods.marketPrice*num;
		    }
		},
		//加
        plus:function () {
             let num = vm.exchangeNum+1;
             if(num*vm.goods.marketPrice>vm.dcurrency){
                return;
             }else{
                //增加总量，增加总额
                vm.exchangeNum = num;
                vm.totalAmount = vm.goods.marketPrice*num;
            }
        },
        //确认兑换
        submitorder_bak:function () {

          /* vm.exchangeSuccess = true;//兑换成功
           vm.msg = "兑换成功";
           vm.showerror = true;//显示非商品内容
           return;*/

            let content = '兑换数量:'+vm.exchangeNum+";扣减龙币数:"+vm.totalAmount;
           layer.confirm(content, {btn: ['确定', '取消'], title: "提示"}, function (index) {
                       layer.close(index);
                     $.get(fontbaseURL + "/frontpage/bsactivity/order/exchange?goodsId="+vm.goodsId+"&exchangeNum="+vm.exchangeNum, function(r){
                        console.log("r=="+JSON.stringify(r));
                        if(r.code==0){
                           vm.exchangeSuccess = true;//兑换成功
                           vm.msg = "兑换成功";
                           vm.showerror = true;//显示非商品内容

                        }else{
                           vm.exchangeSuccess = false;//在次调试使用
                           vm.msg = r.msg!=null?(r.msg!=''?r.msg:'兑换失败'):'兑换失败';
                           vm.showerror = true;////显示非商品内容
                             //layer.msg("兑换失败", {icon: 1});
                        }
                      })
               });


        },
        //确认兑换
        submitorder:function () {
            vm.btnshow = false;//不能兑换商品
          /* vm.exchangeSuccess = true;//兑换成功
           vm.msg = "兑换成功";
           vm.showerror = true;//显示非商品内容
           return;*/

             $.get(fontbaseURL + "/frontpage/bsactivity/order/exchange?goodsId="+vm.goodsId+"&exchangeNum="+vm.exchangeNum, function(r){
                console.log("r=="+JSON.stringify(r));
                if(r.code==0){
                   vm.exchangeSuccess = true;//兑换成功
                   vm.msg = "兑换成功";
                   vm.showerror = true;//显示非商品内容

                }else{
                   vm.exchangeSuccess = false;//在次调试使用
                   vm.msg = r.msg!=null?(r.msg!=''?r.msg:'兑换失败'):'兑换失败';
                   vm.showerror = true;////显示非商品内容
                     //layer.msg("兑换失败", {icon: 1});
                }
              })


        },


	}
});
//页面加载的时候加载数据
vm.getGoodsAndQcode();
