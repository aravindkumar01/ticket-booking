<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Ticket Booking</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/toastr/toastr.min.css">
  
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
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Checkout</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">History</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">History</h3> 
        </div>
        <div class="card-body">
         	
         	
         	
         				
         				<div class="add-history row"></div>
         			
         		
         	
         	
         	
         	
        </div>
        <!-- /.card-body -->
        
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->

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
$(document).ready(function(){
	  $.ajax({
	      type: "GET",	     
	      url: "/ticket/login/menu",	    
	      success :function(result) {
	    	
	    	  $(".nav-bar").append(result);
	    	
	     },
       error: function(e){          	   
    	  console.log(e)
    	   
    	   	        }
	  });


	  var username=sessionStorage.getItem("empId");
	  $.ajax({
		    type: "GET",
		    contentType : 'application/json; charset=utf-8',
		    dataType : 'json',
		    url: "/ticket/booking/"+username+"/",	    
		    //data: JSON.stringify(employee),
		    success :function(result) {
		          console.log(result);
		          $.each(result,function( i,j ) {

		      		 	  var offer=j.offer;
			      		    if(offer=="" || offer==null){
									offer="-";
					      	}
					  	     $(".add-history").append('<div class="col-sm-4"><div class="card" style=""><div class="card-body"><div class=""><h5 style="color:#a11111; margin-top:1px;magin-left:6px;"><b>'+j.bookingType+'</b></h5><div class="row"><p class="col-sm-12">Name:'+j.passengerName+'</p><p class="col-sm-12">Age:'+j.age+'</p><p class="col-sm-12">Offer:'+offer+'</p><p class=col-sm-12"">Price:'+j.rate+'</p><p class="col-sm-12">Date:'+j.creation_date+'</p></div></div></div></div>');
		      		  
		          });
		   },
		 error: function(e){          	   
			  console.log(e)
			   
			  }
		});
		
	 
});




function alertMsg(msg){
	
	 toastr.success(msg);
}

function errorToast(msg){

toastr.error(msg);
}

</script>
</body>
</html>
  
  
  