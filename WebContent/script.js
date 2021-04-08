


// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

var modal2 = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal2) {
        modal.style.display = "none";
    }
}



function validate(){

	

	
	if(document.logform.sid.value=="")
	{
		window.alert("Please enter your ID");
		document.logform.sid.focus();
		return false;
	}
	if(document.logform.psw.value=="")
	{
		window.alert("Please enter Password");
		document.logform.psw.focus();
		return false;
	}
	/*
	else{
		if(document.logform.sid.value=="190031199" )
		{
			if(document.logform.psw.value=="Gmail@2001")
			{
				window.open("ballot.html#ballot");
				window.alert("Logged in succesfully");

				return true;
			}
			else{
				window.alert("Wrong Password");
				return false;
			}

		}
		else{
			window.alert("Wrong ID");
			return false;
		}
	}*/
}

var id = document.logform.sid.value;
				document.getElementById("idno").innerHTML =id;

function store(){

	if(document.regform.name.value=="")
	{
		alert("Please Enter your Name!");
		document.regform.name.focus();
		return false;
	}
	if(document.regform.sid.value=="")
	{
		alert("Please Enter your ID number!");
		document.regform.sid.focus();
		return false;
	}
	if(document.regform.umail.value=="")
	{
		alert("Please Enter your university email!");
		document.regform.umail.focus();
		return false;
	}
	if (document.regform.umail.value!=null) 
	{
		if (/.+kluniversity.in/.test(regform.umail.value))
		  {
		    return (true)
		  }
		  else{
		  	alert("You have entered an invalid email address!")
		    return (false)
		  }
		    
	}
	if(document.regform.psw.value=="")
	{
		alert("Please Enter your Password!");
		document.regform.psw.focus();
		return false;
	}

	var psw1=document.regform.psw.value;;
	if (document.regform.psw.value!=null) {
		var passw=  /^[A-Za-z]\w{7,14}$/;
		if(regform.psw.value.match(passw)) 
		{ 
		
		return true;
		}
		else
		{ 
		alert('Wrong Password format!, Try again.')
		return false;
		}
	}
	if(document.regform.gender.value=="")
	{
		alert("Please mention your Gender!");
		document.regform.gender.focus();
		return false;
	}
	var psw2=document.regform.rpsw.value;
	if(document.regform.rpsw.value=="")
	{
		alert("Please re-enter Password");
		document.regform.rpsw.focus();
		return false;
	}
	if (document.regform.rpsw.value!=null) {
		if (psw1==psw2) {
			return true;
		}
		else{
			alert("Password's Doesnt match");
			return false;
		}
	}
	else{
		window.alert("Registered succesfully");
		return true;
	}
}

function voted() {
	if (document.ballot.ver.value=="") 
	{
		window.alert("Fill required Fields!");
		return false;
	}
	
	else{
		
		if (document.ballot.ver.value=="52") 
		{
			if(document.ballot.vote!=null)
			{
				window.alert("Vote placed succesfully!");
				return true;
			}
			else{
				window.alert("Select the candidate!");
				return false;
			}

		}
		else{
			/*window.alert("Human verification failed!");*/
			document.getElementById("hvf").innerHTML ="Human verification failed!";
		}
	}
	 
}

function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}


function dark() {
   var element = document.body;
   element.classList.toggle("dark-mode");
}

function showpassword() {
  var x = document.getElementById("psw");
  if (x.type === "password") {
    x.type = "text";
  } else {
    x.type = "password";
  }
}



