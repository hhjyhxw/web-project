<!doctype html>
<html>

	<head>
		<meta charset="utf-8">
		<title><#if (record.id)??>编辑<#else>添加</#if></title>
		<link rel="stylesheet" href="../../plugins/layui/css/layui.css" media="all" />
		<link rel="stylesheet" href="../../css/global.css" media="all">
		<link rel="stylesheet" href="../../plugins/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="../../css/table.css" />
		<link rel="stylesheet" href="../../layui/dist/css/layui.css"  media="all">
	</head>

	<body>
	<form class="layui-form" action="" name="actionForm" method="POST" enctype="multipart/form-data" id="form">
		<input type="hidden" name="id"  id="id" value="${(record.id)!''}">
		<fieldset class="layui-elem-field" style="width: 60%; text-align: center; margin-left: 20%;">
			<legend><#if (record.id)??>编辑<#else>添加</#if></legend>
			<div class="layui-form-item">
		  	</div>
                                   <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="title" lay-verify="required" id="title" value="${(record.title)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">最低总售价</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="minTotalPrice" lay-verify="required" id="minTotalPrice" value="${(record.minTotalPrice)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">最高总售价</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="maxTotalPrice" lay-verify="required" id="maxTotalPrice" value="${(record.maxTotalPrice)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">最低单价</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="minUnitPrice" lay-verify="required" id="minUnitPrice" value="${(record.minUnitPrice)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">最高单价</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="maxUnitPrice" lay-verify="required" id="maxUnitPrice" value="${(record.maxUnitPrice)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">均价</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="averagePriice" lay-verify="required" id="averagePriice" value="${(record.averagePriice)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">最低总面积</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="minHouseArea" lay-verify="required" id="minHouseArea" value="${(record.minHouseArea)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">最高总面积</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="maxHouseArea" lay-verify="required" id="maxHouseArea" value="${(record.maxHouseArea)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">所属楼层</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="storey" lay-verify="required" id="storey" value="${(record.storey)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">分类（1、写字楼、2 新房 3、共享办公、4租房）</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="houseType" lay-verify="required" id="houseType" value="${(record.houseType)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">状态 上架 下架（0下架、1上架）</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="status" lay-verify="required" id="status" value="${(record.status)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">文字详情</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="describes" lay-verify="required" id="describes" value="${(record.describes)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">图片详情</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="introductionDetail" lay-verify="required" id="introductionDetail" value="${(record.introductionDetail)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">所在小区</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="village" lay-verify="required" id="village" value="${(record.village)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">地址</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="addesses" lay-verify="required" id="addesses" value="${(record.addesses)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">房源，房屋来源(1房东、2中介)</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="houseSources" lay-verify="required" id="houseSources" value="${(record.houseSources)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">租房方式(0整租，1合租) </label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="rentWay" lay-verify="required" id="rentWay" value="${(record.rentWay)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">建筑面积（新楼盘需要）</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="buildArea" lay-verify="required" id="buildArea" value="${(record.buildArea)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">开盘时间（新楼盘需要）</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="openDate" lay-verify="required" id="openDate" value="${(record.openDate)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">入住时间（新楼盘需要）</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="intoDate" lay-verify="required" id="intoDate" value="${(record.intoDate)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">经度</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="lng" lay-verify="required" id="lng" value="${(record.lng)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">维度</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="lat" lay-verify="required" id="lat" value="${(record.lat)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">省</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="province" lay-verify="required" id="province" value="${(record.province)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">市</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="city" lay-verify="required" id="city" value="${(record.city)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">县、区</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="county" lay-verify="required" id="county" value="${(record.county)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">乡、镇</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="towns" lay-verify="required" id="towns" value="${(record.towns)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">发布人ID</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="pubUser" lay-verify="required" id="pubUser" value="${(record.pubUser)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">标签</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="tags" lay-verify="required" id="tags" value="${(record.tags)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">特色</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="features" lay-verify="required" id="features" value="${(record.features)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">装修</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="fitup" lay-verify="required" id="fitup" value="${(record.fitup)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">房型</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="houseClasss" lay-verify="required" id="houseClasss" value="${(record.houseClasss)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
                             <div class="layui-form-item">
            <label class="layui-form-label">物业类型</label>
            <div class="layui-input-inline" style="width:70%">
                <input type="text" name="propertyType" lay-verify="required" id="propertyType" value="${(record.propertyType)!''}" placeholder="" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><span style="color:red;">*</span></div>
        </div>
            		  	<div class="layui-form-item">
			    <div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
		  	</div>
		</fieldset>
	</form>


 	<script type="text/javascript" src="../../plugins/layui/layui.js?v=2"></script>
	<script type="text/javascript" src="../../js/jquery.min.js"></script>
	<script>
            layui.config({
                base: '${request.contextPath}/plugins/layui/modules/'
            });
            layui.use(['form','jquery'], function() {
                var form = layui.form(),
                    layer = layui.layer;

                    var formurl = '';
                    if($('#id').val()!=''){
                        formurl = "${request.contextPath}/backpage/houseHousing/update";
                    }else{
                         formurl = "${request.contextPath}/backpage/houseHousing/add";
                    }
                    debugger;
                //监听提交
                form.on('submit(formDemo)', function(data) {
                       $.ajax({
                           url:formurl,
                           type:'post',
                           data:$('#form').serialize(),
                           success:function(data) {
                             if("0000"==data.code){
                               layer.msg('保存成功',{time:2000})
                               setTimeout(function(){window.location="${request.contextPath}/backpage/houseHousing/list"},500);
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