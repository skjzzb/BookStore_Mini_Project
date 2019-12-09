<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Statistics</title>
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
			    String date1= request.getParameter("date1");
			    String date2= request.getParameter("date2");
			    String isbn= request.getParameter("isbn");
			    String authname= request.getParameter("authname");

			    String query1 = "Select coalesce(count(h.hid), 0) as Number_of_Orders, coalesce(sum(b.cost*h.quantity),0) as Total_Sales from history as h, books as b where b.ISBN=h.ISBN and orderdetails between '"+date1+"%' and '"+date2+"%'";
			    String query2 = "Select coalesce(b.title,0) as title, coalesce(h.ISBN,0) as ISBN, coalesce(sum(b.cost*h.quantity),0) as Total_Sales from history as h, books as b where b.ISBN=h.ISBN and  orderdetails between '"+date1+"%' and '"+date2+"%' and b.ISBN='"+isbn+"'";
			    String query3 = "Select coalesce(w.author_name,0) as Author, coalesce(sum(b.cost*h.quantity),0) as Total_Sales from history as h, books as b, writer as w where w.id=b.id and b.ISBN=h.ISBN and  orderdetails between '"+date1+"%' and '"+date2+"%' and w.author_name='"+authname+"'";
			    String query4 = "Select coalesce(b.title,0) as title, coalesce(h.ISBN,0) as ISBN, coalesce(sum(b.cost*h.quantity),0) as Total_Sales from history as h, books as b where b.ISBN=h.ISBN and  orderdetails between '"+date1+"%' and '"+date2+"%' group by ISBN order by Total_Sales desc"; 
			    Statement stat1=connection.createStatement();
			    ResultSet rs=stat1.executeQuery(query1);
			    Statement stat2=connection.createStatement();
			    ResultSet rs2=stat2.executeQuery(query2);
			    Statement stat3=connection.createStatement();
			    ResultSet rs3=stat3.executeQuery(query3);
			    Statement stat4=connection.createStatement();
			    ResultSet rs4=stat4.executeQuery(query4);
			    
			  
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
			    		<h3 align="center">The Statistics of Orders between <%out.println(""+date1+"");%> and <%out.println(""+date2+"");%> are as follow:</h3>
			    		<br/>
			    		<br/>
			    		

						<div class="container">
	 					<!-- <table class="table " border="2" cellpadding="1" cellspacing="2" align="center">
							<thead>
								<tr>
									<td align="center" style="width: 200px; font-weight:bold;">Number of Orders</td>
									<td align="center" style="width: 200px; font-weight:bold;">Total Sales</td>
									</tr>
							</thead>
  						<%
  						
  					  //while (rs.next())
  			    	//{
  						 %>
  							<tr>
			    				<td align="center" style="width:197px;"><%//out.println( rs.getString("Number_of_Orders"));%></td>
								<td align="center"><%//out.println(rs.getString("Total_Sales"));%></td>
								</tr>
  						<%
  			    	//}
				
  						
  						%>
  						
  						
 						</table> -->
 						</div>
 						<br>
 						<br>
 						<br>
 						
 						<%
 						if (authname==null || authname=="") 
 						{}
 						else
 						{
 							
 						%>
 						<div class="container">
 						<table  class="table " border="2" cellpadding="1" cellspacing="2" align="center">
							<thead>
								<tr>
									<td align="center" style="width: 200px; font-weight:bold;">Author Name</td>
									<td align="center" style="width: 200px; font-weight:bold;">Total Sales</td>
									</tr>
							</thead>
  						<%
  						
  					  while (rs3.next())
  			    	{
  						  %>
  							<tr>
			    				<td align="center" style="width:197px;"><%out.println( rs3.getString("Author"));%></td>
								<td align="center"><%out.println(rs3.getString("Total_Sales"));%></td>
								</tr>
  						<%
  			    	}
				
  						
  						%>
  						
  						
 						</table>
 						</div>
 						<br></br>
 						 <%
 						}
 						 %>		
 						 <div class="container">				
 						<table class="table " border="2" cellpadding="1" cellspacing="2" align="center">
							<thead>
								<tr>
									<td align="center" style="width: 200px; font-weight:bold;">Book Title</td>
									<td align="center" style="width: 200px; font-weight:bold;">ISBN</td>
									<td align="center" style="width: 200px; font-weight:bold;">Total Sales</td>
									</tr>
							</thead>
  						<%
  						
  					if (!rs4.next()) {
  						%>
							<tr>
								<td align="center">0</td>
		    				<td align="center">0</td>
							<td align="center">0.00</td>
							</tr>
						<%
						}
  					else{
  					do
  			    	{
  						
  							
  						
  						 %>
  							<tr>
  								<td align="center"><img src="<%out.println(rs4.getString("title"));%>" style="height: 318px; width:197px;"></td>
			    				<td align="center"><%out.println(rs4.getString("ISBN"));%></td>
								<td align="center"><%out.println(rs4.getString("Total_Sales"));%></td>
								</tr>
  						<%
  			    			}while (rs4.next());
  			    	}	
				
  						
  						%>
  						
  						
 						</table>
 						</div>
 		
 					<div class="container">			  
			   <table class="table " cellpadding="1" cellspacing="2" align="center">
			   <tr>
			    	<h4 align="center">What would you like to do next?</h4>
			    	</tr>
			    	
			    	<tr>
			    		<form action="ohisuser.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="ohisuser.jsp">See Order History for another user.</button></td>
						</form>
			    		
			    		<td align="center">or</td>
			    		
			    		<form action="userstats.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="userstats.jsp">See Statistics about orders.</button></td>
						</form>	
						
						<td align="center">or</td>
			    		
			    		<form action="admin.jsp">
						<input type="hidden" name="uid" value="<%= user%>">
						<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="admin.jsp">Go To Main Admin Page.</button></td>
						</form>	
			    					    		
					</tr>
					</table>
					</div>
					<br><br><br><br><br><br>
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