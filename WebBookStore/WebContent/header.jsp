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
<title> Book Store</title>
<style >
.btn-primary {
    background-color: #2d5772 !important;
}
.btn-primary:hover{
 background-color: black !important;
}
</style>
</head>
<body>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

			<%
			try {
				String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
			    Connection connection = null; 
			    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			    connection = DriverManager.getConnection(connectionURL, "root", "");
			    Statement stat=connection.createStatement();
			    String uid4=(String) session.getAttribute("uid");
			    String admin = "Select full_name from users where userid='"+uid4+"'";
			    
			
			    
			    ResultSet rs1=stat.executeQuery(admin);
			    
			    while (rs1.next())
			    {
			    	%>
			    	<div>
			    	<table class="coustom" align="right" >
			    		<thead>
			    		<th ><b class="btn btn-sq-xs btn-primary"><i class="fa fa-user fa-1x"></i> &nbsp;Hi, <%out.println(rs1.getString("full_name"));%>!</b></th>
			    		
			    		<th  ><a href=logout.jsp class="btn btn-sq-xs btn-primary"><i class="fa fa-close"></i> Logout</a></th>
						</thead>
					</table>
					</div>
					<br></br>
					
				<%
			    }
			%>
			
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
%>
</body>
</html>