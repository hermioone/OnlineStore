<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="/public/head.jspf" %>	
	<style type="text/css">
		form div{
			margin: 5px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			//iframe中的dg对象，是jquery对象
			var dg = parent.$("iframe[title='类别管理']").get(0).contentWindow.$("#dg");
			//窗体弹出默认时禁用验证	
			$("input[name=type]").validatebox({
				required:true,
				missingMessage:'Please input type name',
			});
			$("#ff").form("disableValidation");
			
			//注册button的事件
			$("#btn").click(function() {
				$("#ff").form("enableValidation");
				//如果验证成功，则提交数据
				if($("#ff").form("validate")) {
					//调用submit方法提交数据
					$('#ff').form('submit', {
						url: '${shop}/category/save.action',
						success: function(){
							//如果成功则关闭当前窗体
							parent.$("#win").window("close");  //当前窗体的爹是aindex.jsp的body
							//刷新页面 获取aindex --> iframe -->dg
							//parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("load");  浏览器兼容性问题
							dg.datagrid("reload");   
							//get(0)获得对应的dom对象,contentWindow获得iframe的内容，也就说iframe中html文档
						}
					});

				}
			});
		});
	</script>
</head>
<body>
	<form id="ff" method="post">   
	    <div>   
	        <label for="type">Type:</label>   
	        <input type="text" name="type" data-options="required:true" />   
	    </div>   
	    <div>      
	       	 热点:<input value="true" type="radio" name="hot" />
	       	非热点:<input value="true" type="radio" name="hot" checked="checked"/>  
	    </div> 
	    <div>
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">Add</a>  
	    </div>    
	</form>  
	
</body>
</html>