<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>系统配置</title>
		<meta name="renderer" content="webkit">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">

		<link rel="stylesheet" href="${request.contextPath}/plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="${request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
	</head>

	<body>
			<form class="layui-form" action="" id="form"  enctype="multipart/form-data" method="post">
				<div class="layui-form-item">
					<label class="layui-form-label">系统名称：</label>
					<div class="layui-input-inline" style="width:70%">
						<input type="text" name="systemName" value="${(setting.systemName)!}"  lay-verify="systemName"  autocomplete="off" placeholder="" class="layui-input">
					</div>
				</div>
			 <div class="layui-form-item">
                <label class="layui-form-label">系统版本：</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="systemVersion" value="${(setting.systemVersion)!}"  lay-verify="systemVersion" autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
             <div class="layui-form-item">
                <label class="layui-form-label">系统描述：</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="systemDescription" value="${(setting.systemDescription)!}" lay-verify="systemDescription"  autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
             <div class="layui-form-item">
                <label class="layui-form-label">防xss攻击,敏感词过滤：</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="htmlWords" value="${(setting.htmlWords)!}" lay-verify="htmlWords"  autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
             <div class="layui-form-item">
                <label class="layui-form-label">防xss攻击,免过滤url：</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="ignoreUrls" value="${(setting.ignoreUrls)!}" lay-verify="ignoreUrls"  autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>
             <div class="layui-form-item">
                <label class="layui-form-label">防xss\crsf攻击,免过滤url：</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="ignoreCsrfUrls" value="${(setting.ignoreCsrfUrls)!}" lay-verify="ignoreCsrfUrls"  autocomplete="off" placeholder="" class="layui-input">
                </div>
            </div>

				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
		<script>
			layui.use(['form'], function() {
				var form = layui.form(),
				layer = parent.layer === undefined ? layui.layer : parent.layer;
				//自定义验证规则
				form.verify({

				});

				//监听提交
				form.on('submit(demo1)', function(data) {
				    	$.ajax({
				           url:'${request.contextPath}/backpage/setting/update',
				           type:'post',
				           data:$('#form').serialize(),
				           success:function(data) { 
				             if("0000"==data){
				                layer.msg('保存成功',{time:2000})
				                  setTimeout(function(){window.location.href="${request.contextPath}/backpage/setting/beforeUpdate";},1000);
				              }else{
				                 layer.msg('保存失败',{time:2000})
				                 setTimeout(function(){window.location.href="${request.contextPath}/backpage/setting/beforeUpdate";},1000);
				               }
                         },    
                        error : function() {    
                           layer.msg("异常！");    
                        } 
				 })
				 return false;
				});
			});
		</script>
	</body>

</html>