<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Book</title>
</head>
<body>
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
table { 
                border-collapse: collapse; 
                background-color:#969292;
            } 
            th { 
                background-color:green; 
                Color:white; 
            } 
           td { 
                width:150px; 
                text-align:center; 
                font-size:18px;
               
                padding:5px 
              
            } 
            .gfg { 
                border-collapse:separate; 
                border-spacing:0 15px; 
            } 

</style>
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
											String isbn= request.getParameter("isbn").trim();
											//String userid= request.getParameter("userid");
										    //int ccno = Integer.valueOf(ccno1);
										    
										    String query2="select id from books where ISBN="+isbn+"";
										    
										   // out.print(query2);
										    
										  
										   	
										    // out.print(query1);
										    String bid=null;
										    Statement stat=connection.createStatement();
										   
										    ResultSet rs1=stat.executeQuery(query2);
										    while(rs1.next())
										    {
										    	bid= rs1.getString("id").trim();
										    	
										    }
										    int id=Integer.parseInt(bid);
										    //out.print(id);
										    String query1="select b.ISBN,b.title,b.description,b.cost,w.author_name,w.bookname,w.id from books as b,writer as w where ISBN="+isbn+" and w.id=b.id";
										   // out.print(query1);
										    ResultSet rs=stat.executeQuery(query1);
										    
										    
										    while (rs.next())
										    	{
										    	//out.print(rs.getString("bookname"));
										    	//out.print(rs.getString("author_name"));
											    	%>
										    		
										    		<br/>
										    		<br/>
										    		<h3 align="center">Please update the fields to be modified and click the modify button.</h3>
										    		<br/>
										    		<br/>
										    		
													<div align="center">
														 <form action="updatebook2.jsp" method="post"> 
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
																				
													 							<td>User Id*:</td>
																				<td><%out.println(""+user1+"");%></td>
																				
																			</tr>
																		
																			<tr>
																				
													 							<td>ISBN*:</td>
																				<td><%out.println(""+isbn+"");%></td>
									                                            <td><input type="text" name="isbn" value="<%out.println(""+isbn+"");%>" maxlength="50" required></td>

																			</tr>
																	 	 	<tr>
																				<td>Image *:</td>
																				<td><img width="200px" height="200px" src="<%out.println(rs.getString("title")); %>"></td><td><input type="file" name="title" value="img/<%out.println(rs.getString("title")); %>" maxlength="50" required></td>
																	 	 	</tr>
																			<tr>
																				<td>Description *:</td>
																				<td><input type="text" name="description" value="<%out.println(rs.getString("description")); %>" maxlength="50" required></td>
																	 	 	</tr>
													 						<tr>
													 							<td>Cost*:</td>
													 							<td><input type="text" name="cost" value="<%out.println(rs.getString("cost")); %>" maxlength="50" required></td>
																			</tr>
																			
															
										
										    				<tr>
													 							<td>Author_Name*:</td>
													 							<td><input type="text" name="author_name" value="<%out.println(rs.getString("author_name")); %>" maxlength="50" required></td>
																			</tr>
																			<tr>
													 							<td>Book Name*:</td>
													 							<td><input type="text" name="bookname" value="<%out.println(rs.getString("bookname")); %>" maxlength="50" required></td>
																			</tr>
										    				<tr> 	
																			<br/>
																			<td></td>
																			<form action="updatebook2.jsp">
																				<input type="hidden" name="isbn" value="<%= rs.getString("ISBN")%>">
																				<input type="hidden" name="id" value="<%= rs.getString("id")%>">
																				<input type="hidden" name="uid" value="<%= user%>">
																				<td align="center"><button type="submit" formaction="updatebook2.jsp">Modify</button></td>
																				</form>
																																		
																			
																			
																			
													  						</tr>
													  						
													  						
												 					</table>
												 		</form>
						 	
												</div> <%
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