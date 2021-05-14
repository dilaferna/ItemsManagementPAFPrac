<%@page import= "com.Item" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
   <% 
   //Save---------------------------------
	if (request.getParameter("itemCode") != null) 
	{ 
	 Item itemObj = new Item(); 
	 String stsMsg = ""; 

		//Insert--------------------------
		
		if (request.getParameter("hidItemIDSave") == "")
		{
		stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
		request.getParameter("itemName"),
		request.getParameter("itemPrice"),
		request.getParameter("itemDesc"));
		}
		
		else//Update----------------------
		{
		stsMsg = itemObj.updateItem(request.getParameter("hidItemIDSave"),
		request.getParameter("itemCode"),
		request.getParameter("itemName"),
		request.getParameter("itemPrice"),
		request.getParameter("itemDesc"));
		}
		session.setAttribute("statusMsg", stsMsg);
		}
		//Delete-----------------------------
		
		if (request.getParameter("hidItemIDDelete") != null)
		{
		Item itemObj = new Item();
		String stsMsg =
		itemObj.deleteItem(request.getParameter("hidItemIDDelete"));
		session.setAttribute("statusMsg", stsMsg);
		}

%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Items Management</title>
	<link rel="stylesheet" href="View/bootstrap.min.css">
	<script src="Components/jquery-3.2.1.min.js"></script>
	<script src="Components/Item.js"></script>
	<style>
	table {
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}
	
	td, th {
	  border: 1px solid #dddddd;
	  text-align: left;
	  padding: 8px;
	}
	
	tr:nth-child(even) {
	  background-color: #dddddd;
	  }
	.button {
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	}
	body {font-family: Arial, Helvetica, sans-serif;}
	form {border: 3px solid #f1f1f1;}
	
	input[type=text], input[type=password] {
	  width: 100%;
	  padding: 12px 20px;
	  margin: 8px 0;
	  display: inline-block;
	  border: 1px solid #ccc;
	  box-sizing: border-box;
	}
	
	body {
	 background-image: linear-gradient(white,steelblue);
	}
	
	#logo{
		padding-top:5px;
		padding-bottom:5px;
		display:block;
		height : 200px;
		width : 300px;
	}
	
	h1 {
	 color: black;
	 text-align: center;
	}
	
	h2 {
	 color: black;
	 text-align: center;
	 font: italic 100% fantasy;
	}
	
	h3 {
	 color: black;
	 text-align: center;
	 font: italic 75% fantasy;
	}
	
	p {
	 background-color: #000000;
	 color: white;
	 text-align: left;
	 border: 3px groove #696969;
	}
	
	/*navigation bar */
	.nav ul {
	  list-style-type: none;
	  margin: 0;
	  padding: 0;
	  overflow: hidden;
	  background-color: #333;
	}
	
	.nav li {
	  float: left;
	}
	
	.nav li a {
	  display: block;
	  color: white;
	  text-align: center;
	  padding: 14px 45px;
	  text-decoration: none;
	}
	
	.nav li a:hover:not(.active) {
	  background-color: #111;
	}
	
	.nav .active {
	  background-color: #4CAF50;
	}
	
	/* nav bar ended */
	
	.column {
	  float: left;
	  width: 33.33%;
	  padding: 5px;
	}
	
	/* Clear floats after image containers */
	.row::after {
	  content: "";
	  clear: both;
	  display: table;
	}
		
	.button {
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 16px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	  margin: 4px 2px;
	  transition-duration: 0.6s;
	  cursor: pointer;
	}
	.button {
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	}
	.button:hover {
	  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
	}
	.button:hover {
	  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
	}
	.button1 {
	  background-color: white; 
	  color: black; 
	  border: 2px solid #4CAF50;
	}
	
	.button1:hover {
	  background-color: #4CAF50;
	  color: white;
	}
	
	.button2 {
	  background-color: white; 
	  color: black; 
	  border: 2px solid #008CBA;
	}
	
	.button2:hover {
	  background-color: #008CBA;
	  color: white;
	}
	
	.button3 {
	  background-color: white; 
	  color: black; 
	  border: 2px solid #f44336;
	}
	
	.button3:hover {
	  background-color: #f44336;
	  color: white;
	}
	
	.cancelbtn {
	  width: auto;
	  padding: 10px 18px;
	  background-color: #f44336;
	}
	
	.imgcontainer {
	  text-align: center;
	  margin: 24px 0 12px 0;
	}
	
	img.avatar {
	  width: 40%;
	  border-radius: 50%;
	}
	
	.container {
	  padding: 16px;
	}
	
	table {
	  font-family: arial, sans-serif;
	  border-collapse: collapse;
	  width: 100%;
	}
	
	td, th {
	  border: 1px solid #dddddd;
	  text-align: left;
	  padding: 8px;
	}
	
	tr:nth-child(even) {
	  background-color: #dddddd;
	  }
	.button {
	  background-color: #4CAF50; /* Green */
	  border: none;
	  color: white;
	  padding: 15px 32px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 16px;
	}
	.button:hover {
	  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
	}
	.button:hover {
	  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
	}
	</style>
	</head>
	<body>
		<br><br><br><br>
		<h1>Items Management</h1>
		<div class="container">
				<form id="formItem" name="formItem" method="post" action="Item.jsp">
				 Item code: 
				<input id="itemCode" name="itemCode" type="text" 
				 class="form-control form-control-sm">
				<br> Item name: 
				<input id="itemName" name="itemName" type="text" 
				 class="form-control form-control-sm">
				<br> Item price: 
				<input id="itemPrice" name="itemPrice" type="text" 
				 class="form-control form-control-sm">
				<br> Item description: 
				<input id="itemDesc" name="itemDesc" type="text" 
				 class="form-control form-control-sm">
				<br>
				<div align="center">
				<input id="btnSave" name="btnSave" type="button" value="Save" class="btn btn-primary">
				<input type="hidden" id="hidItemIDSave" name="hidItemIDSave" value="">
				</div>
				</form>
		</div>
		
		<div class="container">
		<%
		 out.print(session.getAttribute("statusMsg")); 
		%> 
		<br>
		<%
		 Item itemObj = new Item(); 
		 out.print(itemObj.readItems()); 
		%>
		
		</div>
	</body>
</html>