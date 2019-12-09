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
	 
	String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
Connection connection = null; 
Class.forName("com.mysql.jdbc.Driver").newInstance(); 
connection = DriverManager.getConnection(connectionURL, "root", "");

String user1=(String) session.getAttribute("uid");
int uid4 = Integer.parseInt(user1);
String check= "select utype from users where userid='"+uid4+"'";
Statement stat=connection.createStatement();
ResultSet rs=stat.executeQuery(check);
while (rs.next()){
	String s= rs.getString("utype");
	String s2= "admin";
if (s.equals(s2))
{

String user= request.getParameter("uid");

%>
<div align="center">Please provide the following details:</div>


<div align="center" class="container">
	 <form class="form-group" action="stats2.jsp" method="post"> 
			<br/>
				<table class="table " >
						<tr >
						<td></td>
  							<td style="font-size: small;">
  								* mandatory fields
  							</td>
  							
  						</tr>
						<tr>
							<td>Date 1 *:</td>
							<td><input type="text" name="date1" value="YYYY-MM-DD" required></td>
				 	 	</tr>
						<tr>
							<td>Date 2 *:</td>
							<td><input type="text" name="date2" value="YYYY-MM-DD" required></td>
				 	 	</tr>
						<tr>
								<td>Book's ISBN:</td>
								<td><input type="text" name="isbn" maxlength="13"></td>
 								
					 	</tr>
				 	 	<tr>
								<td>Author's Name:</td>
								<td><input type="text" name="authname" maxlength="80"></td>
 								
					 	</tr>
						<tr> 	
						<br/>
						<td></td>
						<input type="hidden" name="uid" value="<%= user%>">
 						<td><Button class="btn btn-info1 btn-rounded" Type="submit" formaction="stats2.jsp">Submit</Button></td> 
  						
  						</tr>
  						
 				</table>
 	</form>
 	
</div> 
<%
}
else { 
	response.sendError(401);
}
}
}
%>
</body>
</html>