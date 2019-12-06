<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>门店</title>
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
		<div style="margin: 15px;">
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
				<legend>门店<#if shop??>修改<#else>添加</#if></legend>
			</fieldset>

			<form class="layui-form" <#if shop??>action="${request.contextPath}/backpage/hyShop/update"<#else>action="${request.contextPath}/backpage/hyShop/add"</#if> id="form">
			   <#if shop??><input type="hidden" name="id" value="${(shop.id)!''}"></#if>
				<div class="layui-form-item">
					<label class="layui-form-label">店铺名称</label>
					<div class="layui-input-block">
						<input type="text" name="shopName" <#if shop??>value="${shop.shopName}" </#if>  lay-verify="required" autocomplete="off" placeholder="请输入店铺名称" class="layui-input" style="width:190px;">
					</div>
				</div>
				<div class="layui-form-item">
                    <label class="layui-form-label">选择总店</label>
                    <div class="layui-input-block">
                   <select name="parentId"  style="width:190px;">
                        <#list parentShopList as m>
                          <option value="${m.id}" <#if shop??><#if shop.parentId==m.id>selected</#if></#if>  >${m.shopName}</option>
                        </#list>
                    </select>
                    </div>
                </div>
				<div class="layui-form-item">
					<label class="layui-form-label">联系人</label>
					<div class="layui-input-block">
						<input type="text" name="shopContacts" <#if shop??>value="${shop.shopContacts!''}" </#if>  lay-verify="required" autocomplete="off" placeholder="联系人" class="layui-input" style="width:190px;">
					</div>
				</div>
			     <div class="layui-form-item">
					<label class="layui-form-label">联系电话</label>
					<div class="layui-input-block">
						<input type="text" name="contactTel" <#if shop??>value="${shop.contactTel!''}" </#if>  lay-verify="required" autocomplete="off" placeholder="联系电话" class="layui-input" style="width:190px;">
					</div>
				</div>
				  <div class="layui-form-item">
					<label class="layui-form-label">店铺地址</label>
					<div class="layui-input-block">
						<input type="text" name="shopAddress" <#if shop??>value="${shop.shopAddress!''}" </#if>  lay-verify="required" autocomplete="off" placeholder="店铺地址" class="layui-input" style="width:250px;">
					</div>
				</div>
                <div class="layui-form-item">
					<label class="layui-form-label">经度</label>
					<div class="layui-input-block">
						<input type="text" name="lnt" <#if shop??>value="${shop.lnt!''}" </#if>  lay-verify="required" autocomplete="off" placeholder="经度" class="layui-input" style="width:250px;">
					</div>
				</div>
				<div class="layui-form-item">
                    <label class="layui-form-label">纬度</label>
                    <div class="layui-input-block">
                        <input type="text" name="lat" <#if shop??>value="${shop.lat!''}" </#if>  lay-verify="required" autocomplete="off" placeholder="纬度" class="layui-input" style="width:250px;">
                    </div>
                </div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					    <a href="javascript:history.go(-1);" class="layui-btn">返回</a>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
		<script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
		<script>
		
			layui.use(['form','jquery'], function() {
				var form = layui.form(),
					layer = layui.layer;
					
				 
				//监听提交
				form.on('submit(demo1)', function(data) {
					   $.ajax({
				           url:$('#form').attr('action'),
				           type:'post',
				           data:$('#form').serialize(),
				           success:function(data) { 
				             if("0000"==data.code){
				               layer.msg('添加成功',{time:2000})
				               setTimeout(function(){window.location="${request.contextPath}/backpage/hyShop/list"},500);
				              }else{
				                  layer.msg(data.message,{time:2000})
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