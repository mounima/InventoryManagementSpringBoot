<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>Add Inbound Inventory</title>
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

<div class="container">
<br>
<h1 class="text-center text-danger">Inbound Inventory Form</h1>
<br>
<br>
<form:form method="POST" action="${contextPath}/savep" modelAttribute="PostForm">
             <table align="center">       
         <tr>    
          <td><form:label path = "productname">Product Name</form:label><br><br></td>   
          <td><form:input path="productname" /><br><br></td>  
         </tr> 
         <tr>    
          <td><form:label path = "productserialnumber">Product Serial Number</form:label><br><br></td>        
          <td><form:input path="productserialnumber" /><br><br></td>  
         </tr> 
          <tr>    
          <td><form:label path = "Quantitesreceived">Quantities Received</form:label><br><br></td>        
          <td><form:input path="Quantitesreceived" /><br><br></td>  
         </tr>
         <tr>    
          <td><form:label path = "priceperunit">Price per Unit</form:label><br><br></td>        
          <td><form:input path="priceperunit" /><br><br></td>  
         </tr> 
         <tr>    
          <td><form:label path = "vendorname">Vendor Name</form:label><br><br></td>        
          <td><form:input path="vendorname" /><br><br></td>  
         </tr>  
         <tr>    
         <td colspan="2"><center><br><input type="submit" style="height:40px; width:150px; background-color:blue; font-size:20px" value="Save" /><center><br><br></td>          </tr>    
        </table>    
        </form:form>
</div>

		<%-- <form:form action="${contextPath}/savep" method="post" modelAttribute="PostForm" onsubmit="this.form.submit();" >
		
                  
				<h1>PRODUCT</h1>
			     

			<table>

				<tr>
					<td><input type="hidden" value="${product.productid}"
						name="productid"></td>
				</tr>
				<tr>
					<th>Product Name</th>
					<td><input type="text" class="form-control" value="${product.productname}"
						name="productname"></td>
				</tr>
				<tr>
					<th>Product Serial Number</th>
					<td><input type="text"class="form-control" value="${product.productserialnumber}"
						name="productserialnumber"></td>
				</tr>
				<tr>
					<th>Quantities Received</th>
					<td><input type="number" class="form-control" value="${product.Quantitesreceived}"
						name="Quantitesreceived"></td>
				</tr>
				<tr>
					<th>Price Per Unit</th>
					<td><input type="number" class="form-control" value="${product.priceperunit}"
						name="priceperunit"></td>
				</tr>
				<tr>
					<th>Vendor Name</th>
					<td><input type="text"class="form-control" value="${product.vendername}"
						name="vendername"></td>
				</tr>
				<tr>
				<tr>


					<td><input type="submit"class="btn btn-primary"  value="submit"></td>

				</tr>

			</table>
			</form>
			</div>
 --%>

	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>