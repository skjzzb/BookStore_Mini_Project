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
<title>Books Catalog</title>

</head>
<body>
<jsp:include page="header.jsp" />
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>
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
	 %>

			<%
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
			    if (rs8.next()){
			    	String s= rs8.getString("utype");
			    	String s2= "admin";
			    if (s.equals(s2))
			    {
			    	String admin = "Select userid from users where userid='"+user1+"' and utype='admin'";
			    	Statement stat4=connection.createStatement();
			    	ResultSet rs4=stat4.executeQuery(admin);
				    if (rs4.next())
				    {
				    	session.setAttribute("uid", rs4.getString("userid"));
				    	
				    }
			    
			    String uid2= request.getParameter("uid2");
			    String query="select b.title, a.bookname,a.author_name, b.description, b.cost, b.ISBN from books as b, writer as a where b.id=a.id";
			    Statement stat=connection.createStatement();
			    ResultSet rs=stat.executeQuery(query);
			    %>
			    <center>
			    <div class="container col-sm">
			    <form action="addnewbook.jsp">
					
					<input type="hidden" name="uid" value="<%= user1%>">
					<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="addnewbook.jsp"><h3>Add New Book To Store</h3></button></td>
					</form>
			    </div>
			    </center>
			    <br>
			    <br><br>
			    	<div class="container col-sm">

	<table class="table" cellpadding="1" cellspacing="2" align="center">
		<thead>
			<tr>
				<td align="center" style="width: 200px; font-weight:bold;">Book Title</td>
				<td align="center" style="width: 200px; font-weight:bold;">Author(s)</td>
				<td align="center" style="width: 200px; font-weight:bold;">Description</td>
				<td align="center" style="width: 200px; font-weight:bold;">Price (in USD)</td>
				<td align="center" style="width: 200px; font-weight:bold;">Modify</td>
				<td align="center" style="width: 200px; font-weight:bold;">Delete</td>
			</tr>
			</thead>
			    <%
			    while (rs.next())
			    {
			    	%>
			    	<tr>
			    	<td align="center"><%out.println(rs.getString("bookname"));%><br><br><br><img src="<%out.println( rs.getString("title"));%>" style="height: 318px; width:197px;"></td>
					<td align="center"><%out.println(rs.getString("author_name"));%></td>
					<td align="center"><%out.println(rs.getString("description"));%></td>
					<td align="center"><%out.println(rs.getFloat("cost"));%></td>
					
					
					<form action="updatebook.jsp">
					<input type="hidden" name="isbn" value="<%= rs.getString("ISBN")%>">
					<input type="hidden" name="uid" value="<%= user1%>">
					<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="updatebook.jsp">Modify</button></td>
					</form>
					
					<form action="deletebook.jsp">
					<input type="hidden" name="isbn" value="<%= rs.getString("ISBN")%>">
					<input type="hidden" name="uid" value="<%= user1%>">
					<td align="center"><button class="btn btn-info1 btn-rounded" type="submit" formaction="deletebook.jsp">Delete</button></td>
					</form>
					
					
					
					</tr>
				<%
			    }
			     }
			    else{
			    	response.sendRedirect("login.jsp");
			    	}
			   
			%>
			
	</table>
	</div>
	<%
		if(!connection.isClosed())
		{    
   		connection.close();
		}
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