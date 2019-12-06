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
	<div >


	<form class="layui-form" action="" name="actionForm" method="POST" enctype="multipart/form-data" id="form">
                <#--
                <div class="layui-form-item" style="margin-top: 20px;align:center;>
                            <legend><#if (record.id)??>编辑<#else>添加</#if></legend>
                </div>
                -->
                 <div class="layui-form-item" style="margin-top: 20px;>

                </div>
                 <div class="layui-form-item">
                        <div class="layui-input-inline" style="width:70%">
                            <input type="hidden" name="id"  id="id" value="${(record.id)!''}" placeholder="" autocomplete="off" class="layui-input" readonly>
                        </div>
                         <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
                </div>
           <div class="layui-form-item">
             <label class="layui-form-label">标题</label>
                <div class="layui-input-inline" style="width:70%">
                    <input type="text" name="title" lay-verify="required" id="title" value="${(record.title)!''}" placeholder="" autocomplete="off" class="layui-input">
                </div>
                 <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
          </div>

         <div class="layui-form-item">
            <label class="layui-form-label">所在区域</label>
            <div class="layui-input-inline" style="width:70%">
                 <select name="village" lay-verify="required" id="village">
                    <option value="">--请选择--</option>
                    <#if arenList??>
                        <#list arenList as areaObj>
                            <option value="${areaObj.areanName}"  <#if (record.village)?? && record.village==areaObj.areanName>selected="selected"</#if>>${areaObj.areanName}</option>
                        </#list>
                    </#if>
                </select>
              </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>

         <div class="layui-form-item">
            <label class="layui-form-label">售价/平方</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="number" name="minUnitPrice" lay-verify="required" id="minUnitPrice" value="${(record.minUnitPrice?c)!''}" placeholder="售价/平方" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*(单位/元/平方米)</span></div>
        </div>

          <div class="layui-form-item">
                    <label class="layui-form-label">（均价）/平方</label>
                    <div class="layui-input-inline" style="width:70%">
                        <input type="number" name="averagePriice" lay-verify="required" id="averagePriice" value="${(record.averagePriice?c)!''}" placeholder="售价/平方" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux"><span style="color:red;">*(单位/元/平方米)</span></div>
                </div>

         <div class="layui-form-item">
            <label class="layui-form-label">总价</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="number" name="minTotalPrice" lay-verify="required" id="minTotalPrice" value="${(record.minTotalPrice?c)!''}" placeholder="总价" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*(单位/万元)</span></div>
        </div>

       <div class="layui-form-item">
            <label class="layui-form-label">面积</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="number" name="minHouseArea" lay-verify="required" id="minHouseArea" value="${(record.minHouseArea?c)!''}" placeholder="面积" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*(单位/平方米)</span></div>
        </div>
         <div class="layui-form-item">
            <label class="layui-form-label">最大面积</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="number" name="maxHouseArea" lay-verify="required" id="maxHouseArea" value="${(record.maxHouseArea?c)!''}" placeholder="面积" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*(单位/平方米)</span></div>
        </div>

         <div class="layui-form-item">
            <label class="layui-form-label">建筑面积</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="number" name="buildArea" lay-verify="required" id="buildArea" value="${(record.buildArea)!''}" placeholder="面积" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*(单位/平方米)</span></div>
        </div>

       <div class="layui-form-item">
            <label class="layui-form-label">开盘时间</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="openDate" lay-verify="required" id="openDate" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})" value="${(record.openDate?string("yyyy-MM-dd HH:mm:ss"))!}" placeholder="开盘时间" autocomplete="on" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
 <#--
        <div class="layui-form-item">
            <label class="layui-form-label">物业类型</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="propertyType" lay-verify="required" id="propertyType" value="${(record.propertyType)!''}" placeholder="甲级写字楼、普通写字楼等" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">特色</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="features" lay-verify="required" id="features" value="${(record.features)!''}" placeholder="近地铁、新品、热销等" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">装修</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="fitup" lay-verify="required" id="fitup" value="${(record.fitup)!''}" placeholder="豪华装修、精装修等" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
-->
        <#--
        <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block" style="width:70%">
                <select name="status" lay-verify="required">
                    <option value="">--请选择--</option>
                  <option value="0" <#if (record?? && record.status==0)>selected</#if>>下架</option>
                  <option value="1" <#if (record?? && record.status==1)>selected</#if>>上架</option>
                </select>
            </div>
        </div>
        -->

         <div class="layui-form-item">
            <label class="layui-form-label">状态</label>
            <div class="layui-input-block">
              <input type="radio" name="status" value="0" title="下架" <#if (record?? && record.status?? && record.status==0)>checked</#if>>
              <input type="radio" name="status" value="1" title="上架" <#if (record?? && record.status?? && record.status==1)>checked</#if>>
            </div>
          </div>

         <div class="layui-form-item">
            <label class="layui-form-label">房源</label>
            <div class="layui-input-block">
              <input type="radio" name="houseSources" value="0" title="房东" <#if (record?? && record.houseSources==0)>checked</#if>>
              <input type="radio" name="houseSources" value="1" title="中介" <#if (record?? && record.houseSources==1)>checked</#if>>
            </div>
          </div>

          <div class="layui-form-item">
              <label class="layui-form-label">房型选择</label>
              <div class="layui-input-block">
                <select name="newhouseType" lay-verify="required">
                  <option value=""></option>
                  <option value="1" <#if (record?? && record.newhouseType?? && record.newhouseType=='1')>selected</#if>>1卧</option>
                  <option value="2" <#if (record?? && record.newhouseType?? && record.newhouseType=='2')>selected</#if>>2卧</option>
                  <option value="3" <#if (record??  && record.newhouseType?? && record.newhouseType=='3')>selected</#if>>3卧</option>
                  <option value="4" <#if (record?? && record.newhouseType?? && record.newhouseType=='4')>selected</#if>>4卧</option>
                  <option value="5" <#if (record?? && record.newhouseType?? && record.newhouseType=='5')>selected</#if>>5卧以上</option>
                </select>
              </div>
            </div>

           <div class="layui-form-item">
              <label class="layui-form-label">是否特价</label>
              <div class="layui-input-block">
                <input type="radio" name="specifyes" value="0" title="否" <#if (record?? && record.specifyes=='0')>checked</#if>>
                <input type="radio" name="specifyes" value="1" title="是" <#if (record?? && record.specifyes=='1')>checked</#if>>
              </div>
            </div>
           <div class="layui-form-item">
              <label class="layui-form-label">是否最新</label>
              <div class="layui-input-block">
                <input type="radio" name="latest" value="0" title="否" <#if (record?? && record.latest=='0')>checked</#if>>
                <input type="radio" name="latest" value="1" title="是" <#if (record?? && record.latest=='1')>checked</#if>>
              </div>
            </div>

           <div class="layui-form-item">
              <label class="layui-form-label">分类</label>
              <div class="layui-input-block">
                <input type="radio" name="latest" value="0" title="最近开盘" <#if (record?? && record.latest=='0')>checked</#if>>
                <input type="radio" name="latest" value="1" title="优惠楼盘" <#if (record?? && record.latest=='1')>checked</#if>>
                 <input type="radio" name="latest" value="3" title="优选房源" <#if (record?? && record.latest=='1')>checked</#if>>
              </div>
           </div>
         <div class="layui-form-item">
            <label class="layui-form-label">文字详情</label>
            <div class="layui-input-inline" style="width:70%">
                <textarea class="layui-textarea layui-hide" name="describes" lay-verify="" id="describes"><#if record??>${record.describes!''}</#if></textarea>
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>

           <div class="layui-form-item">
                <label class="layui-form-label">图片详情</label>
                <div class="layui-input-inline" style="width:70%">
                    <textarea class="layui-textarea" name="introductionDetail" lay-verify="content" id="introductionDetail"><#if record??>${record.introductionDetail!''}</#if></textarea>
                </div>
                <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
            </div>

              <div class="layui-form-mid layui-word-aux" style="float:right;margin-right:950px;"><span style="color:red;text-align:center;">图片建议640x278 px;大小1M,图片名称不带中文</span></div>
             </div>

            <div class="layui-form-item">
                    <label class="layui-form-label">封面图片</label>
                    <div class="layui-input-inline">
                         <img id="LAY_demo_upload" width="640px" height="278px" <#if record??> src="${request.contextPath}${(record.imageUrl)!''}" </#if>>
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

	</form>
</div>

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
                                           debugger;
                                           LAY_demo_upload.src = "${request.contextPath}"+res.data.src;
                                         // LAY_IMG_URL.value=res.data.src;
                                          $('#LAY_IMG_URL').val(res.data.src)
                                        }
                                      });

                     //富文本上传图片,必须放在 创建一个编辑器前面
                     layedit.set({
                          uploadImage: {
                               url: '${request.contextPath}/backpage/upload/uploadFileImageEdit' //接口url
                              ,type: 'post', //默认post
                               success: function (data) {

                               }
                          }
                     });
                    //1、包含图片的 文本编辑器
                   var detailIndex = layedit.build('introductionDetail',{
                          tool: [
                         			  'strong' //加粗
                         			  ,'italic' //斜体
                         			  ,'underline' //下划线
                         			  ,'del' //删除线
                         			  ,'|' //分割线
                         			  ,'left' //左对齐
                         			  ,'center' //居中对齐
                         			  ,'right' //右对齐
                         			  ,'link' //超链接
                         			  ,'unlink' //清除链接
                         			  ,'face' //表情
                         			  ,'image' //插入图片 ,'help' //帮助
                         			] ,height: 400
                     });
                       layedit.sync(detailIndex);
                      //2、纯文字描述 文本编辑器
                      var  describesIndex = layedit.build('describes', {
                          tool: ['strong','italic','underline','del','left','center', 'right', '|']
                        });

                    //表单使用
                   // var form = layui.form(),
                   // layer = layui.layer;
                    var formurl = '';
                    if($('#id').val()!=''){
                        formurl = "${request.contextPath}/backpage/newHouse/update";
                    }else{
                         formurl = "${request.contextPath}/backpage/newHouse/add";
                    }
                //监听提交
                form.on('submit(formDemo)', function(data) {
                        layedit.sync(detailIndex);
                        layedit.sync(describesIndex);
                        layedit.sync(imgIndex);
                        debugger;
                       $.ajax({
                           url:formurl,
                           type:'post',
                           data:$('#form').serialize(),
                           success:function(data) {
                             if("0000"==data.code){
                               layer.msg('保存成功',{time:2000})
                               setTimeout(function(){window.location="${request.contextPath}/backpage/newHouse/list"},500);
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