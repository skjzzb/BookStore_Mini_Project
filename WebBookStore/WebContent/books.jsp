<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Books Catalog</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp" />
<header>
  <h1 class="h1 mb-4" align="center">Welcome To BookStore</h1>
</header>
<br></br>
<br></br>

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<%

if ( session.getAttribute("uid") == null || ((String) session.getAttribute("uid")).compareTo("") == 0 ) {
	response.sendRedirect("login.jsp");
}
else {
	 %>
	 	 	 
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



<!-- Defalut template -->
.bg-gradient {
background: #C9D6FF;
background: -webkit-linear-gradient(to right, #E2E2E2, #C9D6FF); 
background: linear-gradient(to right, #E2E2E2, #C9D6FF);
} 
ul li {
  margin-bottom:1.4rem;
}
.pricing-divider {
border-radius: 20px;
background: #C64545;
padding: 1em 0 4em;
position: relative;
}
.blue .pricing-divider{
background: #2D5772; 
}
.green .pricing-divider {
background: #1AA85C; 
}
.red b {
  color:#C64545
}
.blue b {
  color:#2D5772
}
.green b {
  color:#1AA85C
}
.pricing-divider-img {
	position: absolute;
	bottom: -2px;
	left: 0;
	width: 100%;
	height: 80px;
}
.deco-layer {
	-webkit-transition: -webkit-transform 0.5s;
	transition: transform 0.5s;
}
.btn-custom  {
  background:#2d5772; color:#fff; border-radius:20px
}

.img-float {
  width:50px; position:absolute;top:-3.5rem;right:1rem
}

.princing-item {
  transition: all 150ms ease-out;
}
.princing-item:hover {
  transform: scale(1.05);
}
.princing-item:hover .deco-layer--1 {
  -webkit-transform: translate3d(15px, 0, 0);
  transform: translate3d(15px, 0, 0);
}
.princing-item:hover .deco-layer--2 {
  -webkit-transform: translate3d(-15px, 0, 0);
  transform: translate3d(-15px, 0, 0);
}
li img{
width:150px;
height:200px;
max-width: 300px;
max-height:350px;
}
.back{
background-image: url("background.jpeg");
}
div.sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  float: right;

}
#dd{
 color: #2d5772;
   
}
#dd:hover{
 color: black;

   
}
.cuu{

background: transparent;
border: 0;
}
</style>



      
<!--  <table border="2" cellpadding="1" cellspacing="2" align="center">
		<thead>
			<tr>
				<td align="center" style="width: 200px; font-weight:bold;">Book Title</td>
				<td align="center" style="width: 200px; font-weight:bold;">Author(s)</td>
				<td align="center" style="width: 200px; font-weight:bold;">Description</td>
				<td align="center" style="width: 200px; font-weight:bold;">Price (in USD)</td>
				<td align="center" style="width: 200px; font-weight:bold;">Quantity</td>
				<td align="center" style="width: 200px; font-weight:bold;">Order</td>
			</tr>
			</thead>-->	
			<%
			try {
				String connectionURL = "jdbc:mysql://localhost:3306/bookweb";
			    Connection connection = null; 
			    Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			    connection = DriverManager.getConnection(connectionURL, "root", "");
			    Statement stat=connection.createStatement();
			    String uid4=(String) session.getAttribute("uid");
			    long ui=Long.parseLong(uid4);
			    
			    String admin = "Select userid from users where userid='"+ui+"' and utype='admin'";
			    String query="select b.title,a.bookname, a.author_name, b.description, b.cost, b.ISBN from books as b, writer as a where b.id=a.id";
			    
			    ResultSet rs1=stat.executeQuery(admin);
			    if (rs1.next())
			    {
			    	session.setAttribute("uid", rs1.getString("userid"));
			    	response.sendRedirect("admin.jsp");
			    }
			    else
			    {
			    ResultSet rs=stat.executeQuery(query);
			    %>
			    <div id="" class="sticky " style="width: 150px; text-align: center;">
			<form action="cartbutton.jsp">
					
					
					<input type="hidden" name="uid" value="<%out.println(""+uid4+"");%>">
					
					<button class="cuu btn-lg btn-block  " type="submit" formaction="cartbutton.jsp"><i id="dd"class="fa fa-shopping-cart fa-5x"></i>
					
					

</button>
					</form>
					
					
				
			</div>
			    
<div class="back">
	  <div class="container-fluid ">
      <div class="row m-auto text-center w-75"><%
			    while (rs.next())
			    {
			    	%>
			    
					        <div class="col-4 princing-item blue">
          <div class="pricing-divider ">
              <h3 class="text-light">Title : <%out.println(rs.getString("bookname"));%></h3>
            <h4 class="my-0 display-2 text-light font-weight-normal mb-3"><%out.println(rs.getFloat("cost"));%><span class="h3">$</span>
             <svg class='pricing-divider-img' enable-background='new 0 0 300 100' height='100px' id='Layer_1' preserveAspectRatio='none' version='1.1' viewBox='0 0 300 100' width='300px' x='0px' xml:space='preserve' xmlns:xlink='http://www.w3.org/1999/xlink' xmlns='http://www.w3.org/2000/svg' y='0px'>
          <path class='deco-layer deco-layer--1' d='M30.913,43.944c0,0,42.911-34.464,87.51-14.191c77.31,35.14,113.304-1.952,146.638-4.729
	c48.654-4.056,69.94,16.218,69.94,16.218v54.396H30.913V43.944z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--2' d='M-35.667,44.628c0,0,42.91-34.463,87.51-14.191c77.31,35.141,113.304-1.952,146.639-4.729
	c48.653-4.055,69.939,16.218,69.939,16.218v54.396H-35.667V44.628z' fill='#FFFFFF' opacity='0.6'></path>
          <path class='deco-layer deco-layer--3' d='M43.415,98.342c0,0,48.283-68.927,109.133-68.927c65.886,0,97.983,67.914,97.983,67.914v3.716
	H42.401L43.415,98.342z' fill='#FFFFFF' opacity='0.7'></path>
          <path class='deco-layer deco-layer--4' d='M-34.667,62.998c0,0,56-45.667,120.316-27.839C167.484,57.842,197,41.332,232.286,30.428
	c53.07-16.399,104.047,36.903,104.047,36.903l1.333,36.667l-372-2.954L-34.667,62.998z' fill='#FFFFFF'></path>
        </svg>
          </div>
          <div class="card-body bg-white mt-0 shadow">
            <ul class="list-unstyled mb-5 position-relative">
              <li><img src="<%out.println( rs.getString("title"));%>"></li>
              
              <li><h3><b>Author : </b><%out.println(rs.getString("author_name"));%></h3></li>
              <li><h4><b>Description : </b><%out.println(rs.getString("description"));%></h4></li>
            
           
            	<form action="cart.jsp">
					<input type="hidden" name="ISBN" value="<%out.println(rs.getString("ISBN"));%>">
					<input type="hidden" name="uid" value="<%out.println(""+ui+"");%>">
					<li><b>Quantity : &nbsp;</b> <input style ="width:'30px' type="number" class="form-control input-normal" name="qty" value=""></li>
					<button class="btn btn-lg btn-block  btn-custom " type="submit" formaction="cart.jsp">Add To Cart</button>
					</form>
					</ul>
          </div>
        </div>
				<%
			    }
			    }			    
			%>
			</div>
	</div>
	<!--  </table> -->
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
}
%>
</body>
</html>