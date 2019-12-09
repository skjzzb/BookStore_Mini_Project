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
<title>Add New User</title>
<jsp:include page="header.jsp" />
</head>
<body>
	
	<header>
  <h1 class="h1 mb" align="center">Welcome To BookStore</h1>
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
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
	<%
		if (session.getAttribute("uid") == null || ((String) session.getAttribute("uid")).compareTo("") == 0) {
			response.sendRedirect("login.jsp");
		} else {

			String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "");

			String user1 = (String) session.getAttribute("uid");
			int uid4 = Integer.parseInt(user1);
			String check = "select utype from users where userid='" + uid4 + "'";
			Statement stat8 = connection.createStatement();
			ResultSet rs8 = stat8.executeQuery(check);
			while (rs8.next()) {
				String s = rs8.getString("utype");
				String s2 = "admin";
				if (s.equals(s2)) {
					String user = request.getParameter("uid");
	%>
	<div align="center">To add a new user, enter the following
		details:</div>
<!--  -->

<div class="container">
<hr>





<div class="card bg-light">
<article class="card-body mx-auto" style="max-width: 600px;">
	<h4 class="card-title mt-3 text-center">Create Account</h4>

	<form class="text-center border border-light p-5"  action="add2.jsp" method="post">
	<div class="form-group input-group">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone" aria-hidden="true"></i> </span>
		 </div>
        <input placeholder="Mobile No" type="text"class="form-control" name="userid" maxlength="10" required >
    </div> <!-- form-group// -->
     <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input  class="form-control" name="username" placeholder="UserName" type="text" maxlength="50" required>
    </div>
    <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fas fa-key"></i> </span>
		 </div>
        <input  class="form-control" name="password" placeholder="Password" type="password" maxlength="50" required>
    </div> <!-- form-group// -->
      <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input  class="form-control" name="fname" placeholder="Full Name" type="text" maxlength="50" required>
    </div>
    <!-- form-group// -->
     <!-- form-group// -->
     
    <div class="form-group input-group">
  		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fas fa-address-card"></i> </span>
		 </div>
  		<textarea class="form-control rounded-0" name="add" placeholder="Address" rows="3"></textarea>
	</div>
	 <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-credit-card" aria-hidden="true"></i>
 </span>
		 </div>
        <input  class="form-control" name="ccno" placeholder="CreditCard No" type="number" maxlength="16" required>
    </div>
     <div class="form-group input-group">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input  class="form-control" name="type" placeholder="UserType" type="text" maxlength="50" required>
    </div>
   
    
    
    
    <div class="form-group input-group">
    <form action="cavail2.jsp" method="post">
						
						
						<input type="hidden" name="user" value="<%=user%>"></td>
						<Button class="btn btn-primary btn-block" Type="submit" formaction="cavail2.jsp">Check
								Availability</Button>
	</form>
 	</div>
    
     <!-- form-group end.// -->
                         
    <div class="form-group">
        <button type="submit" class="btn btn-primary btn-block" formaction="add2.jsp"> Create Account  </button>
    </div> <!-- form-group// -->      
    <p class="text-center">Have an account? <a href="login.jsp">Log In</a> </p>                                                                 
</form>
</article>
 </div> 
</div> <!-- card.// -->
<br><br><br><br><br><br>
<!--container end.//-->

<!--  -->
	
	<%
		} else {
					response.sendError(401);
				}
			}
		}
	%>
</body>
</html>