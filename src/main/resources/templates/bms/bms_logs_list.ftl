<!DOCTYPE html>
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>后台系统日志</title>
		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/css/global.css" media="all">
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${request.contextPath}/css/table.css" />
		<style>
		  img {
		    display: inline-block;
		    brecord: none;
		    width: 20px;
          }
		</style>
	</head>

	<body>
		<div class="admin-main">
          <form id="form" action="${request.contextPath}/backpage/bmsLogs/list" method="post">
			<blockquote class="layui-elem-quote">
		                   日志标题：<div class="layui-input-inline"><input type="text" name="logTitle" value="${(record.logTitle)!''}" id="logTitle" /></div>
					 </div>
					     请求方法：<div class="layui-input-inline"><input type="text" name="requestMethod" value="${(record.requestMethod)!''}" id="requestMethod" /></div>
                     					 </div>
					   状态：<select style="width:12%;" name="status" lay-verify="" id="isException" value="${(record.isException)!''}">
                            <option value="">全部</option>
                            <option value="0" <#if (((record.status)!'') == '0')>selected="selected"</#if>>正常日志</option>
                            <option value="1" <#if (((record.status)!'') == '1')>selected="selected"</#if>>异常日志</option>
                        </select>

		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 搜索
				</a>
			</blockquote>
			</form>	
			<fieldset class="layui-elem-field">
				<legend>类型列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th>日志标题</th>
								<th>请求uri</th>
								<th>请求方法</th>
								<th>访问者ip</th>
								<th>服务器地址</th>
								<th>是否是异常日志</th>
								<th>用户访问代理</th>
								<th>用户主机系统</th>
								<th>浏览器名称</th>
								<th>执行时间</th>
								<th>日志创建人</th>
								<th>创建时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as record>
						    <tr>
								<td>${(record.logTitle)!''}</td>
								<td>${(record.requestUri)!''}</td>
								<td>${(record.requestMethod)!''}</td>
								<td>${(record.remoteAddr)!''}</td>
								<td>${(record.serverAddr)!''}</td>
								<td>
                                     <#if (record.isException=='0')>
                                        否
                                    </#if>
                                   <#if (record.isException=='1')>
                                        是
                                    </#if>
								</td>
								<td>${(record.userAgent)!''}</td>
								<td>${(record.deviceName)!''}</td>
								<td>${(record.browserName)!''}</td>
								<td>${(record.executeTime/1000)!''}</td>
								<td>${(record.createBy)!''}</td>
								<td>${record.createTime?string("yyyy-MM-dd HH:mm:ss")}</td>
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
				           url:'${request.contextPath}/backpage/bmsLogs/getList',
				           type:'post',
				           data:{"pageNo":obj.curr,"pageSize":10,"logTitle":$('#logTitle').val(),"requestMethod":$('#requestMethod').val(),"isException":$('#isException').val()},
				           success:function(data) {
				            str = ''; 
                            $.each(data.list,function(i,val){
                                str += '<tr>'      
								str += '<td>'+val.logTitle+'</td>'
								str += '<td>'+val.requestUri+'</td>'
								str += '<td>'+val.requestMethod+'</td>'
								str += '<td>'+val.remoteAddr+'</td>'
								str += '<td>'+val.serverAddr+'</td>'

								str += '<td>'+val.isException+'</td>'
								str += '<td>'+val.userAgent+'</td>'
								str += '<td>'+val.deviceName+'</td>'
								str += '<td>'+val.browserName+'</td>'
								str += '<td>'+val.executeTime+'</td>'
								str += '<td>'+val.createBy+'</td>'
								str += '<td>'+val.createTime+'</td>'
								str += '<td>'
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