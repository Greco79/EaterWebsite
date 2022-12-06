<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<meta charset="UTF-8" />
	<title>依特-用户注册</title>
	<style type="text/css">
	body{
		margin: 0px;
		padding: 0px;
	}
	.two1{
		width: 360px; 
		height: 300px;
		position:absolute;
		top:120px; 
		left:562px; 
		border:1px solid grey;
		border-radius: 5px;
		-moz-opacity:0.85;
		filter:alpha(Opacity=85);
		opacity: 0.85;
		background-color:dimgrey;
		/*background-color:FF3330;*/
		z-index:0;
	}
	.two2 {
		width: 360px; 
		height: 260px;
		position:absolute;
		top:120px; 
		left:562px; 
		border:1px solid grey;
		border-radius: 5px;
	}
	.three1{
		margin-top:45px;
		margin-left:36px;
		padding-left:10px;
		width:280px;
		height: 40px;
		border: 1px solid lightgrey;
		border-radius: 5px;
		font-size:15px;
		z-index:10;
	}
	.three2{
		margin-top:20px;
		margin-left:36px;
		padding-left:10px;
		width:280px;
		height: 40px;
		border: 1px solid lightgrey;
		border-radius: 5px;
		font-size:15px;
		z-index:10;
	}
	.three3{
		margin-top:45px;
		margin-left:35px;
		width:300px;
		height:45px;
		//background-color:#D24D57;
		background-color:#E00000;
		border-radius: 5px;
		border: 1px solid #E00000;
		font-size:20px;
		font-weight:bold;
		color:white;
		z-index:10;
	}
	.one2{
		display:block;
		position: absolute; 
		top:380px; 
		left:660px;
		width:140px;
		//padding-left:5px;
		background-color:darkgrey;
		font-size:13px;
		color:white;
		height:18px;
		border-radius: 9px;
		border: 1px solid darkgrey;
	}
	.one3{
		text-decoration:none;
		color:#EB7347;
	}
	 #bgimg{
     position:fixed;
     top: 0;
     left: 0;
     width:100%;
     height:100%;
     min-width: 1000px;
     z-index:-10;
     zoom: 1;
     background-color: #fff;
     background: url(meigui.jpg) no-repeat;
     background-size: cover;
     -webkit-background-size: cover;
     -o-background-size: cover;
     background-position: center 0;
}
	#fail {
		color:red;
		font-size:3px;
		padding-left:550px;
		padding-top:120px;
	}
	</style>
</head>
<body>
   <div id="bgimg"></div>
	<div class="one1">
		<div class="two1"></div>
		<form class="two2" method="post" action="set.jsp">
				<input class="three1" type="text" name="uname" required="required" placeholder="您的帐号"/>
				<input class="three2" type="password" name="upass" required="required" placeholder="您的密码"/>
				<input class="three2" type="password" name="reupass" required="required" placeholder="再次确认您的密码"/>
				<button class="three3" type="submit">注 册</button>
		</form>
	</div>
	
	<%
	// 判断是否有请求内容
	// 在自提交的页面中，必须对程序第一次运行做出处理
	%>
<
<%--
	除了insert , update , delete 之外，还可以进行create操作
--%>
<%!
	// 定义数据库驱动程序
	String DBDRIVER = "com.mysql.jdbc.Driver" ;
	// 定义数据库连接地址
	String DBURL = "jdbc:mysql://127.0.0.1:3306/wxy" ;
	//定义用户名和口令
	String user="root";
	String pwd="123451";

	// 定义数据库连接对象，属于java.sql包中的接口
	Connection conn = null ;

	// 定义Statement对象，用于操作数据库
	Statement stmt = null ;

	// 定义一字符串变量，用于保存SQL语句
	String sql = null ;
%>
<%
	// 1、加载驱动程序
	try
	{
		Class.forName(DBDRIVER) ;
	}
	catch(Exception e)
	{
		out.println("数据库驱动程序加载失败！！！") ;
	}

	// 2、连接数据库
	try
	{
		conn = DriverManager.getConnection(DBURL,user,pwd) ;
	}
	catch(Exception e)
	{
		out.println("数据库连接失败！！！"+e) ;
	}

	// 3、操作数据库
	// 通过Connection对象实例化Statement对象
	try
	{
		String name = request.getParameter("uname") ;
		String password = request.getParameter("upass") ;
		String repassword = request.getParameter("reupass") ;
		//out.println(name) ;
		//out.println(password) ;
		//out.println(repassword) ;
		if(password.equals(repassword))
		{
	    out.println(repassword) ;
		stmt = conn.createStatement() ;
		// 为sql变量赋值INSERT INTO person (name,password) VALUES ('hwj','123456');
		sql = "insert into person (name,password) values('"+name+"','"+password+"')";
		int i = stmt.executeUpdate(sql) ;
		 out.println(repassword) ;
		if(i>=0){
			out.println("更新成功！！") ;
			response.sendRedirect("login1.jsp") ;///////////////////跳转在这里
		}
		else{
			out.println("更新失败！") ;
			response.sendRedirect("set.jsp") ;//////////////////////跳转在这里
		}
		}
		else %>
		<script>alert("密码输入不一致，请重新输入：")</script>
		<%	
	}
	catch(Exception e)
	{
		out.println("操作数据库失败！！！"+e) ;
	}
	// 4、关闭数据库
	try
	{
		// 关闭操作
		stmt.close() ;
		// 关闭连接
		conn.close() ;
	}
	catch(Exception e)
	{
		out.println("数据库关闭失败！！！"+e) ;
	}
%>
</body>
</html>