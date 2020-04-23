$(function () {
   //加载
});

var vm = new Vue({
	el:'#icloudapp',
	data:{
		qcode: {},//二维码
		goods: {},//商品对象
		showerror:false
	},
	methods: {
		getGoodsAndQcode: function () {
			$.get(baseURL + "/bsactivity/order/queryGoodsByqcode", function(r){
			    if(r.qcode==null || r.goods==null){
			      vm.showerror = true;
			    }else{
			        let qcode = r.qcode;
                    qcode.imgpath = baseURL+"/"+qcode.imgpath;
                    vm.qcode = qcode;
                    vm.goods = r.goods;
			    }

            })
		},

	}
});
//页面加载的时候加载数据
vm.getGoodsAndQcode();