<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Users</title>
</head>
<body>
<jsp:include page="header.jsp" />
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>

<style>
header {
  background: #2d5772;
  display: flex;
  color: white;
}
header:before,
header:after {
  content: '';
  margin: auto 1em;
  border-bottom: solid 1px;
  flex: 1;
}
h1 {
  position: relative;
  padding: 0.25em 1em;
  overflow: hidden;
  background: linear-gradient(white, white) no-repeat top center, linear-gradient(white, white) no-repeat bottom center;
  background-size: calc(100% - 1.7em) 1px;
}
h1:before,
h1:after {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  border: solid 1px;
  border-top: none;
  border-bottom: none;
  transform: skew(45deg)
}
h1:after {
  transform: skew(-45deg)
}
.btn-info1 {
    color: #fff;
    background-color: #2d5772;
    border-color: #46b8da;
}
.btn-info1:hover {
    color: #fff;
    background-color: black;
    border-color: #46b8da;
}


</style>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>


<%

if ( session.getAttribute("uid") == null || ((String) session.getAttribute("uid")).compareTo("") == 0 ) {
	response.sendRedirect("login.jsp");
}
else {
	
			try {
				String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
			    Connection connection = null; 
			    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			    connection = DriverManager.getConnection(connectionURL, "root", "");
			    
			    String user1=(String) session.getAttribute("uid");
			    int uid4 = Integer.parseInt(user1);
			    String check= "select utype from users where userid='"+uid4+"'";
			    Statement stat8=connection.createStatement();
			    ResultSet rs8=stat8.executeQuery(check);
			    while (rs8.next()){
			    	String s= rs8.getString("utype");
			    	String s2= "admin";
			    if (s.equals(s2))
			    {
			    
			    Statement stat=connection.createStatement();
			    String user= request.getParameter("uid");
			    String admin = "Select full_name from users where userid='"+user+"' and utype='admin'";
			    ResultSet rs1=stat.executeQuery(admin);
			    
			    while (rs1.next())
			    {
			    	%>
			    	<h3 align="center">Hi, <%out.println(rs1.getString("full_name"));%>. Please be careful while conducting your managerial tasks.</h3>
			    	<br>
			    	<br>
			    	<br>
			    	<br>
			    	<table  cellpadding="1" cellspacing="2" align="center">
			    	<tr>
									    
			    		<!--  <form action="add.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="add.jsp">Add New User</button></td>
						</form> -->
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td align="center">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </td>
						<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<form action="find.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="find.jsp">Search</button></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" name="name" value="username or fullname" maxlength="50" required>&nbsp;&nbsp;&nbsp;&nbsp;</td>&nbsp;&nbsp;&nbsp;&nbsp;
						</form>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;or &nbsp;&nbsp;&nbsp;&nbsp;</td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			    		<form action="findall.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="findall.jsp">Show All</button></td>
						</form>	
			    					    		
					</tr>	
			    	<%
			    }
			    	    
			%>
			
	</table>
	<%
			}
		    else {
		    	response.sendError(401);
		    }
		   }
		if(!connection.isClosed())
		{    
   		connection.close();
		}
	}
	catch(Exception ex)
			{
			System.out.println(ex.toString());
   			out.println("Unable to connect to database.");
			}
}
%>
</body>
</html>