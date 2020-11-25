<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Ticket booking | Registration Page</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition register-page">
<div class="register-box">
  <div class="register-logo">
    <a href="index2.html"><b>Ticket</b>Booking</a>
  </div>

  <div class="card">
    <div class="card-body register-card-body">
      <p class="login-box-msg">Register a new user</p>

      <form action="index.html" method="post">
        <div class="input-group mb-3">
          <input type="text" class="form-control input-change" id="name" placeholder="Full name">          
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>           
          </div>
          <div class="col-sm-12"><span id="name-validation" class="valid-change" style="color:red;"></span></div>
        </div>
        <div class="input-group mb-3">
          <select class="form-control">
          	<option value="male">Male</option>
          	<option value="female">Female</option>
          	<option value="others">Others</option>
          </select>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-genderless"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input type="number" class="form-control input-change" placeholder="phone" id="phone">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-phone"></span> 
            </div>
          </div>
          <div class="col-sm-12"><span id="phone-validation" class="valid-change" style="color:red;"></span></div>
        </div>
        <div class="input-group mb-3">
          <input type="email" class="form-control input-change" placeholder="Email" id="email">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-envelope"></span>
            </div>
          </div>
          <div class="col-sm-12"><span id="email-validation" class="valid-change" style="color:red;"></span></div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control input-change" placeholder="Password" id="password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
          <div class="col-sm-12"><span id="password-validation" class="valid-change" style="color:red;"></span></div>
        </div>
        <div class="input-group mb-3">
          <input type="password" class="form-control input-change" placeholder="Retype password" id="confrim-password">
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
          <div class="col-sm-12"><span id="confirmPassword-validation" class="valid-change" style="color:red;"></span></div>
        </div>
        <div class="row">
          <div class="col-8">
            <div class="icheck-primary">
              <input type="checkbox" id="agreeTerms" name="terms" value="agree">
              <label for="agreeTerms">
               I agree to the <a href="#">terms</a>
              </label>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-4">
            <button type="button" onClick="saveUser()" id="user-account" class="btn btn-primary btn-block">Register</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

     
      <a href="/ticket/login" class="text-center">I already have a account</a>
    </div>
    <!-- /.form-box -->
  </div><!-- /.card -->
</div>
<!-- /.register-box -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
</body>


<script type="text/javascript">


$(document).ready(function(){
	  $(".input-change").change(function(){
	    $(".valid-change").text("");
	});

});
function saveUser(){

	 $("#user-account :input").prop("disabled", true);

	 var name=$("#name").val();
	 var email=$("#email").val();
	 var phone=$("#phone").val();
	 var password=$("#password").val();
	 var confirmPassword=$("#confrim-password").val();	 
	
	if(name.trim()==""){
		$("#name-validation").text("Fill the name");
		return false;
	}else if(email.trim()=="" || !validateEmail(email)){
		$("#email-validation").text("Fill the email correctly");
		return false;
	}else if(password.trim()=="" ){
		$("#password-validation").text("Fill the password correctly");
		return false;
	}else if(confirmPassword.trim()=="" ){
		$("#confirmPassword-validation").text("Fill the confirm password correctly");
		return false;
	}else if(confirmPassword!=password){
		$("#password-validation").text("Confirm Password dones not match");
		$("#confirmPassword-validation").text("Confirm Password dones not match");
		return false;
	}
		
	 $.ajax({
	      type: "POST",
	     // dataType : 'json',
	      url: "/ticket/user",
	      data: {
	    	  name:name,
	    	  phone:phone,
	    	  email:email,
	    	  password:password
		      },
	      
	      success :function(result) {
	    	 
	         if(result){
	        	// alert("Sucess!");
	        	swal("Registered sucessfully! Now you can login!")
					.then((value) => {

			        	 window.location.href = '/ticket'; 
					});
	        
	         }else{
	        	 swal("Email already exit!")
	         }
	         
	     },
        error: function(e){    
        	swal("Unable to register ");
       	// resetForm();
     	  console.log(e)
     	   
     	   	        }
	  });
  
	 

	
}

function validateEmail(emailText) {
    
    var pattern = /^[a-zA-Z0-9\-_]+(\.[a-zA-Z0-9\-_]+)*@[a-z0-9]+(\-[a-z0-9]+)*(\.[a-z0-9]+(\-[a-z0-9]+)*)*\.[a-z]{2,4}$/;
    if (pattern.test(emailText)) {
        return true;
    } else {        
        return false;
    }
}

</script>
</html>
