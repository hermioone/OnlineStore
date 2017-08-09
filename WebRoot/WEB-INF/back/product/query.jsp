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
				queryParams: {name:''},
				//指定id字段为标识字段，在删除，更新的时候有用，如果配置此字段，在翻页的时候被选中的字段是不会丢失的
				idField:'id',
				frozenColumns:[[
					{field:'xyz', checkbox:true},
					{field:'id', title:'商品编号', width:100}
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
					text:'添加商品',
					handler: function(){
						parent.$("#win").window({
							title:"添加商品",
							width:500,
							height:600,
							content:'<iframe src="${shop}/send/back/product/save" frameborder="0" width="100%" height="100%" />'
						});
					}
				},'-',{
					iconCls: 'icon-help',
					text:'更新商品',
					handler: function(){
						alert("更新商品");
					}
				},'-',{
					iconCls: 'icon-remove',
					text:'删除商品',
					handler: function(){
						alert("删除商品")
					}
				},'-',{
					text:'<input id="ss" name="search"/>',			
				}],
				

				//请求数据的url地址
			    url:'${shop}/product/queryJoinCategory.action',   
			    //配置dg的列字段 field:列字段名称，与json的key捆绑，title:列文本的标题，显示给别人看的
			    columns:[[  
			        {field:'name',title:'商品名称',width:200},    
			        {field:'remark',title:'简单介绍',width:300}, 
			        {field:'category.type',title:'所属类别',width:200,align:'center',
			        	formatter: function(value,row,index){
			        		if(row.category != null && row.category.type != null) {
			        			return row.category.type;
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
						name:value
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