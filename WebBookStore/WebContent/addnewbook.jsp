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
<title>Modify Books</title>
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
<br>
<br>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>
<%

if ( session.getAttribute("uid") == null || ((String) session.getAttribute("uid")).compareTo("") == 0 ) {
	response.sendRedirect("login.jsp");
}
else {
	 
				try 
					{
					String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
						Connection connection = null; 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						connection = DriverManager.getConnection(connectionURL, "root", "");
						
						String user1=(String) session.getAttribute("uid");
						//int uid4 = Integer.parseInt(user1);
						String check= "select utype from users where userid='"+user1+"'";
						//out.print(check);
						Statement stat8=connection.createStatement();
						ResultSet rs8=stat8.executeQuery(check);
						while (rs8.next()){
											String s= rs8.getString("utype");
											String s2= "admin";
											if (s.equals(s2))
											{
											String user= request.getParameter("uid");
											//String isbn= request.getParameter("isbn");
											//String userid= request.getParameter("userid");
										    //int ccno = Integer.valueOf(ccno1);
										   // String query1="select ISBN,title,description,cost,id from books where ISBN='"+isbn+"'";
										   	
									
										    
										 
											    	%>
										    		
										    		<br/>
										    		<br/>
										    		<h3 align="center">Please update the fields to be modified and click the modify button.</h3>
										    		<br/>
										    		<br/>
										    		<div class="container ">
													
														 <form action="addnewbook2.jsp" method="post"> 
																<br/>
																	<table class="table" cellpadding="1" cellspacing="2" align="center">
																			<tr >
																				
													  							<td style="font-size: small;">
													  								* mandatory fields
													  							</td>
													  							<td></td>
													  						</tr>
													  						<tr>
																				
													 							<td>User Id*:</td>
																				<td><%out.println(""+user1+"");%></td>
																				
																			</tr>
																			<tr>
																				
													 							<td>Writer ID*:</td>
																				
									                                            <td><input type="number" name="id" placeholder="5 Digit" maxlength="5" required></td>

																			</tr>
																				<tr>
																				
													 							<td>AutherName *:</td>
																				
									                                            <td><input type="text" name="author_name" placeholder="author_name"  maxlength="50" required></td>

																			</tr>
																			</tr>
																				<tr>
																				
													 							<td>BookName *:</td>
																				
									                                            <td><input type="text" name="bookname" placeholder="bookname"  maxlength="50" required></td>

																			</tr>
																			
																			<tr>
																				
													 							<td>ISBN*:</td>
																				
									                                            <td><input type="text" name="isbn" placeholder="13 Digit ISBN" maxlength="50" required></td>

																			</tr>
																	 	 	<tr>
																				<td>Image *:</td>
																				<td><input type="file" name="title"  maxlength="50" required></td>
																	 	 	</tr>
																			<tr>
																				<td>Description *:</td>
																				<td><input type="text" name="description" placeholder="description" maxlength="50" required></td>
																	 	 	</tr>
													 						<tr>
													 							<td>Cost*:</td>
													 							<td><input type="text" name="cost" placeholder="Cost in Float" maxlength="50" required></td>
																			</tr>
																			
																			<tr align="center"> 	<td colspan="2" ><button type="submit" class="btn btn-info1 btn-rounded" formaction="addnewbook2.jsp">Add Book</button>
																			</td >
																													
																			
																			
																			
													  						</tr>
													  						
													  						
												 					</table>
												 		</form>
						 	
												</div> 
												
										<%
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