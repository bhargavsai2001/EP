<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, java.io.*, java.sql.*"%>
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
		  

		  <a href="logout">Logout</a>
			
			
			<a href="#ballot">Vote</a>
			<a href="#procedure">Procedure</a>
			<a style="float: right;"><%
					int qid=(int)session.getAttribute("Sid"); 
					//out.print(qid);
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");
					Statement st= con.createStatement();
					String strQuery1 = "SELECT name FROM signup where sid=";
					strQuery1 += qid;
					
					ResultSet rs1 = st.executeQuery(strQuery1);
					while(rs1.next()) {
		                out.println(rs1.getString(1));
		            }
					
			%></a>
			<a onclick="dark()" style="float: right;"><i class="bi bi-moon"></i></a>

		  <a href="javascript:void(0);" class="icon" onclick="myFunction()">
		    <i class="bi bi-three-dots-vertical"></i>
		  </a>
		</div>

	<div id="home">
		<div align="center" style="padding-top: 30px;">
			<a href="index.html"><img src="images/footerlogo.png" alt="logo" width="300px;"></a><hr>
		</div>
		<h2 align="center">President Elections 2021</h2>
		<div id="s1">
			<!--<img src="https://eci.gov.in/img/voter-slider1.jpg" class="us" width="100%">-->
			<img src="images/slider.jpg" class="us" width="100%">
		</div>
	</div>
	

	

	<div id="ballot" class="votebox">
		<h2 align="center">e-BALLOT BOX</h2><hr>
		

		<div class="row">
		  <div class="column">
		    <div class="card">
		      <img src="https://www.freeiconspng.com/uploads/customers-icon-3.png" class="prof" width="80%">
		      <h2>BHARGAV SAI</h2>
		      <p>CSE</p>
		      <p>	"I am the RIGHT CHOICE, go ahead, Raise your voice!"</p>
		    </div>
		  </div>

		 
		  
		  <div class="column">
		    <div class="card">
		      <img src="https://www.freeiconspng.com/uploads/customers-icon-3.png" class="prof" width="80%" >
		      <h2>BHARATH CHANDRA</h2>
		      <p>CSE</p>
		      <p>	"I dont just speak the change, I MAKE the CHANGE!"</p>
		    </div>
		  </div>
		  
		  <div class="column">
		    <div class="card">
		      <img src="https://www.freeiconspng.com/uploads/customers-icon-3.png" width="80%" class="prof">
		      <h2>ABHISYANTH</h2>
		      <p>CSE</p>
		      <p>	"Life is too short to have A BAD STUDENT GOVERNMENT. Give your vote!"</p>
		    </div>
		  </div>
		</div>

			<br><br>

			<form name="ballot" method="post" action="ballot">
				<p>Head of Elections<br>Respected sir,</p><br>
				<p align="center">	I hereby declare that the code of conduct prescribed by the University Election
Commission has been read by me/read over to me and I will abide by the conditions
stipulated therein.My vote is for Mr./Mrs. <span>
				<select name="vote" id="vote" >
					<option disabled selected value> -- select the candidate -- </option>
				  <option value="BHARGAVSAI">BHARGAV SAI</option>
				  <option value="BHARATH CHANDRA">BHARATH CHANDRA</option>
				  <option value="ABHISHYANTH">ABHISYANTH</option>
				  <option value="NOTA">NOTA</option>
				</select></span>. I have taken this decision on my own and no one influenced or abused me.</p>
				
				<div align="center">
					<fieldset style="width: 80%" align="center">
	  				<legend>Human Verification:</legend>
					<p>Solve: 20 + thirty two=<span>
						<select name="ver" id="ver">
							<option disabled selected value> -- select an option -- </option>
						  <option value="50">50</option>
						  <option value="52">52</option>
						  <option value="42">42</option>
						  <option value="56">56</option>
						</select>
					</span></p>
					<p id="hvf" style="color: red;"></p>
					</fieldset>
				</div>
				<% 
					boolean status=false;  
					
					try{  
					Class.forName("com.mysql.jdbc.Driver");  
					Connection con8=DriverManager.getConnection("jdbc:mysql://localhost:3306/ep","root","root");       
					PreparedStatement ps=con.prepareStatement("select * from ballot where id=?");  
					ps.setInt(1,qid);  
					    
					ResultSet rs=ps.executeQuery();  
					status=rs.next();  
					          
					}
					catch(Exception e)
					{
						System.out.println(e);
					}  
					
					if(status){
						String msg = "<p style='margin: 12px auto;color: red; padding: 30px;border: 2px solid red; width: 60%;' align='center'>Your Vote Already Placed!</p>";
						out.println(msg);
					}
					else{
						out.print("<button align='center' onclick='voted()'>VOTE</button>");
					}
					%>
				
				
			</form>
			
			
		
	</div>
	<div class="votebox us" id="procedure">
		<h1>ELECTION PROCEDURES - STUDENTS</h1><hr>
		<br>
		<p>Under the College and Institutes Act, a student is defined as:</p>
		<p style="padding-left: 40px;">"a person the Registrar recognizes to be enrolled and in good standing in a course or program of studies at the institution"</p>
		<p>Note: Student candidates must be currently enrolled Online due to COVID-19 guidelines under UGC.</p>
		<br>
		<h2>NOMINATIONS</h2>
		<ol>
			<li>Each nominee must complete an official nomination form. Each nomination must be supported by 10 eligible voters within the constituent group.</li>
			<li>Eligibility to be nominated and to cosign a nomination will be validated from an authorized voter list compiled by the Registrar.</li>
			<li>Nominations must be submitted within a specified period of time to be determined and publicized by the Registrar. Nominations received after this deadline will not be considered.</li>
		</ol>
		<br>
		<h2>CAMPAIGN GUIDELINES</h2>
		<ol>
			<li>Prospective nominees may not campaign until the Registrar has designated them as an official nominee.</li>
			<li>Nominees may spend no more than ???????20,000 in direct campaign expenses. Candidates will be required to provide a written report of campaign expenses with attached receipts.</li>
			<li>Each nominee will provide a 250-word statement of their views to the Registrar. This statement, along with the statements of other candidates, will be posted on the Douglas College Website.</li>
			<li>Nominees must cease campaigning and all campaign materials except the campaign platforms must be removed not less than ten hours prior to the opening of the election. The Registrar will be responsible for monitoring compliance with this regulation.</li>
		</ol>
		<br>
		<h2>REPRESENTAION</h2>
		<p>All students who are registered in one credit course at the time of the election are eligible to vote. For the purpose of nominations, all students who are registered in one credit course at the time of the call for nomination are eligible for nomination. During the term of office, a student member of the College Board must:</p>
		<ol>
			<li>maintain registered status in at least one credit course at the College for at least two semesters of the term of office.</li>
			<li>not withdraw or be required to withdraw from the College.</li>
		</ol>
		<p>If either condition mentioned above is not met then the student member must forfeit the seat on the College Board.</p>
		<br>
		<h2>BOARD</h2>
		<ol>
			<li>Students will elect two representatives to the Board who will serve for a term of one year and may be elected to further terms.</li>
			<li>The student representatives will be elected from the students at large.</li>
		</ol>
		<br>
		<h2>ELECTION PROCESS</h2>
		<ol>
			<li>At the close of nominations, the Registrar will announce candidate names.</li>
			<li>Candidate campaigning and the voting process will occur over a period designated by the Registrar.</li>
			<li>Balloting procedures will ensure that only eligible voters cast a ballot and that anonymity is guaranteed for the voter. Voters must be part of the official voters list to cast a ballot.</li>
			<li>The Registrar will be responsible for the counting of ballots and the Student Union will appoint a scrutineer to validate the election results.</li>
			<li>Candidates may request a recount if the official count indicates that there is a margin of difference between the candidates of 10 votes or less.</li>
			<li>In case of a tie vote, the Registrar, in conjunction with the two candidates, will decide the outcome by a toss of the coin.</li>
			<li>Ballots submitted for the College Board elections should identify two eligible candidates. Those ballots, which identify only one candidate are deemed valid and will be counted.</li>
		</ol>
		<br>
		<h2>ANNOUNCEMENT OF RESULTS</h2>
		<ol>
			<li>The Registrar will be responsible for informing all candidates of the results.</li>
			<li>The Registrar will announce the name(s) of the successful candidates. Ballot totals will be available to candidates only.</li>
			<li>The candidate or candidates with the highest number of votes, within a constituency group, will be declared as the successful candidate(s).</li>
		</ol>
		<br>
		<h2>DISQUALIFICATION OF A CANDIDATE</h2>
		<ol>
			<li>The Registrar or designate may disqualify any candidate who does not comply with the campaign guidelines.</li>
			<li>The decision on disqualification is subject to appeal under the election appeals procedure.</li>
		</ol>
		<br>
		<h2>APPEALS</h2>
		<ol>
			<li>Any candidate is eligible to file a written request for an appeal within 10 working days of the announcement of the election results.</li>
			<li>Appeals must provide specific grounds for the appeal, indicating that due process was not followed, important evidence was missing, or the decision was inconsistent with the principles of natural justice.</li>
			<li>An Elections Appeal Committee for the Board elections consisting of three members will convene a hearing. The Committee will consist of the following:</li>
			<ol>
				<li>the Board Chair,</li>
				<li>the College Chief Executive Officer</li>
				<li>one Board representative</li>
			</ol>
		</ol>
		<p>The Registrar will sit ex-officio and will be non-voting. In the event of a conflict of interest, another voting member will be selected in consultation with the appellant. Decisions rendered by the Appeal Committee are final and binding. The appellant will attend the hearing.</p>
		<br>
		<h2>BY-ELECTIONS</h2>
		<ol>
			<li>By-elections will be held in the event that a candidate cannot complete a term of office.</li>
			<li>A by-election will not be held if there is three months or less to serve in the term.</li>
		</ol>
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