<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Invoice</title>
   <link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
   
    <style>
        @media print {
            @page{
                size: A3;
            }
        }
        ul{
            padding: 0;
            list-style: none;
            border-bottom: 1px solid silver;
        }
        body{
            font-family: "Palatino Linotype", "Book Antiqua", Palatino, serif;
            margin: 0;
        }
        .container{
            padding: 20px 40px;
        }
        .inv-header{
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .inv-header :nth-child(2){
            flex-basis: 30%;
        }
        .inv-title{
            padding: 10px;
            border: 1px solid silver;
            text-align: center;
            margin-bottom: 20px;
        }
        .no-margin{
            margin: 0;
        }
        .inv-logo{
            width: 150px;
        }
        .inv-header h2{
            font-size: 20px;
            margin: 1rem 0 0 0;
        }
        .inv-header ul li{
            font-size: 15px;
            padding: 3px 0;
        }
        
        /* table in head */
        .inv-header table{
            width: 100%;
            border-collapse: collapse;
        }
        .inv-header table th, .inv-header table td, .inv-header table{
            border: 1px solid silver;
        }
        .inv-header table th, .inv-header table td{
            text-align: right;
            padding: 8px;
        }
        /* Body */
        .inv-body{
            margin-bottom: 20px;
        }
        .inv-body table{
            width: 100%;
            border: 1px solid silver;
            border-collapse: collapse;
        }
        .inv-body table th, .inv-body table td{
            padding: 10px;
            border: 1px solid silver;
        }
        .inv-body table td h5, .inv-body table td p{
            margin: 0 5px 0 0;
        }
        /* Footer */
        .inv-footer{
            clear: both;
            overflow: auto;
        }
        .inv-footer table{
            width: 30%;
            float: right;
            border: 1px solid silver;
            border-collapse: collapse;
        }
        .inv-footer table th, .inv-footer table td{
            padding: 8px;
            text-align: right;
            border: 1px solid silver;
        }
    </style>
  
</head>
<body>

    <div class="container">
        <div class="inv-title">
            <h1 class="no-margin">Invoice # ${invcode}</h1>
        </div>
        <div class="inv-header">
            <div>
                <image src="images/inventorymgmt.png" alt="Logo" style="width:30%"></image>
                <h2>Mouni Inventory Private Limited</h2>
                <ul>
                    <li>Manikonda MN -235</li>
                    <li>India</li>
                    <li>949-000-0568 | mounima@gmail.com</li>
                </ul>
                 <h2>Customer Details:</h2>
                 <h2>${c.customername}</h2>
                <ul>
                    <li>${c.customeraddress} , ${c.customerstreet}</li>
                     <li>${c.customercity}</li>
                    <li>${c.customerpincode}</li>
                </ul>
               
            </div>
            <div>
                <table>
                    <tr>
                    
                        <th>Issue Date Time</th>
                        <td><p id="datetime"></p></td>
                    </tr>
                
                </table>
            </div>
        </div>
        <div id='container'>
		<h1 align="center" style="color:blue;">Products Sold</h2>
		<br>
		<br>
		<table border='4px' class="table table-striped" id="myTable">
		<thead>
			<tr>

				<th>Product Name</th>
				<th>Product Serial Number</th>
				<th>Price Per Unit</th>
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
        <div class="inv-footer">
            <table>
                <tr>
                    <th>Sub total</th>
                    <td>${ta}</td>
                </tr>
            
            </table>
        </div>
    </div>
      <script>
    var d = new Date();
    document.getElementById("datetime").innerHTML = d;
    </script>
</body>
</html>
