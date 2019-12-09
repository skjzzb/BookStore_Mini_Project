<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify User</title>
</head>
<body>
<jsp:include page="header.jsp" />
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>
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
 table { 
                border-collapse: collapse; 
            } 
            th { 
                background-color:green; 
                Color:white; 
            } 
            td { 
                width:150px; 
                text-align:center; 
                background-color:#5a5a5ac4;
                color: black;
                padding:5px 
              
            } 
            .gfg { 
                border-collapse:separate; 
                border-spacing:0 15px; 
            } 

</style>
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
											String userid= request.getParameter("userid");
										    //int ccno = Integer.valueOf(ccno1);
										    String query1="select userid,username, pass_word,full_name,address, credit_card,utype from users where userid='"+userid+"'";
										    Statement stat=connection.createStatement();
										    ResultSet rs=stat.executeQuery(query1);
										    
										    while (rs.next())
										    	{
											    	%>
										    		
										    		<br/>
										    		<br/>
										    		<h3 align="center">Please update the fields to be modified and click the modify button.</h3>
										    		<br/>
										    		<br/>
										    		
													<div align="center">
														 <form action="modify2.jsp" method="post"> 
																<br/>
																	<table class="gfg">
																			<tr >
																				<td></td>
													  							<td style="font-size: small;">
													  								* mandatory fields
													  							</td>
													  							<td></td>
													  						</tr>
																			<tr>
																				
													 							<td>UserID*:</td>
																				<td><%out.println(""+userid+"");%></td>
																			</tr>
																	 	 	<tr>
																				<td>Username *:</td>
																				<td><input type="text" name="username" value="<%out.println(rs.getString("username")); %>" maxlength="50" required></td>
																	 	 	</tr>
																			<tr>
																				<td>Password *:</td>
																				<td><input type="password" name="password" value="<%out.println(rs.getString("pass_word")); %>" maxlength="50" required></td>
																	 	 	</tr>
													 						<tr>
													 							<td>Full Name *:</td>
													 							<td><input type="text" name="fname" value="<%out.println(rs.getString("full_name")); %>" maxlength="50" required></td>
																			</tr>
																			<tr>
																				<td>Address *:</td>
																				<td><input type="text" name="add" value="<%out.println(rs.getString("address")); %>" maxlength="80" required></td>
																	 	 	</tr>
																	 	 	<tr>
																				<td>Credit Card Number *:</td>
																				<td><input type="number" name="ccno" value="<%out.println(rs.getString("credit_card")); %>" maxlength="16" required></td>
																	 	 	</tr>
																			<tr>
																				<td>User Type *:</td>
																				<td><input type="text" name="type" value="<%out.println(rs.getString("utype")); %>" maxlength="10" required></td>
																	 	 	</tr>
																			<tr> 	
																			<br/>
																			<td></td>
																			<input type="hidden" name="userid" value="<%= userid%>">
																			<input type="hidden" name="user" value="<%= user%>">
													 						<td><Button Type="submit" formaction="modify2.jsp">Modify</Button></td> 
													  						<td></td>
													  						</tr>
													  						
													  						
												 					</table>
												 		</form>
						 	
												</div> 
										<%
									    	}
									    }
											else 
								    		{
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