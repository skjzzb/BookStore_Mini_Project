<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<title>Login</title>
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>
</head>
<body>

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
body{
background-image: url('img/165918.jpg');
font-family: Arial, Helvetica, sans-serif;
color: white;

}
   table { 
                border-collapse: collapse; 
            } 
            th { 
                background-color:green; 
                Color:white; 
            } 
            th, td { 
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
* {box-sizing: border-box;}

</style>

<jsp:include page="header.jsp" />
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<%


				try {
					String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
			    Connection connection = null; 
			    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			    connection = DriverManager.getConnection(connectionURL, "root", "");
				Statement stat=connection.createStatement();
			    
			    
				String user= request.getParameter("user");
			    String uid= request.getParameter("userid");
			    String uname= request.getParameter("username");
				String pass= request.getParameter("password");
				String fname= request.getParameter("fname");
				String add= request.getParameter("add");
				String ccn= request.getParameter("ccno");
			    String query="select userid from users where userid='"+uid+"'";
			    
			    ResultSet rs=stat.executeQuery(query);
			    
			    
			    
			    if (rs.next())
			    	{
			    	%><div class="container">
			    		
			    		<br/>
			    		<br/>
			    		<h3 align="center">Username Unavailable!</h3>
			    		<br/>
			    		<div align="center">Please try again with a different Username.</div>

						<div align="center">
	 <form action="register2.jsp" method="post"> 
			<br/>
				<table class="gfg">
						<tr >
						
  							<td style="font-size: small;">
  								* mandatory fields
  							</td>
  							
  						</tr>
							<tr>
				 	 
							<form action="cavail.jsp" method="post">
 								<td>UserID*:</td>
								<td><input type="text" name="userid" maxlength="10" required></td>
 								<tr><Button class="btn btn-info1 btn-rounded" Type="submit" formaction="cavail.jsp">Check UserID Availability</Button></tr>
 							</form>
					 	</tr>
				 	 	<tr>
							<td>Username *:</td>
							<td><input type="text" name="username" maxlength="50" required></td>
				 	 	</tr>
						<tr>
							<td>Password *:</td>
							<td><input type="password" name="password" maxlength="50" required></td>
				 	 	</tr>
 						<tr>
 							<td>Full Name *:</td>
 							<td><input type="text" name="fname" maxlength="50" required></td>
						</tr>
						<tr>
							<td>Address *:</td>
							<td><input type="text" name="add" maxlength="80" required></td>
				 	 	</tr>
				 	 	<tr>
							<td>Credit Card Number *:</td>
							<td><input type="text" name="ccno" required maxlength="16"></td>
				 	 	</tr>
				 	 	<br/>
				 	 
						<tr> 	
						<br/>
						<td></td>
 						<td><Button class="btn btn-info1 btn-rounded" Type="submit" formaction="register2.jsp">Submit</Button></td> 
  						<td></td>
  						</tr>
  						
 				</table>
 	</form>
 	
</div>  
</div>
			    	<%
			    	
			    	}
			    else 
			    	%>
			    	<div class="container">
			    	<h2 align="center">Previous Data</h2>
		    		<br/>
		    		<br/>
		    		<h3 align="center">Username Available!</h3>
		    		<br/>
		    		<div align="center">Please fill out the remaining details.</div>

					<div align="center">
 					<form action="register2.jsp" method="post"> 
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
							<td><input type="text" name="userid" maxlength="10" value="<%out.println(""+uid+"");%>"></td>
					</tr>
			 	 	<tr>
						<td>Username *:</td>
						<td><input type="text" name="username" value="<%out.println(""+uname+"");%>" maxlength="50" required></td>
			 	 	</tr>
					<tr>
						<td>Password *:</td>
						<td><input type="password" name="password" maxlength="50" required value="<%out.println(""+pass+"");%>"></td>
			 	 	</tr>
						<tr>
							<td>Full Name *:</td>
							<td><input type="text" name="fname" maxlength="50" required value="<%out.println(""+fname+"");%>"></td>
					</tr>
					<tr>
						<td>Address *:</td>
						<td><input type="text" name="add" maxlength="80" required value="<%out.println(""+add+"");%>"></td>
			 	 	</tr>
			 	 	<tr>
						<td>Credit Card Number *:</td>
						<td><input type="text" name="ccno" required maxlength="16" value="<%out.println(""+ccn+"");%>"></td>
			 	 	</tr>
					<tr> 	
					<br/>
					<td></td>
						<td><Button class="btn btn-info1 btn-rounded" Type="submit" formaction="register2.jsp">Submit</Button></td> 
						<td></td>
						</tr>
					</table>
	</form>
	<br><br><br><br><br><br><br><br><br>
	
</div>
</div>
			    <%
			    
		if(!connection.isClosed())
		{
			connection.close();

		}
	}
	catch(Exception ex)
	{
		//System.out.println(ex.toString());
   		out.println("Unable to connect to database.");
	}

%>
</body>
</html>