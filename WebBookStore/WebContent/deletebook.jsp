<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Books</title>
</head>
<body>
<jsp:include page="header.jsp" />
<h1 align="center">Welcome to BookStore</h1>
<br>
<br>
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
//out.print("User Seeeio2"+user1);
int uid4 = Integer.parseInt(user1);
//out.print("User U2"+uid4);
String check= "select utype from users where userid='"+uid4+"'";
//out.print(check);
Statement stat8=connection.createStatement();
ResultSet rs8=stat8.executeQuery(check);
while (rs8.next()){
	String s= rs8.getString("utype");
	String s2= "admin";
if (s.equals(s2))
{				//String user= request.getParameter("user");
				String isbn= request.getParameter("isbn").trim();
				
			  
			    
			    //int ccno = Integer.valueOf(ccno1);
			    //String query =("update books set title='"+title+"',description='"+description+"' , cost='"+cost+"' where ISBN='"+isbn+"'");
			     String query1 =("SELECT id FROM books WHERE ISBN='"+isbn+"'");
			    String query =("DELETE FROM books WHERE ISBN='"+isbn+"'");
			    String query3 =("DELETE FROM bookwriter WHERE ISBN='"+isbn+"'");
			    String query4 =("DELETE FROM history WHERE ISBN='"+isbn+"'");
			    
			    //out.print(query);
			    Statement stat=connection.createStatement();
			    int v3=stat.executeUpdate(query3);
			    ResultSet rs7=stat.executeQuery(query1);
			    String id1=null;
			    while (rs7.next()){
			    	id1= rs7.getString("id").trim();
			    }
			    int id=Integer.parseInt(id1);
			    out.print(id1);
			    String query2 =("DELETE FROM writer WHERE id='"+id+"'");
			    int v5=stat.executeUpdate(query4);
			    int v=stat.executeUpdate(query);
			   
			    int v1=stat.executeUpdate(query2);
			   
			    if(v>0)
			    {
			    %>
			    <h3 align="center">Records have been updated!</h3>
			    <br></br>
			    <br></br>
			    <table  cellpadding="1" cellspacing="2" align="center">
			   <tr>
			    	<h3 align="center">What would you like to do next?</h3>
			    	
			    	</tr>
			    	
			    	<tr>
			    		<form action="manage.jsp">
						<input type="hidden" name="uid" value="<%= uid4%>">
						<td align="center"><button type="submit" formaction="manage.jsp">Manage another User</button></td>
						</form>	
						
						<td align="center">or </td>
			    		
			    		<form action="admin.jsp">
						<input type="hidden" name="uid" value="<%= uid4%>">
						<td align="center"><button type="submit" formaction="admin.jsp">Go To Main Admin Page</button></td>
						</form>	
			    					    		
					</tr>
					</table>
			    <% }
			    else{
			    	out.println("Unable to Delete From DB");
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
					out.println("Unable to connect to database. Update 2");
				}
}
%>
</body>
</html>