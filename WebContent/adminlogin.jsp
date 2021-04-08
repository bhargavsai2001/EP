<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RiverFork University</title>
	<link rel="stylesheet" type="text/css" href="styles.css">
	<script type="text/javascript" src="script.js"></script>
	<link rel="icon" href="favicon.ico" type="image/x-icon" />

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Spectral+SC:wght@700&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab&display=swap" rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Fira+Sans&display=swap" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="topnav" id="myTopnav">
		  

		  	<a href="index.html">Home</a>
		    <a href="signin.html" onclick="window.alert('Sign in to vote')" >Vote</a>
			
			<a href="signin.html" class="active">Sign In</a>
			<a href="signup.html" >Sign up</a>
			<a href="#" style="float: right;"><i class="bi bi-person-circle"></i></a>
			<a onclick="dark()" style="float: right;"><i class="bi bi-moon"></i></a>

			
			
			

		  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
		    <i class="bi bi-three-dots-vertical"></i>
		  </a>
		</div>

	<div id="home">
		<div align="center" style="padding-top: 30px;">
			<a href="index.html"><img src="images/footerlogo.png" alt="logo" width="300px;"></a><hr>
		</div>
	</div>

	<div align="center">
	<div class="signin"  align="center">
		<h1 align="center" style="color: maroon;">Admin Verification</h1>
	<form method="POST" align="center" action="adlog">
		<label>ENTER SCECRET KEY</label><br>
		<input type="password" required style="font-size: 20px; text-align:center; letter-spacing: 8px;" name="sckey"><br>
		<input type="submit" value="VERIFY">
	</form>
	<p align="center" style="font-size: 13px; color: green">CONTACT UNIVEVRSITY ELECTION COMISSION FOR SCECRET KEY</p>
</div>
	</div>

</body>
<footer>
	<div align="center">
		<img class="zoom" src="images/footerlogo.png" width="15%">
		<p>This project - <span style="color: orange;"><i>College Election System</i></span> is created for Educational purpose on behalf of Enterprise Programming in KL University.</p>
	</div>
	<br>
	
</footer>
</html>