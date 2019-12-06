<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>店员列表</title>
		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/css/global.css" media="all">
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${request.contextPath}/css/table.css" />
	</head>

	<body>
		<div class="admin-main">
          <form id="form" action="${request.contextPath}/backpage/hyShopSales/list" method="post">
			<blockquote class="layui-elem-quote">
		                    所属店铺：<div class="layui-input-inline">
		                    <select id="shopOwned" name="shopOwned">
		                     <option value="">请选择...</option>
		                     <#list shops as shop>
		                      <option value="${shop.id}" <#if (record?? && record.shopOwned?? && record.shopOwned==shop.id)>selected</#if>>${shop.shopName}</option>
		                     </#list>
		                    </select>
		                    </div>
		          手机号：<div class="layui-input-inline"><input type="text" name="phone" value="${(record.phone)!''}" id="contactTel" /></div>   
                              姓名：<div class="layui-input-inline"><input type="text" name="saleName" value="${(record.saleName)!''}" id="saleName" /></div>   
                                            
		        <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
				 <a href="${request.contextPath}/backpage/hyShopSales/toinput" class="layui-btn layui-btn-small">
					<i class="layui-icon">&#xe61f;</i> 添加店员
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>店员列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
							    <th>店员名称</th>
								<th>所属店铺</th>
								<th>手机号</th>
								<th>openid</th>
								<th>添加时间</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
						        <td>${(record.saleName)!''}</td>
								<td>${(record.hyShop.shopName)!''}</td>
								<td>${(record.phone)!''}</td>
								<td>
                                 ${(record.openid)!'未绑定'}
                                </td>
                                <td>
                                 ${(record.createDate)?string('yyyy-MM-dd HH:mm:ss')!}
                                </td>
                                <td>
                                  <#if record.bak2>
                                  正常
                                  <#else>
                                   停用
                                  </#if>
                                </td>
								<td>
								<div class="layui-btn-group">
								
									<a href="${request.contextPath}/backpage/hyShopSales/toinput?id=${record.id}"  class="layui-btn layui-btn-mini">修改</a>
									<#if record.openid??>
									    <a href="javascript:unBindSalse(${record.id})"  class="layui-btn layui-btn-mini">解绑</a>
									</#if>
									
								</div>    
								</td>
							</tr>
						</#list>
						</tbody>
					</table>

				</div>
			</fieldset>
			<div class="admin-table-page">
				<div id="page" class="page">
				</div>
			</div>
		</div>
		<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
		<script>


			layui.config({
				base: '${request.contextPath}/plugins/layui/modules/'
			});
			function unBindSalse(id){
                    layer.confirm('确认解绑该收款人吗？', {
                          btn: ['确认','算了'] //按钮
                        }, function(){
                             $.ajax({
                               url:'${request.contextPath}/backpage/hyShopSales/unBindSalse',
                               type:'post',
                               data:{"id":id},
                               success:function(data) {
                                   layer.msg(data.message,{time:2000})
                                   window.location.href="${request.contextPath}/backpage/hyShopSales/list";
                                   return;
                              },
                                error : function() {
                                   layer.msg("异常！");
                                }
                          })
                        }, function(){
                          layer.msg('已取消', {
                             time: 2000});
                        });
            }

			layui.use(['icheck', 'laypage','layer'], function() {
				var $ = layui.jquery,
					laypage = layui.laypage,
					layer = parent.layer === undefined ? layui.layer : parent.layer;
				$('input').iCheck({
					checkboxClass: 'icheckbox_flat-green'
				});
				//page
				laypage({
					cont: 'page',
					pages: ${page.pages} //总页数
						,
					groups: 10 //连续显示分页数
						,
					first:true,
					last:true,
					jump: function(obj, first) {
						//得到了当前页，用于向服务端请求对应数据
						var curr = obj.curr;
						if(!first) {
						 $.ajax({
				           url:'${request.contextPath}/backpage/hyShopSales/getList',
				           type:'post',
				           data:{"pageNum":obj.curr,"shopOwned":$('#shopOwned').val(),"phone":$('#phone').val(),"saleName":$('#saleName').val()},
				           success:function(data) { 
				            str = ''; 
                            $.each(data.data.list,function(i,val){
                                str += '<tr>'   
                                str += '<td>'+val.saleName+'</td>'      
								str += '<td>'+val.hyShop.shopName+'</td>'
								str += '<td>'+val.phone+'</td>'
								str += '<td>'+((val.openid==null)?'未绑定':val.openid)+'</td>'
								str += '<td>'+val.createDateStr+'</td>'
							    str += '<td>'+((val.bak2)?'正常':'停用')+'</td>'
							    str += '<td><div class="layui-btn-group">'
                                str += '<a href="${request.contextPath}/backpage/hyShopSales/toinput?id='+val.id+'"  class="layui-btn layui-btn-mini">修改</a>'
                                if(val.openid!=null){
                                 str += '<a href="javascript:unBindSalse('+val.id+');"  class="layui-btn layui-btn-mini">解绑</a>'
                                }
                                str += '</div></td>'
                                str += '</tr>'
                            
                            })
                            $('.layui-elem-field').find('tbody').html(str)
                         },    
                        error : function() {    
                           layer.msg("异常！");    
                        } 
				 })
				 	}
					}
				});



				$('#search').on('click', function() {
					$('#form').submit();
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
			
						
			});
		</script>
	</body>

</html>