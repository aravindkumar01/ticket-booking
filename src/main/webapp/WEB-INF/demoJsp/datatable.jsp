<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Tasty Buds</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

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
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Menu </h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Menu List</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
       <div class="container-fluid">
		      <div class="row">
		        <div class="col-12">
		          
		          <div class="card">
		            <!-- <div class="card-header">
		              <h3 class="card-title"></h3>
		            </div> -->
		            <!-- /.card-header -->
		            <div class="card-body">
		            <div class="row">
		            	<div class="col-sm-10"></div>
		            	<div class="col-sm-2">
		            	   <a href="/addMenu" class="btn btn-primary">Add Menu&nbsp;&nbsp;&nbsp;<i class="fa fa-plus-circle  nav-icon"></i></a>
		            	</div>
		            </div>
		              <table id="example1" class="table table-bordered table-striped">
		                <thead>
		                <tr>
		                  <th>Id</th>
		                  <th>Title</th>                  
		                  <th>Description</th>		                  
						  <th>Edit</th>
						  <th>Delete</th>
		                </tr>
		                </thead>
		                <tbody id="employee-table">
		                      
		                </tbody>
		                 
		                <tfoot>
		                <tr>
		                  <th>Id</th>
		                  <th>Title</th>                  
		                  <th>Description</th>		                  
						  <th>Edit</th>
						  <th>Delete</th>
		                </tr>
		                </tfoot>
		              </table>
		            </div>
		            <!-- /.card-body -->
		          </div>
		          <!-- /.card -->
		        </div>
		        <!-- /.col -->
		      </div>
      </div>
      <!-- /.row -->
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

<script src="/plugins/datatables/jquery.dataTables.js"></script>
<script src="/plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>

<script>
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
	  $.ajax({
	      type: "GET",	     
	      url: "/login/menu",	    
	      success :function(result) {
	    	  console.log(result);
	    	  $(".nav-bar").append(result);
	    	
	     },
       error: function(e){          	   
    	  console.log(e)
    	   
    	   	        }
	  });
	  
	  
		//alert("ddd");
	    var t = $('#example1').DataTable();
	     //alert("dd");

		  $.ajax({
		      type: "GET",
		      contentType : 'application/json; charset=utf-8',
		      dataType : 'json',
		      url: "/menu/all",
		      //data: JSON.stringify(employee),
		      success :function(result) {
		            console.log(result);
		    	  $.each(result,function( i,j ) {
		    		  
		    		  t.row.add( [
		    			  j.id,j.title,j.description,'<i class="fas fa-edit" style="cursor:pointer;"></i>','<i class="fas fa-trash-alt" style="cursor:pointer;">'
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
  
  
  