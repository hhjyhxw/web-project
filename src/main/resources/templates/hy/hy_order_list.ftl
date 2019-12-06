<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title>订单表</title>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../../css/global.css" media="all">
		<link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../css/table.css" />

		<style>
        		.findTool{
        			overflow:hidden;
        			margin:10px 0;
        		}
        		.findTool li{
        			float:left;
        			padding：0 10px;
        		}
        		.findTool input{
        			margin: 0 30px 0 10px;
        			height:25px;
        			line-height:25px;
        		}
        		.findTool select{
        			margin: 0 30px 0 10px;
        			padding:3px 20px;
        			height:30px;
        		}
        		.findTool #search{
        			padding:3px 20px;
        		}
        		.findTool #ship{
        			padding:3px 30px;
        			margin-left:30px;
        		}
        		.findTool #ship,#search{
        		    font-size:18px;
        		}

        		.findTool #downLoad{
        			 padding: 5px 30px;
           			 margin-left: 22px;
        		}
        </style>
	</head>

	<body>
              <div style="margin:0 auto;width:100%;">
                    <fieldset class="layui-elem-field">
                         <legend>查询条件</legend>
                        <form action="${request.contextPath}/backpage/hyOrder/list" id="formId" style="padding-left:33px;">
                             <ul class="findTool">
                                 <input type="hidden" id="pageSize" name="pageSize" value="${page.pageSize!''}">
                                 <input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum!''}">
                                 <li> 订单编号： <input type="text" name="orderNo" id="orderNo"  value="${(record.orderNo)!''}" placeholder="" autocomplete="off" ></li>
                                 <li> 所属店铺名称： <input type="text" name="shopName" id="shopName"  value="${(record.shopName)!''}" placeholder="" autocomplete="off" ></li>
                                <#--
                                 <li>订单来源：<select name="orderSource" onchange="pageSkip(document.getElementById('pageNum').value)" id="orderSource" value="${record.orderSource!''}">
                                                <option value="" >请选择</option>
                                                <option value="0" <#if ((record.orderSource)!'') == '0'>selected</#if>>二维码收款</option>
                                                <option value="1" <#if ((record.orderSource)!'') == '1'>selected</#if>>接口下单</option>
                                             </select>
                                 </li>
                                  <li> openid：<input type="text" name="openid" id="openid"  value="${(record.openid)!''}" placeholder="" autocomplete="off" ></li>
                                  <li>昵称：<input type="text" name="nick" id="nick"  value="${(record.nick)!''}" placeholder="" autocomplete="off" ></li>
                                 -->
                                 <li>开始时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="startTime" name="startTime" value="${(record.startTime)!''}"></li>
                                 <li>结束时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="endTime" name="endTime" value="${(record.endTime)!''}"></li>
                                 <li><button id="search">查询</button></li>
                                 <li><button id="downLoadReport" class="layui-btn layui-btn-normal" style="height: 35px;background-color: #1E9FFF; margin-left: 20px;">下载</button></li>
                             </ul>
                        </form>
                    </fieldset>
            </div>
			<fieldset class="layui-elem-field">
				<legend>订单记录</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th>订单号</th>
							    <th>昵称</th>
							    <th>openid</th>
							    <th>总金额</th>
							    <th>已付金额</th>
							    <th>折扣金额</th>
							    <th>支付状态</th>
							    <th>发货状态</th>
							    <th>退款状态</th>
							    <th>订单来源</th>
							    <th>所属店铺</th>
							    <th>下单时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as t>
						    <tr>
						    	<td>${t.orderNo!""}</td>
						        <td>${t.nick!""}</td>
                                <td>${t.openid!""}</td>
                                <td>${(t.totalAmount?string("0.##"))!""}</td>
                                <td>${(t.payAmount?string("0.##"))!""}</td>
                                <td>${(t.discountAmount?string("0.##"))!""}</td>
                                 <td>
                                        <#if t.orderStatua?? && t.orderStatua=='0'>未支付</#if>
                                        <#if t.orderStatua?? && t.orderStatua=='1'>已支付</#if>
                                </td>
                                 <td>
                                        <#if t.deliveryStatus?? && t.deliveryStatus=='0'>未发货</#if>
                                        <#if t.deliveryStatus?? && t.deliveryStatus=='1'>已发货</#if>
                                </td>
                                 <td>
                                         <#if !(t.refudStatus??)>未退款</#if>
                                        <#if t.refudStatus?? && t.refudStatus=='0'>未退款</#if>
                                        <#if t.refudStatus?? && t.refudStatus=='1'>已退款</#if>
                                </td>
                                 <td>
                                        <#if t.orderSource?? && t.orderSource=='0'>二维码收款</#if>
                                        <#if t.orderSource?? && t.orderSource=='1'>下单接口下单</#if>
                                </td>
                                <td>${t.shopName!""}</td>
                                <td>${t.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
								<th>
								<div class="layui-btn-group">
								     <#if !(t.refudStatus??) || t.refudStatus !='1'>
                                        <button class="layui-btn layui-btn-small" onclick="toRefund(${t.id?c})">
                                            <i class="layui-icon">&#xe642;</i>&nbsp;退款
                                        </button>
                                    </#if>
								</div>
								</th>
							</tr>
						</#list>
						</tbody>
					</table>

				</div>
			</fieldset>
			<div class="admin-table-page">
				<div id="page" class="page">
				    总共${page.total}条记录，分${page.pages}页显示，每页${page.pageSize}条记录，当前第${page.pageNum}页
                    <span style="float:right;margin-right:10%;">
                        <a class="" onclick="pageSkip(1)" href="#">首页 </a>
                        <#if page.hasPreviousPage??>
                        <a class="" onclick="pageSkip(${page.prePage})" href="#" >上一页 </a>
                        <#else>
                        <a class="" onclick="pageSkip(1)" href="#" >上一页 </a>
                        </#if>
                        <#if page.hasNextPage??>
                        <a class="" onclick="pageSkip(${page.nextPage})" href="#" >下一页 </a>
                        <#else>
                        <a class="" onclick="pageSkip(1)" href="#" >下一页 </a>
                        </#if>
                        <a class="" onclick="pageSkip(${page.lastPage})" href="#" >末页 </a>
                        <input type="number" id="inputPageNo" value="${page.pageNum}" name="pageNum" style="width:30px;"/>
                        <button id="skip" onclick='pageSkip(document.getElementById("inputPageNo").value)'>GO</button>
                    </span>
				</div>
			</div>
		</div>
        <script type="text/javascript" src="../../plugins/layui/layui.js"></script>
		<script type="text/javascript" src="../../js/jquery.min.js"></script>
		<script>
		     //提交表单查询
            function pageSkip(pageNum){
               var formSubmit = document.getElementById('formId');
               if(pageNum<=0){
                 pageNum = 1;
               }
               //$('#pageNum').attr('value',pageNum);
               $('#pageNum').val(pageNum);
               formSubmit.submit();
             }

			layui.config({
				base: '../../plugins/layui/modules/'
			});

			layui.use(['icheck', 'laypage','layer'], function() {
				var $ = layui.jquery,
					laypage = layui.laypage,
					layer = parent.layer === undefined ? layui.layer : parent.layer;
				$('input').iCheck({
					checkboxClass: 'icheckbox_flat-green'
				});


				//查询
				$('#search').on('click', function() {
				     var formSubmit = document.getElementById('formId');
				     formSubmit.submit();
				});
				//下载
                $('#downLoadReport').on('click', function() {
                     //var formSubmit = document.getElementById('formId');
                     //formSubmit.submit();

                      $("#pageSize").val(3000);
                      $("#formId").attr('action',"${request.contextPath}/backpage/hyOrder/downLoad");    //通过jquery为action属性赋值
                      $("#formId").submit();    //提交ID为myform的表单
                        window.setTimeout(function(){
                             $("#pageSize").val(10);
                             $("#formId").attr('action',"${request.contextPath}/backpage/hyOrder/list");    //通过jquery为action属性赋值
                        },1000);
                });


				//跳转导入
				$('#toImport').on('click', function() {
                    window.location.href = "${request.contextPath}/backpage/hyEmployee/toImport"
                });
				//跳转新增
				$('#toAdd').on('click', function() {
					window.location.href = "${request.contextPath}/backpage/hyEmployee/toinput"
				});
				$('.site-table tbody tr').on('click', function(event) {
					var $this = $(this);
					var $input = $this.children('td').eq(0).find('input');
					$input.on('ifChecked', function(e) {
						$this.css('background-color', '#EEEEEE');
					});
					$input.on('ifUnchecked', function(e) {
						$this.removeAttr('style');
					});
					$input.iCheck('toggle');
				}).find('input').each(function() {
					var $this = $(this);
					$this.on('ifChecked', function(e) {
						$this.parents('tr').css('background-color', '#EEEEEE');
					});
					$this.on('ifUnchecked', function(e) {
						$this.parents('tr').removeAttr('style');
					});
				});
						
			})
			//跳转修改
			function toEdit(id){
				window.location.href = "${request.contextPath}/backpage/hyEmployee/toinput?id="+id;
			}
			//删除
			function delById(id){
				if(confirm("确定要删除？")){
					var url = '${request.contextPath}/backpage/toinput/del';
					$.post(url, {
		                'id':id
		            }, function(ret) {
					    if(ret == "0000"){
					    	layer.msg("删除成功");
					    	window.location.href = "${request.contextPath}/backpage/hyEmployee/list";
					    }else{
					    	layer.msg("删除失败");
					    }
		            });
				}
			}

			//退款
            function toRefund(id){
                if(confirm("确定要退款吗？")){
                    var url = '${request.contextPath}/backpage/hyRefund/refund';
                    $.post(url, {
                        'orderId':id
                    }, function(ret) {
                        if(ret.status== "success"){
                            layer.msg("退款成功");
                            window.location.href = "${request.contextPath}/backpage/hyOrder/list";
                        }else{
                            layer.msg("退款失败,"+ret.message);
                        }
                    });
                }
            }
			layui.use('laydate', function(){
                  var laydate = layui.laydate;
                  var start = {
                    min: laydate.now()
                    ,max: '2099-06-16 23:59:59'
                    ,istoday: false
                    ,choose: function(datas){
                      end.min = datas; //开始日选好后，重置结束日的最小日期
                      end.start = datas //将结束日的初始值设定为开始日
                    }
                  };
                  var end = {
                    min: laydate.now()
                    ,max: '2099-06-16 23:59:59'
                    ,istoday: false
                    ,choose: function(datas){
                      start.max = datas; //结束日选好后，重置开始日的最大日期
                    }
                  };
            });
		</script>
	</body>

</html>