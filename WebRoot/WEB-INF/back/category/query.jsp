<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<%@ include file="/public/head.jspf" %>	
	<style type="text/css">
		.searchbox {
			margin: -4;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			$('#dg').datagrid({    
				method:'GET',   //直接请求json文件的话，必须用GET，否则会报错
				queryParams: {type:''},
				//指定id字段为标识字段，在删除，更新的时候有用，如果配置此字段，在翻页的时候被选中的字段是不会丢失的
				idField:'id',
				frozenColumns:[[
					{field:'xyz', checkbox:true},
					{field:'id', title:'ID', width:100}
				]],
				//数据显示在同行，默认为true
				nowrap:true,
				//斑马线
				striped:true,
				//自动适应列，如果设置此属性，则不会出现水平滚动条，在演示冻结列的时候此参数不要设置
				fitColumns:true,
				//单行显示，为true的话全选功能会失效
				singleSelect:false,
				pagination:true,
				pageSize:5,
				pageList:[5, 10, 15, 20],
				toolbar: [{
					iconCls: 'icon-add',
					text:'添加类别',
					handler: function(){
						parent.$("#win").window({
							title:"添加类别",
							width:400,
							height:500,
							content:'<iframe src="${shop}/send/back/category/save" frameborder="0" width="100%" height="100%" />'
						});
					}
				},'-',{
					iconCls: 'icon-help',
					text:'更新类别',
					handler: function(){
						var rows = $("#dg").datagrid("getSelections");
						if(rows.length != 1) {
							//弹出提示信息
							$.messager.show({
								title:'Error Message',
								msg:'Please select one',
								timeout:5000,
								showType:'slide'
							});
						}else {
							//1.弹出更新页面
							parent.$("#win").window({
							title:"更新类别",
							width:400,
							height:250,
							content:'<iframe src="${shop}/send/back/category/update" frameborder="0" width="100%" height="100%" />'
						});
						}
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除类别',
					handler: function(){
						//1.判断是否有选中记录
						var rows = $("#dg").datagrid("getSelections");
						//rows:返回被选中的行，如果没有任何行被选中，则返回空数组
						if(rows.length == 0) {
							//弹出提示信息
							$.messager.show({
								title:'Error Message',
								msg:'Please select at least one',
								timeout:5000,
								showType:'slide'
							});
							
						}else {
							//提示是否确认删除，如果确认则执行删除的逻辑
							$.messager.confirm('Confirm', 'Delte？', function(r){
								if (r){
									
								    //1.获取被选中的纪录，然后从纪录中获取相应的id们
								    var ids = "";   //必须是空字符串，否则拼接后会变成null1234....
								    //2.拼接id的值，然后发送给后台
								    for(var i = 0; i < rows.length; i++) {
								    	ids += rows[i].id + ",";
								    }
								    ids = ids.substring(0, ids.lastIndexOf(","));
								    //3.发送ajax请求
								    $.post("${shop}/category/deleteByIds.action", {ids:ids}, function(data){
								    	if(data == "true") {
								    		//取消选中的所有行
								    		$("#dg").datagrid("uncheckAll");
								    		$("#dg").datagrid("reload");
								    	}else {
								    		$.messager.show({
												title:'Error Message',
												msg:'Delete Failed',
												timeout:5000,
												showType:'slide'
											});
								    	}
								    }, "text");
								}
							});

							
						}
					}
				},'-',{
					text:'<input id="ss" name="search"/>',			
				}],
				
				/* rowStyler: function(index,row){
					if (index % 2 == 0){
						//返回的字符串默认交给style
						return 'background-color:#F0F8FF';
					}else {
						return 'background-color:#F5F5DC';
					}
				}, */

				//请求数据的url地址
			    url:'${shop}/category/queryJoinAction',   
			    //配置dg的列字段 field:列字段名称，与json的key捆绑，title:列文本的标题，显示给别人看的
			    columns:[[  
			        {field:'type',title:'Type',width:100,align:'center',
			        	//用来格式化当前列的内容，返回的是最终的数据
			        	formatter: function(value,row,index){
							return "<span title= " + value + ">" + value + "</span>";
						}    	
			        },    
			        {field:'hot',title:'Hot',width:100,align:'center',
			        	//设置当前单元格的样式，返回的字符串直接交给style
			        	/* styler: function(value,row,index){
							if (value == false){
								return 'background-color:#F0F8FF';
							}else {
								return 'background-color:#8FBC8F';
							}
						} */
						formatter: function(value,row,index){
							//row.hot == value
			        		if(row.hot) {   //if(value)
			        			return "<input type='checkbox' checked='checked' disabled='disabled' />";
			        		}else {
			        			return "<input type='checkbox' disabled='disabled' />";
			        		}
						}
			        	
			        }, 
			        {field:'login',title:'Administer',width:100,align:'center',
			        	formatter: function(value,row,index){
			        		if(row.account != null && row.account.login != null) {
			        			return row.account.login;
			        		}
						}
			        }
			    ]]    
			}); 
			//把普通的文本框转化为搜索文本框
			$('#ss').searchbox({ 
				//触发查询事件
				searcher:function(value,name){ 
					//获取当前查询的关键字，通过dg来重新加载
					/* alert(value + "," + name)  */
					$('#dg').datagrid('load',{
						type:value
					});				
				}, 
				prompt:'Please Input Value'   //缺省提示信息
			}); 
		});
	</script>
</head>
<body>
	<table id="dg"></table> 
	
</body>
</html>