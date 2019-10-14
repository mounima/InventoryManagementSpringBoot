<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    


<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sales Tracking</title>

<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<style>
body {background-color: #fffdd0;}
h3 {
  text-align: left;
}
.price-range-block {
    margin:60px;
}

.sliderText{
    width:40%;
    margin-bottom:30px;
    border-bottom: 2px solid red;
    padding: 10px 0 10px 0px;
    font-weight:bold;
}

.ui-slider-horizontal {
    height: .6em;
}
.ui-slider-horizontal {
    margin-bottom: 15px;
    width:40%;
}
.ui-widget-header {
    background: #3FE331;
}

.price-range-search {
    width:40.5%; 
    background-color: #f9f9f9; 
    border: 1px solid #6e6666;
    min-width: 40%;
    display: inline-block;
    height: 32px;
    border-radius: 5px;
    float: left;
    margin-bottom:20px;
    font-size:16px;
}
.price-range-field{
    width:20%; 
    min-width: 16%;
    background-color:#f9f9f9; 
    border: 1px solid #6e6666; 
    color: black; 
    font-family: myFont; 
    font: normal 14px Arial, Helvetica, sans-serif; 
    border-radius: 5px; 
    height:26px; 
    padding:5px;
}
.search-results-block{
    position: relative;
    display: block;
    clear: both;
}


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
	    td = tr[i].getElementsByTagName("td")[1];
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
			<input type="text" id="myInput" onkeyup="myFunction()"
				placeholder="Search for product names.." size="35" height="50">
		</center>
	</div>
	<!-- 
      <p>
         <label for = "price">Price range:</label>
         <input type = "text" id = "price" 
            style = "border:0; color:#b9cd6d; font-weight:bold;">
      </p>
      <div id = "slider-3"></div>
     -->
      <form action="${contextPath}/pricesearch">
      
     <h3>Price Range Search:</h3>
      <br>
      <input type="number" min=0 max="9900" oninput="validity.valid||(value='0');" id="min_price" name="min_price" class="price-range-field" />
<input type="number" min=0 max="10000" oninput="validity.valid||(value='10000');" id="max_price" name="max_price" class="price-range-field" />
<br>
<br>
<button class="price-range-search" style="height:30px; width:30px; background-color:green; font-size:20px" id="price-range-submit">Search</button>
	</form>
	<br>
	<br>
	 <form action="${contextPath}/datesearch">
	 <h3>Order Date Range Search:</h3>
      <br>
      <input type="date" id="min_date" name="min_date" class="price-range-field" />
<input type="date" id="max_date" name="max_date" class="price-range-field" />
<br>
<br>
<button class="price-range-search" style="height:30px; width:30px; background-color:green; font-size:20px" id="price-range-submit">Search</button>
	</form>
	<br>
	<br>
	<br>
	<div id="searchResults" class="search-results-block">
	<table border='4px' class="table table-striped" id="myTable">
		<thead>
			<tr>

				<th>Invoice Number</th>
				<th>Product Name</th>
				<th>Product Serial Number</th>
				<th>Quantity</th>
				<th>Item Price</th>
				<th>Total Price</th>
				<th>Order Date</th>

			</tr>
		</thead>

		<tbody>

			<c:forEach var="cart" items="${cart}">
				<c:forEach items="${cart.cartlineitemslist}" var="cl">
					<tr>
						<td>${cart.invoice.code}</td>
						<td>${cl.product.productname}</td>
						<td>${cl.product.productserialnumber}</td>
						<td>${cl.quantitysold}</td>
						<td>${cl.itemprice}</td>
						<td>${cart.totalAmount}</td>
						<td>${cart.orderdate}</td>
					</tr>
				</c:forEach>

			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>