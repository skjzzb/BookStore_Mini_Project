<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Find User(s)</title>
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



	<table  class="table" cellpadding="1" cellspacing="2" align="center">
		
			<%
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
			    String user= request.getParameter("uid");
			    String name= request.getParameter("name");
			    
			    String admin = "Select full_name from users where userid='"+user+"' and utype='admin'";
			    Statement stat=connection.createStatement();
			    ResultSet rs1=stat.executeQuery(admin);
			    
			    String query= "Select userid, username, pass_word, full_name, address, credit_card,utype from users where (username='"+name+"') or (full_name='"+name+"%')";
			    Statement stat2=connection.createStatement();
			    ResultSet rs2=stat2.executeQuery(query);
			    String name2= "username or fullname";
			    Boolean comp= name.equals(name2);
			    if (name==null||name=="" || comp==true){
			    	%>
			    	<h4 align="center"><%out.println("No Records Found.");%></h4>
			    	<%
			    }
			    else {
			    while (rs1.next())
			    {
			    	%>
			    	<h3 align="center"><%out.println(rs1.getString("full_name"));%>,Here is/are the user(s) you were looking for.</h3>
			    	<br></br>
			    	<table  border="2" cellpadding="1" cellspacing="2"  align="center">
			    	<thead>
						<tr>
							<td align="center" style="width: 200px; font-weight:bold;">User ID</td>
							<td align="center" style="width: 200px; font-weight:bold;">User Name</td>
							<td align="center" style="width: 200px; font-weight:bold;">Password</td>
							<td align="center" style="width: 200px; font-weight:bold;">Full Name</td>
							<td align="center" style="width: 200px; font-weight:bold;">Address</td>
							<td align="center" style="width: 200px; font-weight:bold;">Credit Card#</td>
							<td align="center" style="width: 200px; font-weight:bold;">User Type</td>
							<td align="center" style="width: 200px; font-weight:bold;">Modify User</td>
							<td align="center" style="width: 200px; font-weight:bold;">Delete User</td>
						</tr>
					</thead>
			    	<%
			    	while(rs2.next()){
			    	%>
			    	
			    	<tr>
			    	<td align="center"><%out.println(rs2.getString("userid"));%></td>
					<td align="center"><%out.println(rs2.getString("username"));%></td>
					<td align="center"><%out.println(rs2.getString("pass_word"));%></td>
					<td align="center"><%out.println(rs2.getString("full_name"));%></td>
					<td align="center"><%out.println(rs2.getString("Address"));%></td>
					<td align="center"><%out.println(rs2.getString("credit_card"));%></td>
					<td align="center"><%out.println(rs2.getString("utype"));%></td>
					<form action="modify.jsp">
					<input type="hidden" name="userid" value="<%= rs2.getString("userid")%>">
					<input type="hidden" name="uid" value="<%= user%>">
					<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="modify.jsp">Modify</button></td>
					</form>
					
					<form action="delete.jsp">
					<input type="hidden" name="userid" value="<%= rs2.getString("userid")%>">
					<input type="hidden" name="uid" value="<%= user%>">
					<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="delete.jsp">Delete</button></td>
					</form>
					</tr>	
					
			    	<%
			    	}
			    	%>
			    	</table>
			    	<%
			    }
			    }	
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
%>
</body>
</html>