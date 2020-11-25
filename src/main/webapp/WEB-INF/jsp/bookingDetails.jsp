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
		              <table id="example1" class="table table-bordered table-striped">
		                <thead>
		                <tr>
		                  <th>Id</th>
		                  <th>Passengers</th>                  
		                  <th>Price</th>		                  
						  <th>Offer</th>
						  <th>BookingType</th>
						  <th>Date</th>
						  <th>Age</th>
						    <th>Count</th>
		                </tr>
		                </thead>
		                <tbody id="employee-table">
		                      
		                </tbody>
		                <tfoot>
		                <tr>
		                 <th>Id</th>
		                  <th>Passengers</th>                  
		                  <th>Price</th>		                  
						  <th>Offer</th>
						  <th>BookingType</th>
						  <th>Date</th>
						  <th>Age</th>
						    <th>Count</th>
		                </tr>
		                </tfoot>
		              </table>
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

<script src="${pageContext.request.contextPath}//plugins/datatables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}//plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script>

$(document).ready(function(){
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

});
$(function () {
    $("#example1").DataTable();
    $('#example2').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": false,
      "ordering": true,
      "info": true,
      "autoWidth": false,
    });
  });
$(document).ready(function(){
	
	//alert("ddd");
    var t = $('#example1').DataTable();
     //alert("dd");
	  $.ajax({
	      type: "GET",
	      contentType : 'application/json; charset=utf-8',
	      dataType : 'json',
	      url: "/ticket/booking/all",
	      //data: JSON.stringify(employee),
	      success :function(result) {
	            console.log(result);
	    	  $.each(result,function( i,j ) {
	    		  var offer=j.offer;
	    		  if(offer=="" || offer==null){
						offer="-";
		      	}
	    		  t.row.add( [
	    			  j.id,j.passengerName,j.rate,offer,j.bookingType,j.creation_date,j.age,j.count
	    		  ]).draw( false );
	    	  });
	     },
       error: function(e){          	   
    	  console.log(e)
    	   
    	  }
	  });
	
	
});

</script>
</body>
</html>
  
  
  