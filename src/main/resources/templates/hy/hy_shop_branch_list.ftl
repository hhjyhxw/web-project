<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>门店列表</title>
		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/css/global.css" media="all">
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${request.contextPath}/css/table.css" />
	</head>

	<body>
		<div class="admin-main">
          <form id="form" action="${request.contextPath}/backpage/hyShopBranch/list" method="post">
            <input type="hidden" name="parentId" value="${(record.parentId)!'-1'}" id="parentId" />
			<blockquote class="layui-elem-quote">
		                    店铺名称：<div class="layui-input-inline"><input type="text" name="shopName" value="${(record.shopName)!''}" id="shopName" /></div>
		                   联系电话：<div class="layui-input-inline"><input type="text" name="contactTel" value="${(record.contactTel)!''}" id="contactTel" /></div>           
		                 联系人：<div class="layui-input-inline"><input type="text" name="shopContacts" value="${(record.shopContacts)!''}" id="contactTel" /></div>   
                          
		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
				 <a href="${request.contextPath}/backpage/hyShopBranch/toinputBranch?parentId=${record.parentId}" class="layui-btn layui-btn-small">
					<i class="layui-icon">&#xe61f;</i> 添加店铺
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>店铺列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
							    <th>店铺名称</th>
								<th>联系人</th>
								<th>联系电话</th>
								<th>地址</th>
								<th>签名秘钥</th>
								<th>商户号</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
						        <td>${(record.shopName)!''}</td>
								<td>${(record.shopContacts)!''}</td>
								<td>${(record.contactTel)!''}</td>
								<td>
                                 ${(record.shopAddress)!''}
                                </td>
                                <td>
                                  ${(record.partnerKey)!''}
                                </td>
								<td> 
								${(record.bak1)!''}
                                </td>
								<td>
								<div class="layui-btn-group">
								
									<a href="${request.contextPath}/backpage/hyShopBranch/toinputBranch?id=${record.id}&parentId=${record.parentId}"  class="layui-btn layui-btn-mini">修改</a>
									
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
				           url:'${request.contextPath}/backpage/hyShopBranch/getList',
				           type:'post',
				           data:{"pageNum":obj.curr,"shopName":$('#shopName').val(),"shopContacts":$('#shopContacts').val(),"contactTel":$('#contactTel').val(),"parentId":$('#parentId').val()},
				           success:function(data) { 
				            str = ''; 
                            $.each(data.data.list,function(i,val){
                                str += '<tr>'   
                                str += '<td>'+val.shopName+'</td>'      
								str += '<td>'+val.shopContacts+'</td>'
								str += '<td>'+val.contactTel+'</td>'
								str += '<td>'+val.shopAddress+'</td>'
								str += '<td>'+val.partnerKey+'</td>'
							    str += '<td>'+val.bak1+'</td>'
							    str += '<td><div class="layui-btn-group">'
                                str += '<a href="${request.contextPath}/backpage/hyShopBranch/toinputBranch?id='+val.id+'&parentId=${record.parentId}"  class="layui-btn layui-btn-mini">修改</a>'
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