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
</style>
<style>
body {
background-image: url('img/165918.jpg');font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

.input-container {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

.icon {
    padding: 10px;
    background: #2d5772;
    color: white;
    min-width: 50px;
    text-align: center;
}

.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.btn {
  background-color: #2d5772;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}
#rcorners2 {
  border-radius: 25px;
  border: 2px solid #73AD21;
  padding: 20px; 
  width: 20px;
  height: 15px;  
}
.dtn{

border: 2px solid #2d5772;
border-radius: 25px;
height: 50px;
width: 150px;
}
.log{
text-align: center;
padding-left: 40%;;
}
</style>
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>
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
			    String usrname= request.getParameter("username");
			    String pswd= request.getParameter("password");
			    String query="select userid,username, pass_word from users where username='"+usrname+"' and pass_word='"+pswd+"'";
			    Statement stat=connection.createStatement();
			    ResultSet rs=stat.executeQuery(query);
			    
			    
			    
			    if (rs.next())
			    	{
			    	
			    	session.setAttribute("uid", rs.getString("userid"));
			    	response.sendRedirect("books.jsp");
			    	}
			    else			    					    	
			    	%>
			    	
			    	<div class="wrapper" align="center">
	 <form action="login2.jsp" class="text-center border border-light p-5" method="post" style="max-width:400px;margin:auto"> 
		<h3><p class="" align="center"><i class="fa fa-sign-in" aria-hidden="true"></i>
		Login in</p></h3><br><br>
						 <div align="center"><h5>Incorrect Login Credentials.</h5></div>
			    		 <div align="center"><h5>Please Enter Valid Credentials.</h5></div>
							  <div class="input-container">
							    <i class="fa fa-user icon"></i>
							    <input class="input-field" type="text" placeholder="Username" name="username">
							  </div>
						  <div class="input-container">
						    <i class="fa fa-key icon"></i>
						    <input class="input-field" type="password" placeholder="Password" name="password">
						  </div>
													
				
 						
						<button type="submit" class="btn btn-primary" formaction="login2.jsp">Submit</button>
						<br><br>
  						
 				
 	</form>
 	<form action="login2.jsp" method="post" style="max-width:400px;margin:auto">
 			<Button Type="submit" class="btn btn-primary" formaction="register.jsp" >New User Register Here!</Button>
 	</form>
</div>
			    	
			    	<!--  
			    	<h1 align="center">Welcome to BookStore</h1>
			    	<br>
			    	<br>
			    	 <div align="center">Incorrect Login Credentials.</div>
			    	 <div align="center">Please Enter Valid Credentials.</div>
			    	 <br>
			    	<div align="center">
	 					<form action="login2.jsp" method="post"> 
							<br/>
							<table>
								<tr>
									<td>Username:</td>
									<td><input type="text" name="username"></td>
				 	 			</tr>
 								<tr>
 									<td>Password:</td>
 									<td><input type="password" name="password"></td>
								</tr>
								<tr> 	
 									<td><Button Type="submit" formaction="login2.jsp">Submit</Button></td> 
  								</tr>
 							</table>
 						</form>
 						<form action="login2.jsp" method="post">
 							<Button Type="submit" formaction="register.jsp">New User Register Here!</Button>
 						</form>
					</div> 	-->					    	 
			
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