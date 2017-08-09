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
			
			//对管理员的下拉列表框进行远程加载
			$('#cc').combobox({    
			    url:'${shop}/account/query.action',    
			    valueField:'id',    
			    textField:'login',
			    panelHeight:'auto',
			    panelWidth:120,
			    width:120,
			    editable:false 
			});			
			
			//完成数据的回显
			var rows = dg.datagrid("getSelections");
			$('#ff').form('load',{
				id:rows[0].id,
				type:rows[0].type,
				hot:rows[0].hot,
				'account.id':rows[0].account.id
			});
			
			


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
						url: '${shop}/category/update.action',
						success: function(){
							//如果成功则关闭当前窗体
							parent.$("#win").window("close");  //当前窗体的爹是aindex.jsp的body
							//刷新页面 获取aindex --> iframe -->dg
							//parent.$("iframe[title='类别管理']").contents().find("#dg").datagrid("load");  浏览器兼容性问题
							  
							//get(0)获得对应的dom对象,contentWindow获得iframe的内容，也就说iframe中html文档
							dg.datagrid("reload");
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
	       	非热点:<input value="false" type="radio" name="hot" />  
	    </div> 
	    <div>
	    	<!-- <select id="cc" class="easyui-combobox" name="dept" style="width:200px;">   基于html代码的方式
			    <option value="aa">aitem1</option>   
			    <option>bitem2</option>   
			    <option>bitem3</option>   
			    <option>ditem4</option>   
			    <option>eitem5</option>   
			</select>  -->
			<label for="account.id">Account:</label>  
			<input id="cc" name="account.id">  
	    </div>  
	    <div>
	    	<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">Edit</a>  
	    	<input type="hidden" name="id">
	    </div>  
	    
	</form>  
	
</body>
</html>