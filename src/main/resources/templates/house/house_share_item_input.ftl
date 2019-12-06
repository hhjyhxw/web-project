<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title><#if (record.id)??>编辑<#else>添加</#if></title>
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
	<form class="layui-form" action="" name="actionForm" method="POST" enctype="multipart/form-data" id="form">
		<input type="hidden" name="id"  id="id" value="${(record.id)!''}">
		<fieldset class="layui-elem-field" style="width: 60%; text-align: center; margin-left: 20%;">
			<legend><#if (record.id)??>编辑<#else>添加</#if></legend>
			 <input type="hidden" name="parentId" lay-verify="required" id="parentId" value="${(record.parentId)!''}" placeholder="" autocomplete="off" class="layui-input">
			<div class="layui-form-item">
		  	</div>
           <div class="layui-form-item">
            <label class="layui-form-label">名称描述</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="itemname" lay-verify="required" id="itemname" value="${(record.itemname)!''}" placeholder="名称描述（独立办公室/三人间）" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*名称描述（独立办公室/三人间）</span></div>
        </div>

         <div class="layui-form-item">
             <label class="layui-form-label">  价格</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="number" name="price" lay-verify="required" id="price" value="${(record.price?c)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">* 单位（元/工位/月）</span></div>
        </div>


          <div class="layui-form-item">
                <label class="layui-form-label">封面图片</label>
                <div class="layui-input-inline">
                     <img id="LAY_demo_upload" width="480px" height="200px" <#if record??> src="${request.contextPath}${(record.imageUrl)!''}" </#if>>
                     <input lay-verify="content" type="hidden" name="imageUrl"  <#if record??>value="${(record.imageUrl)!''}"</#if> id="LAY_IMG_URL">
                 </div>

          </div>

            <div class="layui-form-item">
                <label class="layui-form-label">添加图片</label>
                 <div class="layui-input-inline">
                    <input type="file" name="file" lay-type="images" width="90px" class="layui-upload-file">
               </div>
            </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                 <a href="javascript:history.go(-1);" class="layui-btn">返回</a>
            </div>
        </div>
		</fieldset>
	</form>


 <script type="text/javascript" src="${request.contextPath}/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="${request.contextPath}/js/jquery.min.js"></script>
    <script>
             layui.use(['upload','form','jquery','layedit'], function() {
                var form = layui.form(),
                    layer = layui.layer;
                    layedit = layui.layedit;
                    var imgIndex =  layui.upload({
                        url: '${request.contextPath}/backpage/upload/uploadGoodsImage'
                        ,method: 'post' //上传接口的http类型
                        ,success: function(res){
                          if(res.code!='0'){
                             layer.msg(res.msg,{time:2000})
                             return ;
                           }
                           LAY_demo_upload.src = "${request.contextPath}"+res.data.src;
                          $('#LAY_IMG_URL').val(res.data.src)
                        }
                  });

                    var formurl = '';
                    if($('#id').val()!=''){
                        formurl = "${request.contextPath}/backpage/houseShareItem/update";
                    }else{
                         formurl = "${request.contextPath}/backpage/houseShareItem/add";
                    }
                    debugger;
                //监听提交
                form.on('submit(formDemo)', function(data) {
                       layedit.sync(imgIndex);
                       $.ajax({
                           url:formurl,
                           type:'post',
                           data:$('#form').serialize(),
                           success:function(data) {
                             if("0000"==data.code){
                               layer.msg('保存成功',{time:2000})
                               setTimeout(function(){window.location="${request.contextPath}/backpage/houseShareItem/list"},500);
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