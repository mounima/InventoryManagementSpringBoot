<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Create an account</title>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
body {background-color: #fffdd0;}
</style>
<script>
function myFunction() {
	  // Declare variables 
	  var input, filter, table, tr, td, i, txtValue;
	  input = document.getElementById("myInput");
	  filter = input.value.toUpperCase();
	  table = document.getElementById("myTable");
	  tr = table.getElementsByTagName("tr");

	  // Loop through all table rows, and hide those who don't match the search query
	  for (i = 0; i < tr.length; i++) {
	    td = tr[i].getElementsByTagName("td")[0];
	    if (td) {
	      txtValue = td.textContent || td.innerText;
	      if (txtValue.toUpperCase().indexOf(filter) > -1) {
	        tr[i].style.display = "";
	      } else {
	        tr[i].style.display = "none";
	      }
	    } 
	  }
	}

</script>

</head>
<body>
        <nav class="navbar navbar-inverse" style="background-color: #3c8000">

<div class="container-fluid">




<div class="navbar-header">
<a><image src="images/inventorymgmt.png" alt="Logo" style="width:30%"></image></a>

</div>

<ul class="nav navbar-nav navbar-right">
<br>
<br>
<br>
<button type="button" class="btn btn-primary-md">
<a href="${contextPath}/welcome">HOME</a>
</button>
<button type="button" class="btn btn-primary-md">
<a href="${contextPath}/p">PRODUCT</a>
</button>

<button type="button" class="btn btn-primary-md">
					<a href="${contextPath}/productslist">INBOUND PRODUCTLIST 
				</button>
				</a>

				<button type="button" class="btn btn-primary-md"><a href="${contextPath}/productsinvlist">INVENTORY TRACKING</button></a>
				<button type="button" class="btn btn-primary-md"><a href="${contextPath}/saleslist">SALES TRACKING</button></a>
</ul>
<br> <br>
</div>
</nav>

	<style>
table {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
}

table#t01 tr:nth-child(even) {
	background-color: #eee;
}

table#t01 tr:nth-child(odd) {
	background-color: #fff;
}

table#t01 th {
	background-color: black;
	color: white;
}
</style>

<div class="form-group">
<center>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for product names.." size="35" height="50">
</center>
</div>
<br>
<br>
<!-- 
<table id="t02"  cellpadding="1">
<tr>

<th>
<a  align ="right" href="/delete"><h3>Delete All Products</h3></a>

</th>
</tr>
</table>
-->
<br>
	<table border='4px' class="table table-striped" id="myTable">
		<thead>
			<tr>

				<th>Product Name</th>
				<th>Product Serial Number</th>
				<th>Quantities Received</th>
				<th>Price per unit</th>
				<th>Vendor Name</th>
				<th>Edit</th>
				<!-- <th>Delete</th></tr> -->

			</tr>
		</thead>

		<tbody>

			<c:forEach var="p" items="${p}">
				<tr>
					<td>${p.productname}</td>
					<td>${p.productserialnumber}</td>
					<td>${p.quantitesreceived}</td>
					<td>${p.priceperunit}</td>
					<td>${p.vendorname}</td>
					<td><a href="${contextPath}/editproduct/${p.productid}">Edit</a></td>  
                 <!--    <td><a href="${contextPath}/deleteproduct/${p.productid}">Delete</a></td>  -->
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>