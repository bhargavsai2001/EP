<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, java.io.*, java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RiverFork University</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<link rel="stylesheet" type="text/css" href="tables.css">
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
		  

		  	<a href="logout">Logout</a>
		    <a href="signin.html" onclick="window.alert('Sign in to vote')" >Vote</a>
			
			<a href="signin.html" >Sign In</a>
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
	
	
	<div class="votebox">
		<h1 align="center">Admin Panel</h1>
		<hr>
		
		<h2>Index</h2><hr style="border:2px solid black; box-shadow: none;">
		<center>
		<table class="styled-table" style="border: 2px solid maroon" align="center">
			<tr >
				<td>Total No of voters</td>
				<% int nov = 17043; %>
				<td><% out.print(nov); %></td>
			</tr>
			<tr>
				<td>Registered</td>
				<td>
					<%
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");
						Statement st=con.createStatement();
						String strQuery = "SELECT COUNT(*) FROM signup";
						ResultSet rs = st.executeQuery(strQuery);
						String Countrow="";
						while(rs.next()){
						Countrow = rs.getString(1);
						out.println(Countrow);
						}
						
					%>
				</td>
			</tr>
			<tr>
				<td>Voted</td>
				<td>
					<%
						Class.forName("com.mysql.jdbc.Driver");
						Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");
						Statement st1=con.createStatement();
						String strQuery1 = "SELECT COUNT(*) FROM ballot";
						ResultSet rs1 = st.executeQuery(strQuery1);
						String Countrow1="";
						while(rs1.next()){
						Countrow1 = rs1.getString(1);
						out.println(Countrow1);
						}
						
					%>
				</td>
				<!-- select vote, count(*) from ballot group by vote; -->
			</tr>
			<tr>
				<td>Yet to Register</td>
				<td>
					<%
						int h1 = Integer.parseInt(Countrow);  
						int h = (nov-h1);
						out.println(h);
					%>
				</td>
			</tr>
			<tr>
				<td>Yet to Vote</td>
				<td>
					<%
						int j1 =Integer.parseInt(Countrow);
						int j2 =Integer.parseInt(Countrow1);
						out.println(j1-j2);
					%>
				</td>
			</tr>
			<tr>
				<td>Disquallified Voters</td>
				<td>90</td>
			</tr>
		</table></center><br><br>
		<h2>Votes</h2><hr style="border:2px solid black; box-shadow: none;">
			<%
			try {
				Connection con2 = null;
				Statement st2 = null;
				ResultSet rs2 = null;
				Class.forName("com.mysql.jdbc.Driver");
				con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");
				st2=con.createStatement();
			String Data = "SELECT vote,COUNT(*)FROM ballot GROUP BY vote";
			rs2 = st2.executeQuery(Data);
			%><center>
			<TABLE class="styled-table" align="center">
			<tr  width="10" style="color: white; background-color: maroon;">
			<td>Candidate</td>
			<td>Number of Votes</td>
			</tr>
			<%
			while (rs2.next()) {
			%>
			<tr>
			<td><%=rs2.getString("vote")%></td>
			<td><%=rs2.getString("COUNT(*)")%></td>
			
			</tr>
			
			
			<%   }    %>
			</table></center>
			
			<%
			rs2.close();
			st2.close();
			con2.close();
			} 
			catch (Exception ex) 
			{
				out.println("Can’t connect to database.");
			}
			%>
			<br><br>
			<%
			try {
				Connection con3 = null;
				Statement st3 = null;
				ResultSet rs3 = null;
				Class.forName("com.mysql.jdbc.Driver");
				con3=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");
				st3=con.createStatement();
			String Data = "SELECT name,sid,umail,gender FROM signup";
			rs3 = st3.executeQuery(Data);
			%>
			
			<h2>Registered Students</h2><hr style="border:2px solid black; box-shadow: none;">
			<div style="width: 100%; height: 300px; overflow-y: scroll;">
			<center>
			<TABLE class="styled-table" align="center" >
			<tr  width="10" style="color: white; background-color: maroon;">
				<th>Name</th>
				<th>Student ID</th>
				<th>Email</th>
				<th>Gender</th>
			</tr>
			
			<%
			while (rs3.next()) {
			%>
			<tr >
				<td><%=rs3.getString("name")%></td>
				<td><%=rs3.getString("sid")%></td>
				<td><%=rs3.getString("umail")%></td>
				<td><%=rs3.getString("gender")%></td>
			
			</tr>
			<%    }    %>
			</table></center></div>
			<%
			rs3.close();
			st3.close();
			con3.close();
			} 
			catch (Exception ex) 
			{
				out.println("Can’t connect to database.");
			}
			%>
			<br><br>
			
			<%
			try {
				Connection con4 = null;
				Statement st4 = null;
				ResultSet rs4 = null;
				Class.forName("com.mysql.jdbc.Driver");
				con4=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");
				st4=con.createStatement();
			String Data = "select ballot.id, signup.name, signup.umail, signup.gender, ballot.vote, ballot.ts from ballot, signup where ballot.id = signup.sid;";
			rs4 = st4.executeQuery(Data);
			%>
			<h2>Voted Students</h2><hr style="border:2px solid black; box-shadow: none;"><center>
			<TABLE class="styled-table" align="center">
			<tr  width="10" style="color: white; background-color: maroon;">
				
				<th>Student ID</th>
				<th>Name</th>
				<th>Email</th>
				<th>Gender</th>
				<th>Voted for</th>
				<th>Voted on</th>
			</tr>
			<%
			while (rs4.next()) {
			%>
			<tr>
			<td><%=rs4.getString("id")%></td>
			<td><%=rs4.getString("name")%></td>
			<td><%=rs4.getString("umail")%></td>
			<td><%=rs4.getString("gender")%></td>
			<td><%=rs4.getString("vote")%></td>
			<td><%=rs4.getString("ts")%></td>
			
			</tr>
			<%   }    %>
			</table></center>
			
			<%
			rs4.close();
			st4.close();
			con4.close();
			} 
			catch (Exception ex) 
			{
				out.println("Can’t connect to database.");
			}
			%>
			
			<h2>Gender Index</h2><hr style="border:2px solid black; box-shadow: none;">
			<%
			try {
				Connection con4 = null;
				Statement st4 = null;
				ResultSet rs4 = null;
				Class.forName("com.mysql.jdbc.Driver");
				con4=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");
				st4=con.createStatement();
				String Data4 = "SELECT gender,COUNT(*)FROM signup GROUP BY gender";
				rs4 = st4.executeQuery(Data4);
				%><center>
				<TABLE class="styled-table" align="center">
				<tr  width="10" style="color: white; background-color: maroon;">
				<td>Gender</td>
				<td>Voters</td>
				</tr>
				<%
				while (rs4.next()) {
				%>
				<tr>
				<td><%=rs4.getString("gender")%></td>
				<td><%=rs4.getString("COUNT(*)")%></td>
				
				</tr>
				<%}    %>
				</table></center>
				
				<%
				rs4.close();
				st4.close();
				con4.close();
				} 
				catch (Exception ex) 
				{
					out.println("Can’t connect to database.");
				}
				%>
				
				<h2>Delete Vote</h2><hr style="border:2px solid black; box-shadow: none;">
				<div align="center">
					<form method="post" action>
						<label>Enter Student ID Number</label><br>
						<input type="number" name = "did" required style="width: 30%; padding: 10px;"><br>
						<input type="submit" value="DELETE" formaction="delete" style="width: 30%">
						
					</form>
				</div>
				
					
				</div>
				
	</div>
				<p style="float: right;"><%
					String ad= (String) session.getAttribute("adlog");
					out.print(ad);
				%></p>>

</body>
</html>