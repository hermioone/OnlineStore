<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<!-- 引入公共的JSP片段 -->
	<%@ include file="/public/head.jspf"%>
	<style type="text/css">
		form div{
			margin: 10px;
		}
	</style>
	<script type="text/javascript">
		//$.extend({max:function(){}, min:function(){}})  这是给jquery类注册的函数，可以这样调用:$.max(),$.min
		//$.fn.extend({max:function(){}, min:function(){}})  这是给jquery对象注册的函数，可以这样调用:$("div").max(), $("#id").min()
		//$.extend($.fn, {max:function(){}, min:function(){}})  和$.fn.extend({max:function(){}, min:function(){}})一样
		$(function(){
		
			//自定义验证方法
			$.extend($.fn.validatebox.defaults.rules, {
				//函数的名称 : 函数的实现体(又是一个json对象，里面包括函数的实现，和错误消息设置)
				format: {
					//函数实现，如果返回为false,则验证失败
					validator: function(value, param) {
						//获取当前文件的后缀名
						var ext = value.substring(value.lastIndexOf(".") + 1);
						//获取支持的文件后缀名，然后比较即可
						var arr = param[0].split(",");
						for(var i = 0; i < arr.length; i++) {
							if(arr[i] == ext) {
								return true;
							}
						}
						return false;
					},
					message: '文件必须为:{0}'  //占位符
				}
			});
			
			//对类别的下拉列表框进行远程加载
			$('#cc').combobox({    
			    url:'${shop}/category/query.action',    
			    valueField:'id',      //用来区分下拉框每一个选项的
			    textField:'type',
			    panelHeight:'auto',
			    panelWidth:120,
			    width:120,
			    editable:false,
			    required:true,
				missingMessage:'请选择商品所属种类',  
			});
		
			$("input[name=name]").validatebox({
				required:true,
				missingMessage:'请输入商品名称',
			});
			
			$("input[name=price]").numberbox({  
				required:true,
				missingMessage:'请输入商品价格',  
			    min:0,      //最小
			    precision:2,  //精度
			    prefix:'$'   //前缀
			}); 
			
			$("input[name=upload]").validatebox({  
				required:true,
				missingMessage:'请上传商品图片',
				//设置自定义方法
				validType: "format['gif,jpg,png,jpeg']"
			});  
			//当文件域内容发生变化时，则调用验证方法
			$("input[name=upload]").change(function() {
				$(this).validatebox("validate");
			}); 
			
			$("textarea[name=remark]").validatebox({
				required:true,
				missingMessage:'请输入商品简单描述',
			});
			//默认禁止验证功能
			$("#ff").form("disableValidation");
			
			//注册button的事件
			$("#submit").click(function() {
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")) {
					//调用submit方法提交数据
					$("#ff").form('submit', {
						url: '${shop}/product/save.action',
						success: function(){
							//如果成功则关闭当前窗体
							parent.$("#win").window("close");  //当前窗体的爹是aindex.jsp的body
							//刷新页面 获取aindex --> iframe -->dg
							//parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("load");  浏览器兼容性问题
							
							//iframe中的dg对象，是jquery对象
							var dg = parent.$("iframe[title='商品管理']").get(0).contentWindow.$("#dg");
							dg.datagrid("reload");   
							//get(0)获得对应的dom对象,contentWindow获得iframe的内容，也就说iframe中html文档
						}
					});

				}
			});
			$("#reset").click(function() {
				//重置当前表单数据
				$("#ff").form("reset");
			});
		});
	</script>
</head>

<body>
<form title="添加商品" id="ff" method="post" enctype="multipart/form-data">
	<div>
		<label>商品名称:</label> <input type="text" name="name" />
	</div>
	<div>
		<label>商品价格:</label> <input type="text" name="price" />
	</div>
	<div>
		<label>图片上传:</label> <input type="file" name="upload" />
	</div>
	<div>
		<label>所属类别：</label> 
		<input id="cc" name="category.id" />
	</div>
	<div>
		<label>加入推荐:</label> 
			推荐:<input type="radio" name="commend" checked="checked" value="true" />  
			不推荐:<input type="radio" name="commend" value="false" /> 
	</div>
	<div>
		<label>是否有效:</label>
		上架:<input type="radio" name="open" checked="checked"value="true" />
		下架:<input type="radio" name="open" value="false" />
				
	</div>
	<div>
		<label>简单描述:</label>
		<textarea name="remark" cols="40" rows="4"></textarea>
	</div>
	<div>
		<label>详细描述:</label>
		<textarea name="xremark" cols="40" rows="8"></textarea>
	</div>
	<div>
		<a id="submit" href="#" class="easyui-linkbutton">添 加</a> 
		<a id="reset" href="#" class="easyui-linkbutton">重 置</a>
	</div>
</form>
</body>
</html>
