<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title>员工列表</title>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../../css/global.css" media="all">
		<link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../css/table.css" />
	</head>

	<body>

			<blockquote class="layui-elem-quote">
			       员工编号： <input type="text" name="employeeNo" id="employeeNo"  value="${(record.employeeNo)!''}" placeholder="" autocomplete="off" >
                  员工手机：<input type="text" name="employeePhone" id="employeePhone"  value="${(record.employeePhone)!''}" placeholder="" autocomplete="off">
                员工姓名：<input type="text" name="employeeName" id="employeeName"  value="${(record.employeeName)!}" placeholder="" autocomplete="off" >
                 所属部门：<input type="text" name="deparmentName" id="deparmentName"  value="${(record.deparmentName)!''}" placeholder="" autocomplete="off">
                   openid：<input type="text" name="openid" id="openid"  value="${(record.openid)!''}" placeholder="" autocomplete="off" >

		       <a href="javascript:;" class="layui-btn layui-btn-small" id="search">
					<i class="layui-icon">&#xe615;</i> 查找
				</a>
				<#--
				<button class="layui-btn layui-btn-small" id="toAdd">
				  <i class="layui-icon">&#xe608;</i> 添加
				</button>
				-->
				<button class="layui-btn layui-btn-small" id="toImport">
                  <i class="layui-icon">&#xe608;</i> 导入
                </button>
			</blockquote>

			<fieldset class="layui-elem-field">
				<legend>员工列表</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th>员工编号</th>
							    <th>员工手机</th>
							    <th>员工姓名</th>
							    <th>所属部门</th>
							    <th>openid</th>
							    <th>用户总额</th>
							    <th>冻结金额</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as t>
						    <tr>
						    	<td>${t.employeeNo!""}</td>
						        <td>${t.employeePhone!""}</td>
						        <td>${t.employeeName!""}</td>
                                <td>${t.deparmentName!""}</td>
                                <td>${t.openid!""}</td>
                                <td>${t.accountTotal!""}</td>
                                <td>${t.accountFreeze!""}</td>
								<th>
								<div class="layui-btn-group">
								 	<#--
								 	<button class="layui-btn layui-btn-small" onclick="toEdit(${t.id})">
								    	<i class="layui-icon">&#xe642;</i>&nbsp;编辑
								  	</button>
								  	-->
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
				</div>
			</div>
		</div>
    	<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
    		<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
		<script>
			layui.config({
				base: '../../plugins/layui/modules/'
			});

			layui.use(['laypage','layer'], function() {
				var $ = layui.jquery,
					laypage = layui.laypage,
					layer = parent.layer === undefined ? layui.layer : parent.layer;
				//$('input').iCheck({
				//	checkboxClass: 'icheckbox_flat-green'
				//});
				
				var pageSize = ${page.pageSize};
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
				           url:'${request.contextPath}/backpage/hyEmployee/getList',
				           type:'post',
				           data:{"pageNum":obj.curr,"pageSize":pageSize,"employeeNo":$('#employeeNo').val(),
				           "employeePhone":$('#employeePhone').val(),
				           "employeeName":$('#employeeName').val(),
				           "openid":$('#openid').val(),
				           "deparmentName":$('#deparmentName').val()
				           },
				           success:function(data) { 
				            str = ''; 
                            $.each(data.data.list,function(i,val){
                            	
                            	str += '<tr>';
                            	str += '<th>'+val.employeeNo+'</th>';
                            	str += '<th>'+val.employeePhone+'</th>';
                            	str += '<th>'+val.employeeName+'</th>';
                            	str += '<th>'+val.deparmentName+'</th>';
                            	str += '<th>'+val.openid+'</th>';
                            	str += '<th>'+val.accountTotal+'</th>';
                            	str += '<th>'+val.accountFreeze+'</th>';
                            	str += '<th>';
                            	str += '<div class="layui-btn-group">';
                            	//str += '<button class="layui-btn layui-btn-small" onclick="toEdit('+val.id+')">';
                            	//str += '<i class="layui-icon">&#xe642;</i>&nbsp;编辑';
								//str += '</button>';
                            	str += '</div>';
								str += '</th>';
						    	str += '</tr>';       
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
				//查询
				$('#search').on('click', function() {
					var employeeNo = $('#employeeNo').val();
                    var employeePhone = $('#employeePhone').val();
                    var employeeName = $('#employeeName').val();
                    var openid = $('#openid').val();
                    var deparmentName = $('#deparmentName').val();
					window.location.href = "${request.contextPath}/backpage/hyEmployee/list?employeeNo="+employeeNo
					+"&employeePhone="+employeePhone
					+"&employeeName="+employeeName
					+"&openid="+openid
					+"&deparmentName="+deparmentName
					+"&pageNo="+1;
					
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
			
		</script>
	</body>

</html>