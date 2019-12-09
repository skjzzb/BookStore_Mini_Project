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
<title>Book Store</title>

</head>
<body>
<jsp:include page="header.jsp" />
<div>
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>
</div>
<div>
  <h2 align="center"><i class="fa fa-user" aria-hidden="true"></i>
Admin Menu</h2>
</div>
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



	<table  cellpadding="1" cellspacing="2" align="center">
		
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
			    Statement stat=connection.createStatement();
			    Statement stat1=connection.createStatement();
			    
			   String user=(String) session.getAttribute("uid");
			   int uid4 = Integer.parseInt(user);
			  
			  	String check= "select utype from users where userid='"+uid4+"'";
			    String admin = "Select full_name from users where userid='"+user+"' and utype='admin'";
			    //String query="select b.title, a.author_name, b.description, b.cost, b.ISBN from books as b, writer as a where b.id=a.id";
			    //String uid1 = (String) session.getAttribute("uid");
			    //int u_id = Integer.valueOf(uid1);
			    //Statement stat=connection.createStatement();
			    ResultSet rs=stat.executeQuery(check);
			    while (rs.next()){
			    	String s= rs.getString("utype");
			    	String s2= "admin";
			    if (s.equals(s2))
			    {
			    ResultSet rs1=stat1.executeQuery(admin);
			    while (rs1.next())
			    {
			    	%>
			    	<tr>
			    	<td></td>
			    	<td align="left"><h3><%out.println(rs1.getString("full_name"));%>,</h3><br><br></td>
			    	<td></td>
			    	</tr>
			    	
			    	<tr>
			    	<td></td>
			    	<td><h4>What would you like to do?</h4><br><br><br></td>
			    	<td></td>
			    	</tr>
			    	
			    	<tr>
			    		<form action="manage.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button type="submit" class="btn btn-info1 btn-rounded" formaction="manage.jsp"><font color="#fff"> I want to Manage Users.</font></button></td>
						</form>
			    		
			    		<form action="stats.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button type="submit" class="btn btn-info1 btn-rounded" formaction="stats.jsp"><font color="#fff">I want to see Statistics.</font></button></td>
						</form>	
						
						<form action="addbook.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button type="submit" class="btn btn-info1 btn-rounded" formaction="addbook.jsp"><font color="#fff">I want to Manage Bookstore.</font></button></td>
						</form>	
			    		
			    		<form action="books.jsp">
						<input type="hidden" name="uid2" value="<%= user%>">
						<td align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-info1 btn-rounded" formaction="books2.jsp"><font color="#fff">I want to continue to the Bookstore.</font></button></td>
						</form>
					</tr>	
			    	<%
			    }
			    }
			    else {
			    	response.sendError(401);
			    }
			    }
			%>
			
	</table>
	<%
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