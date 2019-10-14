<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="plist" value="${plist}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Generate Invoice</title>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<style>
form {
  text-align: center;
}
.ui-autocomplete-loading {
	background: white url("images/ui-anim_basic_16x16.gif") right center
		no-repeat;
}

body {
	background-color: #fffdd0;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
		$(function() {
			$("#Product_Name").autocomplete({
				source: "productNamesAutocomplete", 
				minLength: 2,
				select: function(event, ui) {
					this.value = ui.item.label;
					$("#productname").val(ui.item.value);
					return false;
				}
			});
		});
		
		function calculateItemPrice() {
			  
		         var punit = parseInt(document.getElementById('priceperunit').value);
		         var qsold = parseInt(document.getElementById('quantitysold').value);
		        // window.print(${p});
		        var itemprice = punit*qsold;
		        document.getElementById('ip').value=itemprice;
		       


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

	
	<form:form action="${contextPath}/go" method="GET">
	<h3>Search Product</h3>
	<input type="text" id="Product_Name" name="Product_Name" placeholder="Search for product names.." >&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" onclick="location.href='${contextPath}/go'" style="height:30px; width:75px; background-color:red; font-size:20px">Go</button>
	</form:form>
	<br>
	<br>
	
	<div class="container">

		<form:form method="POST" action="${contextPath}/addproduct"
			modelAttribute="PostForm">

			<table align="center">

				<tr>
					<td><form:label path="product.productserialnumber">Product Serial Number</form:label><br>
					<br></td>
					<td><form:input path="product.productserialnumber" id="serialnumber"
							value="${p.productserialnumber}" readonly="true" /><br>
					<br></td>
				</tr>
				<tr>
					<td><form:label path="product.productname">Product Name</form:label><br>
					<br></td>
					<td><form:input path="product.productname" id="productname"
							name="productname" readonly="true" /><br>
					<br></td>
				</tr>
				<tr>
					<td><form:label path="product.priceperunit">Price per Unit</form:label><br>
					<br></td>
					<td><form:input path="product.priceperunit" id="priceperunit" name="priceperunit"
							readonly="true" /><br>
					<br></td>
				</tr>
				<tr>
					<td><form:hidden path="product.productid" id="productid" name="productid"
							readonly="true" />
					</td>
				</tr>
				<tr>
					<td><form:hidden path="product.quantitesreceived" id="quantitesreceived" name="quantitesreceived"
							readonly="true" />
					</td>
				</tr>
				<tr>
					<td><form:hidden path="product.vendorname" id="vendorname" name="vendorname"
							readonly="true" />
					</td>
				</tr>
				<tr>
					<td><form:hidden path="product.quantityavailable" id="quantityavailable" name="quantityavailable"
							readonly="true" />
					</td>
				</tr>
				<tr>
					<td><form:label path="quantitysold">Quantities Sold</form:label><br>
					<br></td>
					<td><form:input path="quantitysold" id="quantitysold" name="quantitysold" onchange="calculateItemPrice()"/><br>
					<br></td>
				</tr>
				<tr>
					<td><form:label path="itemprice">Item Price</form:label><br>
					<br></td>
					<td><form:input path="itemprice"  readonly="true" id="ip" name="ip" /><br>
					<br></td>
				</tr>
                      
				<tr>
				<td></td>
				
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit" onclick="location.href='${contextPath}/addproduct'"
						style="height: 30px; width: 175px; background-color: red; font-size: 20px"
						value="Add Product" >Add Product</button></td>
						
				</tr>
				<!-- onclick="location.href='${contextPath}/saveo'" -->
			</table>
			<br>
			<br>
			<br>
<%
    session.getAttribute("cid");
        %>
		</form:form>
		
		<form:form method="POST" action="${contextPath}/dff"
			modelAttribute="PostTableForm">
		<table class="table" border='4px'>
			<thead>
				<tr>

					<th>Product Name</th>
					<th>Product serial number</th>
					<th>Price</th>
					<th>Quantities Sold</th>
					<th>Item Price</th>

				</tr>
			</thead>
 
			<tbody>

				<c:forEach var="clist" items="${clistitems}">
					<tr>
					
						<td>${clist.product.productname}</td>
						<td>${clist.product.productserialnumber}</td>
						<td>${clist.product.priceperunit}</td>
						<td>${clist.quantitysold}</td>
						<td>${clist.itemprice}</td>
					</tr>
					</c:forEach>
			</tbody>
		</table>
		
		
		
		
		</form:form>
        <div align="center">
		<form:form method="POST" action="${contextPath}/generateinvoice"
			modelAttribute="PostTotAmountForm">
					<strong>Total Amount: </strong><input type="text" id="Total_Amount" name="Total_Amount" value="${ta}" readonly><br><br><br>
					<button type="submit" onclick="location.href='${contextPath}/invoice'" style="height:30px; width:175px; background-color:green; color: white; font-size:20px "value=${invcode}>Generate Invoice</button>
					
		</form:form>
		</div>
		
	</div>
</body>
</html>