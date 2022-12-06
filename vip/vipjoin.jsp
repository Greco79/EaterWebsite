<%@page contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
	<meta charset="UTF-8" />
	<title>依特-加入VIP</title>
	<style type="text/css">
	body{
		margin: 0px;
		padding: 0px;
                                  background-image:url(./zuile.jpg) ;
	}
	.two1{
		width: 360px; 
		height: 300px;
		position:absolute;
		top:120px; 
		left:562px; 
		border-radius: 5px;
		-moz-opacity:0.85;
		filter:alpha(Opacity=85);
		opacity: 0.85;
		background-color:#DDDDDD;
		z-index:0;
	}
              
	.two2 {
		width: 360px; 
		height: 260px;
		position:absolute;
		top:120px; 
		left:562px; 		
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
		background-color:#E00000;
		border-radius: 5px;
		border: 1px solid #E00000;
		font-size:20px;
		font-weight:bold;
		color:white;
		z-index:10;
	}
	.hhh{
                                                      
                                font-size: 150%;
                                 color:#FF0000;
                  
	}
	</style>
</head>
<body>
		<div class="two1"></div>
		<form class="two2" method="post" action="vipjoin.jsp">
				<input class="three1" type="text" name="uname" required="required" placeholder="您的帐号"/>
				<input class="three2" type="password" name="upass" required="required" placeholder="您的密码"/>
				<input class="three2" type="password" name="reupass" required="required" placeholder="再次确认您的密码"/>
				<button class="three3" type="submit">加入VIP</button>
		</form>
	
<%!
	String DBDRIVER = "com.mysql.jdbc.Driver" ;
	String DBURL = "jdbc:mysql://127.0.0.1:3306/tyk" ;
	String user="root";
	String pwd="798468235";
	Connection conn = null ;
	Statement stmt = null ;
	String sql = null ;
%>
<%
	try
	{
		Class.forName(DBDRIVER) ;
	}
	catch(Exception e)
	{
		out.println("数据库驱动程序加载失败！！！") ;
	}
	try
	{
		conn = DriverManager.getConnection(DBURL,user,pwd) ;
	}
	catch(Exception e)
	{
		out.println("数据库连接失败！！！"+e) ;
	}
	try
	{               
		String name = request.getParameter("uname") ;
		String password = request.getParameter("upass") ;
		String repassword = request.getParameter("reupass") ;
                                  stmt = conn.createStatement() ;
		if(password.equals(repassword))
		{
		sql = "insert ignore into info (id,password,vip) values('"+name+"','"+password+"','y')";
		int i = stmt.executeUpdate(sql) ;
		if(i>0)
			{  %><script>alert("您已经加入了VIP！恭喜！下面转到VIP福利介绍")
                                                             window.location.href = "./vipp.html";
                                                            </script> 
                                                      <% 
                                        }
		else if(i==0){
                                          %><script>alert("您已经是VIP了！不需要再次加入")
			window.location.href = "./vipp.html";
			</script> 

                                                      <% 

                                       }	
		
		else
			{   %> <script>alert("请您检查您的输入，如果仍有问题，请联系我们：88888")</script> <% }
			
		}
                                   else{ %> <script>alert("请您检查您的输入，前后密码不一致")</script> <%}
                                
			
	}
	catch(Exception e)
	{
		//out.println("操作数据库失败！！！"+e) ;
	}
	try
	{

		stmt.close() ;
		conn.close() ;
	}
	catch(Exception e)
	{
		out.println("数据库关闭失败！！！"+e) ;
	}
%>
</body>
</html>