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

  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/toastr/toastr.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/adminlte.min.css">
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
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                
				  <div class="form-group">
                    <label>Select Ticket Type</label>
                    <select id="selectTicketType" class="form-control col-sm-4">
                       <option value="0">Select</option>
                    	<option value="individual">Individual</option>
                    	<option value="group">Group</option>                    
                    </select>
                  </div>
                  <div class="form-group col-sm-4">
		              <label>Price:</label>
		              <input type="number" class="form-control" name="cost"  placeholder="Price" id="price"  required="required" disabled>
		          	 <span class="offer" style="color:#1fde1f;"></span>
		          </div>
                  <div class="row ">
                  		 <div class="form-group count-div">
		                    <label>Enter no of passengers:</label>
		                    <input type="number" class="form-control" name="cost" placeholder="Enter no of passengers" id="passengers-count"  required="required">
		                 	<span class="passengers-validation" style="color:red;"></span>
		                  </div>
		                  <div class="form-group age-div">
		                    <label>Enter the age:</label>
		                    <input type="number" class="form-control" name="cost" placeholder="Enter the age" id="age"  required="required">
		                  </div>
		                  
                         
                  </div>

 						<div class="name-div row">
                                 
                          
                          </div>
				<div class="row">
					<div class="col-md-6">
						<button type="button" id="saveBooking" class="btn btn-block btn-success btn toastrDefaultSuccess" id="saveEmployee">Save</button>
					</div>
					<div class="col-md-6">
						<button type="button" class="btn btn-block btn-info btn">Cancel</button>
					</div>	
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
<script src="${pageContext.request.contextPath}/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath}/dist/js/demo.js"></script>

<script src="${pageContext.request.contextPath}/plugins/toastr/toastr.min.js"></script>

<script>
var count=1;
$(document).ready(function(){
	$(".count-div").hide();
	$(".age-div").hide();
	  $.ajax({
	      type: "GET",	     
	      url: "/ticket/login/menu",	    
	      success :function(result) {
	    	 // console.log(result);
	    	  $(".nav-bar").append(result);
	    	
	     },
       error: function(e){          	   
    	  console.log(e)
    	   
    	   	        }
	  });


		//saveBooking

	  $( "#saveBooking" ).click(function() {
				  
			var selectTicketType=$("#selectTicketType").val();
			if(selectTicketType=="individual"){
				saveInvidual();
			}else{
				saveGroup();
			}			
	});

	 
	 
	  $("#selectTicketType").change(function(){
		  if($("#selectTicketType").val()=="individual"){
			  $(".count-div").hide();
				$(".age-div").show();				
				$('#price').prop('disabled', false);
				$('#price').val("500");
				$('#price').prop('disabled', true);
				$(".offer").text("If you book group booking to get offer 50%!");
				$(".name-div").append('<br><div class="form-group"><input type="text" class="form-control" name="cost" placeholder="Enter passenger name" id="passengersName1"  required="required"><br></div>');
			}else{
				$(".count-div").show();
				$(".age-div").hide();
				$('#price').prop('disabled', false);
				$('#price').val("250");
				$('#price').prop('disabled', true);
				$(".offer").text("You got a 50% offer for group booking!");
			}	
	  });


	  $("#passengers-count").change(function(){

		  $(".passengers-validation").text("");
		  $(".name-div").empty();
		  if($("#passengers-count").val()>1){	
			 for(var i=1;i<=$("#passengers-count").val();i++){
			    $(".name-div").append('<br><div class="form-group"><input type="text" class="form-control" name="cost" placeholder="Enter passenger name" id="passengersName'+i+'"  required="required"><br></div>');
			 }
		}else{
			$(".passengers-validation").text("Please enter minimum 2 passengers");
		}
		

	});
});


function saveInvidual(){
	
	var selectTicketType=$("#selectTicketType").val();
	var price=$("#price").val();
	var name=$("#passengersName1").val();
	var age=$("#age").val();
	var username=sessionStorage.getItem("empId");
	if(age==null || age==""){
		errorToast("Fill the age");
	}
	var bookingDetails={"bookingType":"individual","age":age,"count":"","passengerName":name,
			"rate":price,"offer":""};

	 $.ajax({
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      url: "/ticket/booking/"+username+"/",
	      data:  JSON.stringify(bookingDetails),
	      
	      success :function(result) {
	         if(result){
	        	 alertMsg("Booking submit!");
	        	 resetForm();
	         }
	         
	     },
        error: function(e){    
       	 errorToast("Unable to add ");
       	// resetForm();
     	  console.log(e)
     	   
     	   	        }
	  });
		
}

function saveGroup(){

	var selectTicketType=$("#selectTicketType").val();
	var price=$("#price").val();
	var name="";
	var username=sessionStorage.getItem("empId");
	for(var i=1;i<=$("#passengers-count").val();i++){
		if(i==1){
			name=$("#passengersName"+i).val();
		}else{
			name=name+","+$("#passengersName"+i).val();
		}
		
	}

	
	var bookingDetails={"bookingType":"group","age":"","count":$("#passengers-count").val(),"passengerName":name,
			"rate":price,"offer":"50%"};

	 $.ajax({
	      type: "POST",
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      url: "/ticket/booking/"+username+"/",
	      data:  JSON.stringify(bookingDetails),
	      
	      success :function(result) {
	         if(result){
	        	 alertMsg("Booking submit!");
	        	 resetForm();
	         }
	         
	     },
       error: function(e){    
      	 errorToast("Unable to add ");
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
	  
		$(".count-div").hide();
		$(".age-div").hide();
		$(".name-div").empty();
		$('#price').prop('disabled', false);
		$('#price').val("");
		$('#price').prop('disabled', true);
		$(".offer").text("");
  }
  
</script>
</body>
</html>
  
  
  