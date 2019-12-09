<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title >Your Cart</title>

</head>
<body>
<jsp:include page="header.jsp" />
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>
<br></br>

 <h2  align="center">Your Cart</h2>
 <br></br>
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
</style>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<%

if ( session.getAttribute("uid") == null || ((String) session.getAttribute("uid")).compareTo("") == 0 ) {
	response.sendRedirect("login.jsp");
}
else {
	 %>
	
		
	
			<%
			try {
				String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
			    Connection connection = null; 
			    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			    connection = DriverManager.getConnection(connectionURL, "root", "");
			    
			    
			    String isbn= request.getParameter("ISBN").trim();
			    String qt1= request.getParameter("qty").trim();
			    //int qty2= Integer.valueOf(qt1);
			    String uid1= request.getParameter("uid");
			    Long ui=Long.parseLong(uid1.trim());
			    
			    String query1 =("DELETE FROM orders WHERE ISBN='"+isbn+"'");
			    String query2="select b.title, b.ISBN, a.bookname,a.author_name, b.description, sum(o.quantity) as quant, b.cost*sum(o.quantity) as Cost, o.orderid from books as b, orders as o, writer as a where b.ISBN=O.ISBN and b.id=a.id and o.userid='"+ui+"' group by o.ISBN";
			    String query3= "Select sum(Cost) from (select b.cost*sum(o.quantity) as Cost from books as b, orders as o where b.ISBN=O.ISBN and o.userid='"+ui+"' group by o.ISBN)as Total_Cost";
			    Statement stat=connection.createStatement();
			    Statement stat2=connection.createStatement();
			    stat.executeUpdate(query1);
			   //	 response.sendRedirect("cart.jsp");
			    ResultSet rs=stat.executeQuery(query2);
			    ResultSet rs2=stat2.executeQuery(query3);
			    %>
			 
			
		<center>
		 <table align="center">
		 <tr><h2> The Item Has Been Suceesfully Removed From Cart</h2></tr>
		 	<br><br><br>
		 <tr><h3> Do Some Action</h3></tr>
			    		<tr>
							<td align="left" >
								<form action="books.jsp" >
									<button class="btn btn-secondary-dark" type="submit" formaction="books.jsp"><i class="fa fa-shopping-basket fa-2x" aria-hidden="true"></i>
									Continue Shopping</button>&nbsp;&nbsp;
								</form>
							</td>
							<td align="right">
								<form action="orders.jsp">
									<input type="hidden" name="uid" value="<%out.println(""+ui+"");%>">
									<input type="hidden" name="ISBN" value="<%out.println(""+isbn+"");%>">
									<input type="hidden" name="qty" value="<%out.println(""+qt1+"");%>">
									&nbsp;&nbsp;<button class="btn btn-secondary-dark" type="submit" formaction="orders.jsp"><i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i>
Confirm and Checkout</button>
														
								</form>
							</td>
						</tr>	
				</table> 
				</center>
				<br><br><br>
		
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