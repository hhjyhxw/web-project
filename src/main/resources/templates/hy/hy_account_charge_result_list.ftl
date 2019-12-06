<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title>充值结果</title>
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
                        <form action="${request.contextPath}/backpage/hyAccountChargeResult/list" id="formId" style="padding-left:33px;">
                             <ul class="findTool">
                                 <input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum!''}">
                                 <li> 批次号： <input type="text" name="batchNo" id="batchNo"  value="${(record.batchNo)!''}" placeholder="" autocomplete="off" ></li>
                                <li>充值状态：<select name="status" onchange="pageSkip(document.getElementById('pageNum').value)" id="status" value="${record.status!''}">
                                                <option value="" >请选择</option>
                                                <option value="0" <#if ((record.status)!'') == '0'>selected</#if>>充值失败</option>
                                                <option value="1" <#if ((record.status)!'') == '1'>selected</#if>>充值成功</option>
                                             </select>
                                 </li>
                                 <li> 员工编号： <input type="text" name="employeeNo" id="employeeNo"  value="${(record.employeeNo)!''}" placeholder="" autocomplete="off" ></li>
                                  <#--
                                 <li>  员工手机：<input type="text" name="employeePhone" id="employeePhone"  value="${(record.employeePhone)!''}" placeholder="" autocomplete="off"></li>
                                  <li> 员工姓名：<input type="text" name="employeeName" id="employeeName"  value="${(record.employeeName)!}" placeholder="" autocomplete="off" ></li>
                                  <li> 所属部门：<input type="text" name="deparmentName" id="deparmentName"  value="${(record.deparmentName)!''}" placeholder="" autocomplete="off"></li>
                                  <li> openid：<input type="text" name="openid" id="openid"  value="${(record.openid)!''}" placeholder="" autocomplete="off" ></li>
                                   <li>昵称：<input type="text" name="nick" id="nick"  value="${(record.nick)!''}" placeholder="" autocomplete="off" ></li>
                                    -->
                                 <li>开始时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="startTime" name="startTime" value="${start!''}"></li>
                                 <li>结束时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="endTime" name="endTime" value="${end!''}"></li>
                                 <li><button id="search" >查询</button></li>
                             </ul>
                        </form>
                    </fieldset>
            </div>
			<fieldset class="layui-elem-field">
				<legend>充值结果</legend>
				<div class="layui-field-box">
					<table class="site-table table-hover">
						<thead>
							<tr>
								<th>员工编号</th>
							    <th>员工姓名</th>
							    <th>手机号</th>
							    <th>openid</th>
							    <th>批次号</th>
							     <th>子批次号</th>
							    <th>总金额</th>
							    <th>充值状态</th>
							    <th>结果描述</th>
							    <th>充值日期</th>
							    <th>充值失败修复</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
						<#list page.list as t>
						    <tr>
						    	<td>${t.employeeNo!""}</td>
						        <td>${t.employeeName!""}</td>
						         <td>${t.employeePhone!""}</td>
                                <td>${t.openid!""}</td>
                                <td>${t.batchNo!""}</td>
                                <td>${t.sonBatchNo!""}</td>
                                <td>${t.totalAmount!""}</td>
                                 <td>
                                        <#if t.status=='0'>充值失败</#if>
                                        <#if t.status=='1'>充值成功</#if>
                                </td>
                                <td>${t.resultDes!""}</td>
                                <td>${t.rechargeDate?string("yyyy-MM-dd HH:mm:ss")}</td>
                                 <td>
                                        <#if t.status=='0' && t.rechargeStatus=='0'>未处理</#if>
                                        <#if t.status=='0' && t.rechargeStatus=='1'>已处理</#if>
                                </td>
								<th>
								<div class="layui-btn-group">
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
                        <a class="" onclick="pageSkip(${page.pages})" href="#" >下一页 </a>
                        </#if>
                        <a class="" onclick="pageSkip(${page.pages})" href="#" >末页 </a>
                        <input type="number" id="inputPageNo" value="${page.pageNum}" name="pageNum" style="width:30px;"/>
                        <button id="skip" onclick='pageSkip(document.getElementById("inputPageNo").value)'>GO</button>
                    </span>
				</div>
			</div>
		</div>
        <script type="text/javascript" src="../../plugins/layui/layui.js"></script>
		<script type="text/javascript" src="../../js/jquery.min.js"></script>
		<script>
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
				           data:{"pageNum":obj.curr,"pageSize":pageSize,"hyWxuser.hyEmployee.employeeNo":$('#employeeNo').val(),
				           "hyWxuser.hyEmployee.employeePhone":$('#employeePhone').val(),
				           "hyWxuser.hyEmployee.employeeName":$('#employeeName').val(),
				           "hyWxuser.openid":$('#openid').val(),
				           "hyWxuser.hyEmployee.deparmentName":$('#deparmentName').val(),
				            "hyWxuser.nick":$('#nick').val()
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
				//提交表单查询
				function pageSkip(pageNum){
                  var formSubmit = document.getElementById('formId');
                  if(pageNum<=0){
                    pageNum = 1;
                  }
                  $('#pageNum').attr('value',pageNum);
                  formSubmit.submit();
                }
				//查询
				$('#search').on('click', function() {
				     var formSubmit = document.getElementById('formId');
				     formSubmit.submit();
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