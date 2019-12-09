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
				String isbn= request.getParameter("isbn");
				String tit= request.getParameter("title");
				String img="img/";
				String title=img.concat(tit);
				String description= request.getParameter("description");
			    String cost= request.getParameter("cost");
			    Float c=Float.parseFloat(cost);
			    
			    
			    String bid= request.getParameter("id").trim();
			    int id=Integer.parseInt(bid);
			    String author_name = request.getParameter("author_name");
			    String bookname = request.getParameter("bookname");
			    //out.print(author_name);
			    //out.print(bookname);
			  
			    
			    //int ccno = Integer.valueOf(ccno1);
			    String query1 =("update writer set author_name='"+author_name+"',bookname='"+bookname+"' where id="+id+"");
			    String query =("update books set title='"+title+"',description='"+description+"' , cost="+c+" where ISBN='"+isbn+"'");
			    //out.print(query1);
			    Statement stat=connection.createStatement();
			    stat.executeUpdate(query1);
			    stat.executeUpdate(query);
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
						<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="manage.jsp">Manage another User</button></td>
						</form>	
						
						<td align="center">or </td>
			    		
			    		<form action="admin.jsp">
						<input type="hidden" name="uid" value="<%= uid4%>">
						<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="admin.jsp">Go To Main Admin Page</button></td>
						</form>	
			    					    		
					</tr>
					</table>
			    <% 
			    
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