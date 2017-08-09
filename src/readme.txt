1:注解与XML的比较:
	1.1: XML在开发的时候比较慢，代码冗余度高，在更新Java类的时候XML不会同步更新，但是它在维护的时候查看类之间的关系比较方便
	1.2: 注解开发速度快，维护速度慢
	1.3: 使用注解首先要开启: <context:component-scan base-package="cn.it.shop..">

2: Spring的AOP是基于动态代理模式，动态代理有两种:
		基于JDK Proxy代理，此方法适合有接口的类，
		如果类没有接口，则生成的AOP就是CGLIB代理
	因此使用AOP时动态注入的类型必须用接口，不能用具体实现类
		@Autowired
		private CategoryService categoryService
		不能用:private CategoryServiceImpl categoryService;
			因为实现类有接口，所以注入的是JDK Proxy，这个只能用接口去接
			
			
index.html:
	<!-- 
		html标签称为盒子，盒子模型，盒子有两种：块级元素(div)  行内元素(span)
		行内元素的宽与高是根据内容的宽和高，设置width无效，而块级元素设置width有效
		<div style="width: 100px">111</div>
		margin:所选元素的外边界和它所处的元素的内边界的距离
		padding:所选元素的内边界和它里面的元素的外边界的距离
	 -->
	 
	 
1:Hibernate查询策略:

	在Hibernate中，一级缓存不是用来提升性能的，是用来处理事务的，二级缓存为sessionFactory缓存，对所有的session都有效，声明周期和sessionFactory相同
	sessionFactory是单例的，而且项目启动时创建

	H:有两种查询方式，第一种为session，第二种为hql
	1.1:session.save(), update(), delete(), get():此方式仅仅操作一条记录，默认不用任何配置就支持二级缓存,因为:read-only对session是生效的
		在session中，如果二级缓存中配置了read-only，则session的update()和delete()操作是失败，但是save()和get()，load()是成功的
	1.2:此方式默认时用来操作多条记录的，list(),executeUpdate()，二级缓存的配置包括read-only默认是无效的。注意 hql是没有save方法的，如果需要插入数据，
		只能调用session.save()
	
	
2:html和jsp:
	<meta http-equiv="pragma" content="no-cache">  ==>  pragma: 设置页面是否缓存，用于HTTP1.0协议
	<meta http-equiv="cache-control" content="no-cache">   ==>  cache-control:  设置页面是否缓存，用于HTTP1.1协议
	<meta http-equiv="expires" content="0">                ==>  expires:  如果支持缓存，则有效期
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">    ==>  keywords:  关键字
	<meta http-equiv="description" content="This is my page">	  ==>  description:  页面的描述
	
	并不是所有的容器都支持meta，例如tomcat就不解析，所以设置是无效的
	no-cache:仅仅支持IE，不支持火狐和google浏览器, no-store:支持所有浏览器，但是google浏览器get方式不支持
			   (IE浏览器)当前当问缓存页面的请求为post请求时，返回时候就会出现"页面过期",但是get方式访问b.jsp返回时，直接到服务器加载新页面，而不会提示"页面过期"
			   		虽然get和post一个访问服务器加载页面，一个返回页面过期，但都证明了no-cache生效，没有缓存
	
	