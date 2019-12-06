<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<title>HouseHousing</title>
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
            <form action="${request.contextPath}/backpage/newHouse/list" id="formId" style="padding-left:33px;">
                 <ul class="findTool">
                     <input type="hidden" id="pageNum" name="pageNum" value="${page.pageNum}">

                     <li> 标题： <input type="text" name="title" id="title"  value="${(record.title)!}" placeholder="" autocomplete="off" ></li>
                   <li> 区域：
                    <select name="village" id="village">
                      <option value="">--请选择--</option>
                        <#if arenList??>
                            <#list arenList as areaObj>
                                <option value="${areaObj.areanName}"  <#if (record.village)?? && record.village==areaObj.areanName>selected="selected"</#if>>${areaObj.areanName}</option>
                            </#list>
                        </#if>
                    </select>
                    </li>


                     <#--
                     <li>开始时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="startTime" name="startTime" value="${(start)!''}"></li>
                     <li>结束时间<input type="text" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" id="endTime" name="endTime" value="${(end)!''}"></li>
                     -->
                     <li><button id="search" >查询</button></li>
                     <li style="margin-left: 30px;height: 39px;margin-top: 2.5px;">
                        <a href="javascript:void();" id="toAdd" class="layui-btn layui-btn-small">
                            <i class="layui-icon">&#xe61f;</i> 添加
                       </a>
                     </li>
                 </ul>
            </form>
        </fieldset>
        </div>
        <fieldset class="layui-elem-field">
            <legend>列表</legend>
            <div class="layui-field-box">
                <table class="site-table table-hover">
                    <thead>
                        <tr>
                         <th>编号</th>
                         <th>标题</th>
                         <th>分类</th>
                         <th>所属区域</th>
                         <th>状态</th>
                        <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    <#list page.list as t>
                        <tr>
                         <td>${t.id}</td>
                         <td>${t.title!''}</td>
                         <td>
                            <#if (t.houseType==1)>写字楼</#if>
                            <#if (t.houseType==2)>新房</#if>
                            <#if (t.houseType==3)>共享办公</#if>
                            <#if (t.houseType==4)>租房</#if>
                         </td>
                          <td>${t.village!''}</td>
                         <td>
                             <#if t.status==0>下架</#if>
                             <#if t.status==1>上架</#if>
                         </td>
                            <th>
                            <div class="layui-btn-group">
                                 <a href="javascript:toEdit(${(t.id)!''})"  class="layui-btn layui-btn-mini">修改</a>
                                 <a href="javascript:delById(${(t.id)!''})"  class="layui-btn layui-btn-mini">删除</a>
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
        //跳转新增
        $('#toAdd').on('click', function() {
            window.location.href = "${request.contextPath}/backpage/newHouse/toinput"
        });
        //跳转修改
        function toEdit(id){
            window.location.href = "${request.contextPath}/backpage/newHouse/toinput?id="+id;
        }
        //删除
        layui.use(['layer'], function() {
              var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句
        });
        //删除
        function delById(id){
            if(confirm("删除了不能恢复,确定要删除？")){
                var url = '${request.contextPath}/backpage/newHouse/del';
                $.post(url, {
                    'id':id
                }, function(data) {
                     if("0000"==data.code){
                        layer.msg("删除成功");
                        window.location.href = "${request.contextPath}/backpage/newHouse/list";
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