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
<title>Login</title>
</head>
<body>
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
               
                padding:5px 
              
            } 
            .gfg { 
                border-collapse:separate; 
                border-spacing:0 15px; 
            } 
}
* {box-sizing: border-box;}

</style>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<%

				try {
					String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
			    Connection connection = null; 
			    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			    connection = DriverManager.getConnection(connectionURL, "root", "");
			    String uid= request.getParameter("userid");
			    String uname= request.getParameter("username");
			    String pswd= request.getParameter("password");
			    String fname= request.getParameter("fname");
			    String add= request.getParameter("add");
			    String ccno= request.getParameter("ccno");
			    //int ccno = Integer.valueOf(ccno1);
			    String query1="select userid from users where userid='"+uid+"'";
			    String query =("insert into users(userid,username,pass_word, full_name,address,credit_card,utype) values('"+uid+"','"+uname+"','"+pswd+"','"+fname+"','"+add+"','"+ccno+"','registered')");
			    Statement stat=connection.createStatement();
			    ResultSet rs=stat.executeQuery(query1);
			    
			    if (rs.next())
			    	{
			    	%>
			    	
			    		<br/>
			    		<h3 align="center" style="color: black;">Username Unavailable!</h3>
			    		<br/>
			    		<br/>
			    		<div align="center" style="color: black;">Please try again with a different username.</div>

						<div align="center" class="container">
	 <form action="register2.jsp" method="post"> 
			<br/>
				<table class="gfg" border="0">
						<tr  class="table-secondary" >
						<td></td>
  							<td class="table-secondary" style="font-size: small;">
  								* mandatory fields
  							</td>
  							<td></td>
  						</tr>
						<tr   class="table-secondary">
							<form action="cavail.jsp" method="post">
 								<td class="table-secondary">UserID*:</td>
								<td><input type="text" name="userid" maxlength="2" required></td>
 								<td><Button class="btn btn-info1 btn-rounded" Type="submit" formaction="cavail.jsp">Check Availability</Button></td>
 							</form>
 							
					 	</tr>
					 	
				 	 	<tr>
							<td scope="col">Username *:</td>
							<td><input type="text" name="username" maxlength="50" required></td>
				 	 	</tr>
						<tr>
							<td scope="col">Password *:</td>
							<td><input type="password" name="password" maxlength="50" required></td>
				 	 	</tr>
 						<tr>
 							<td scope="col">Full Name *:</td>
 							<td><input type="text" name="fname" maxlength="50" required></td>
						</tr>
						<tr>
							<td scope="col">Address *:</td>
							<td><input type="text" name="add" maxlength="80" required></td>
				 	 	</tr>
				 	 	<tr>
							<td scope="col">Credit Card Number *:</td>
							<td><input type="text" name="ccno" required maxlength="16"></td>
				 	 	</tr>
						<tr> 	
						<br/>
						<td></td>
 						<td><Button class="btn btn-info1 btn-rounded" Type="submit" formaction="register2.jsp">Submit</Button></td> 
  						<td></td>
  						</tr>
  						
 				</table>
 	</form>
 	
</div> 		    	<%
			    	
			    	}
			    else
			    {		    
			    //String query="select userid,username, pass_word from users where username='"+usrname+"' and pass_word='"+pswd+"'";
			    
			    try 
			    {
			    stat.executeUpdate(query);
			    
			    }
			    catch (Exception E)
			    {
			    	System.out.println(E.toString());
			    }
			    response.sendRedirect("login.jsp");
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

%>
</body>
</html>