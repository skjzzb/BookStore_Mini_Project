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
<title>User History</title>
</head>
<body>
<jsp:include page="header.jsp" />
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
			    
			    
			    String user= request.getParameter("uid");
			    String date= request.getParameter("date");
			   	String uname= request.getParameter("username");
			    
			    String query4 = "SELECT h.userid, u.username from history as h, users as u where u.userid=h.userid and h.orderdetails in (select orderdetails from history where orderdetails > '"+date+"') union SELECT o.userid, u.username from orders as o, users as u where u.userid=o.userid and o.order_date in (select order_date from orders where order_date > '"+date+"')";
			    Statement stat4=connection.createStatement();
			    ResultSet rs=stat4.executeQuery(query4);
			    
			  
			    	%>
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
			    		<br/>
			    		<br/>
			    		<h3 align="center">List of users having orders after <%out.println(""+date+"");%> is as follows:</h3>
			    		<br/>
			    		<br/>
			    		
			    		<%
			    		if (!rs.next()){
			    		%>
			    		<br></br>
		    	   		<div align="center" >No Record(s) found!</div>
							<%
			    		} else {
							%>
						<div class="container">
	 					<table class="table table-striped" border="2" cellpadding="1" cellspacing="2" align="center">
							<thead>
								<tr>
									<td align="center" style="width: 200px; font-weight:bold;">User ID</td>
									<td align="center" style="width: 200px; font-weight:bold;">User Name</td>
									<td></td>
								</tr>
							</thead>
  						<%
  						
  					  do
  			    	{
  						
  						  %>
  							<tr>
			    				<td align="center"><%out.println( rs.getString("userid"));%></td>
								<td align="center"><%out.println(rs.getString("username"));%></td>
								<form action="uhistory.jsp">
									<input type="hidden" name="uid" value="<%= user %>">
									<input type="hidden" name="date" value="<%= date %>">
									<input type="hidden" name="userid" value="<%= rs.getString("userid")%>">
									<input type="hidden" name="username" value="<%= rs.getString("username")%>">
									<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="uhistory.jsp">View Details</button></td>
								</form>
							</tr>
  						<%
  			    	}while (rs.next());
			    		}
  						
  						%>
  						
  						
 						</table>
 						
 						</div>
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