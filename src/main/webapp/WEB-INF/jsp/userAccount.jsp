<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head><!-- https://bootsnipp.com/snippets/WaeDX 
			https://bootsnipp.com/snippets/X2Db0
-->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Ticket Booking</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->
  
  <div class="nav-bar"></div>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      			 <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          
          <!--/.col (left) -->
          <!-- right column -->
          <div class="col-md-12">
            <!-- general form elements disabled -->
            <div class="card card-warning">
              <div class="card-header">
               <!--  <h3 class="card-title">Department Details</h3> -->
               <button onClick="editUser()" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Edit</button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                 <form role="form" id="user-account"> 
                
				  <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" value="${name}" placeholder="Enter name " id="name" name="name" required="required">
                    
                  </div>
                
                 
                 <div class="form-group">
                    <label>Gender</label>
                    <select class="form-control" id="gender" name="gender" value="${gender}" required="required">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                         <option value="others">Others</option>
                    </select>
                  </div>
                  
                  <div class="form-group">
                    <label>Email</label>
                    <input type="gmail" class="form-control" value="${email}" placeholder="Enter email id " id="email" required="required">                    
                  </div>
                  
                   <div class="form-group">
                    <label>Phone number</label>
                    <input type="number" class="form-control" value="${phone}" placeholder="Enter phone number" id="phone" required="required">                    
                  </div>
                  
                  <div class="row">
                    <div class="col-sm-12 col-xs-12">
                      <!-- textarea -->
                      <div class="form-group">
                        <label>Address</label>
                        <textarea class="form-control" rows="3" placeholder="Enter your address" id="address" value=""  >${address}</textarea>
                      </div>
                    </div>                    
                  </div>
                  
                 <div class="form-group">
                    <label>City</label>
                    <input type="text" class="form-control" value="${city}" placeholder="Enter city" id="city" required="required">                    
                 </div>

     			 <div class="form-group">
                    <label>District</label>
                    <input type="text" class="form-control" placeholder="Enter district" id="district" value="${district}" required="required">                    
                 </div>
                 
                 <div class="form-group">
                    <label>Pincode</label>
                    <input type="number" class="form-control" placeholder="Enter pincode" id="pincode" 	 value="${pincode}" required="required">                    
                 </div>
               <div class="form-group">
                    <label>State</label>
                    <input type="text" class="form-control" value="${state}" placeholder="Enter state" id="state" required="required">                    
                 </div>
                 
				<div class="row">
					<div class="col-md-6">
						<button  type="button" onClick="saveUser()" class="btn btn-block btn-success btn toastrDefaultSuccess" id="saveEmployee">Save</button>
					</div>
					<div class="col-md-6">
						<button type="button" class="btn btn-block btn-info btn">Cancel</button>
					</div>	
				</div>
				
                </form>
						
				 <div class="form-group invisible">
                    <label>Id</label>
                    <input type="number" class="form-control" value="${id}" placeholder="Enter id" id="user_id" required="required">                    
                 </div>		
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <!-- general form elements disabled -->
            
            <!-- /.card -->
          </div>
          </div>
          <!--/.col (right) -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>

   
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

 <jsp:include page="footer.jsp" />

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>

<script src="plugins/toastr/toastr.min.js"></script>


<style>

.invisible {
  visibility: hidden;
}
</style>
<script>

function editUser(){
	
	 $("#user-account :input").prop("disabled", false);
}


$(document).ready(function(){
	 $("#user-account :input").prop("disabled", true);
		
	
	  $.ajax({
	      type: "GET",	     
	      url: "/ticket/login/menu",	    
	      success :function(result) {
	    	  console.log(result);
	    	  $(".nav-bar").append(result);
	    	
	     },
       error: function(e){          	   
    	  console.log(e)
    	   
    	   	        }
	  });



	 
});


function saveUser(){

	 $("#user-account :input").prop("disabled", true);

	 
	 var user= {"id":$("#user_id").val(),"name":$("#name").val(),"gender":$("#gender").val(),"address":$("#address").val(),
					"email":$("#email").val(),"phone":$("#phone").val(),"city":$("#city").val(),
					"state":$("#state").val(),"district":$("#district").val(),"pincode":$("#pincode").val()
			 };
	 $.ajax({
	      type: "PUT",
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      url: "/ticket/user",
	      data:  JSON.stringify(user),
	      
	      success :function(result) {
	         if(result){
	        	 alertMsg("User updated!");
	        	 resetForm();
	         }
	         
	     },
        error: function(e){    
       	 errorToast("Unable to update ");
       	// resetForm();
     	  console.log(e)
     	   
     	   	        }
	  });
  
	 

	
}
function alertMsg(msg){
	
		 toastr.success(msg);
}
  
 function errorToast(msg){
	 
	 toastr.error(msg);
 }
  
  function resetForm(){
	  
	  $("#title").val('');
	  $("#description").val('');
  }
  
</script>
</body>
</html>
  
  
  