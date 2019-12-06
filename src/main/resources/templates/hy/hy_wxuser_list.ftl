<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>微信用户列表</title>
		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/css/global.css" media="all">
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${request.contextPath}/css/table.css" />
		<style>
		  img{
		        width: 45px;
		  }
		</style>
	</head>

	<body>
		<div class="admin-main">
          <form id="form" action="${request.contextPath}/backpage/hyWxUser/list" method="post">
			<blockquote class="layui-elem-quote">
		                   昵称：<div class="layui-input-inline"><input type="text" name="nick" value="${(record.nick)!''}" id="nick" /></div>
		        openid：<div class="layui-input-inline"><input type="text" name="openid" value="${(record.openid)!''}" id="openid" /></div>           
                          
		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
				 <a href="${request.contextPath}/backpage/hyShop/toinput" class="layui-btn layui-btn-small">
					<i class="layui-icon">&#xe61f;</i> 添加店铺
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>微信用户列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
							    <th>头像</th>
								<th>昵称</th>
								<th>openid</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
						        <td><img src="${record.headImg!''}"></td>
								<td>${(record.nick)!''}</td>
								<td>${(record.openid)!''}</td>
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
				           url:'${request.contextPath}/backpage/hyWxUser/getList',
				           type:'post',
				           data:{"pageNum":obj.curr,"shopName":$('#shopName').val(),"shopContacts":$('#shopContacts').val(),"contactTel":$('#contactTel').val()},
				           success:function(data) { 
				            str = ''; 
                            $.each(data.data.list,function(i,val){
                                str += '<tr>'   
                                str += '<td><img src="'+val.headImg+'" /></td>'      
								str += '<td>'+val.nick+'</td>'
								str += '<td>'+val.openid+'</td>'
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