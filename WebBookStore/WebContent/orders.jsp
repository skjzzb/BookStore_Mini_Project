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
<title>Order Receipt</title>
</head>
<body>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<jsp:include page="header.jsp" />
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>
<br>
<br>
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
<div align="center">
<h2 align="center">Hi</h2>
<h3 align="center">Your Order has been Placed on Your Registered Addres Successfully!</h3>
<br>

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
			    String uid2= request.getParameter("uid");
			    Long ui=Long.parseLong(uid2.trim());
			    String isbn= request.getParameter("ISBN");
			    String qt1= request.getParameter("qty");
			    String query1= ("insert into history(orderid, userid,ISBN,quantity,orderdetails) Select orderid,userid,ISBN, quantity, Now() from orders where userid='"+ui+"'");
			    String query2 =("DELETE FROM orders where userid='"+ui+"'");
			    
			   
			    stat.executeUpdate(query1);
			    stat.executeUpdate(query2);
			    			   
			    
			    
			    
			   //while (rs.next())
			    	{
			    	%>
			    	<table  cellpadding="1" cellspacing="2" align="center">
			   <tr>
			    	<h4 align="center">What would you like to do next?</h4>
			    	</tr>
			    	
			    	<tr>
			    		<form action="books.jsp">
						<input type="hidden" name="uid" value="<%= ui%>">
						<td align="center"><button  class="btn btn-info1 btn-rounded" type="submit" formaction="books.jsp">Buy more Books.</button></td>
						</form>
			    		
			    		<td align="center">&nbsp;&nbsp;&nbsp;or&nbsp;&nbsp;&nbsp;</td>
			    		
			    		<form action="logout.jsp">
						<input type="hidden" name="uid" value="<%= ui%>">
						<td align="center"><button  class="btn btn-info1 btn-rounded" type="submit" formaction="logout.jsp">Logout.</button></td>
						</form>	
						    		
					</tr>
					</table>
		
			    <%
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