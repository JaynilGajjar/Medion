<%@page import="java.util.Random"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.WhileStatement"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp"%>
	
 <%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>
<!DOCTYPE html>
<html>

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Medion</title>

<!-- slider stylesheet -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

<!-- font awesome style -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,600,700|Roboto:400,700&display=swap"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
</head>

<body>
<%
	List<Cart> list=CartDao.getCartByUser(u.getId());
%>
	<!-- health section -->

	<section class="health_section layout_padding">
		<div class="health_carousel-container">
			<%
				int net_price=0;
				if(list.size()>0){ 
			%>
			<h2 class="text-uppercase">My Cart</h2>
			<div class="layout_padding2">
				<div class="owl-carouse">
				<%
					for (Cart c:list)
				{
					net_price=net_price+c.getTotal_price();
					Product p=ProductDao.getProductpid(c.getPid());
				%>
					<div class="item">
						<div class="box">
							<div class="btn_container">
								
								<a href="product_details.jsp?pid=<%=p.getId()%>"> View Details</a>
							</div>
							<div class="img-box">
								<img src="product_images/<%=p.getProduct_image()%>" alt="" style="width:150px;">
							</div>
							<div class="detail-box">
								 <div class="text">
									<h6><%=p.getProduct_name() %></h6>
									<h6 class="price">
										<span>$</span><%=p.getProduct_price() %>
									</h6>
								</div>
								</div>
								<div class="text">
								<form name="change_qty" method="post" action="change_qty.jsp">
								<input type="hidden" name="cid"  value="<%=c.getCid()%>">
								<h6>Product Quantity : <input type="number" min="1" max="10" name="product_qty" value="<%=c.getProduct_qty()%>" onchange="this.form.submit();"></h6>
								</form>
								<h6>Product Price : <%=c.getProduct_price() %></h6>
								<h6>Total Price : <%=c.getTotal_price() %></h6>
								
								</div>
						</div>
					</div>
				</div>
				<%} %>
				
			</div>
			<%}else{ %>
			<h4>No Products In Cart</h4>
			<%} %>
			<div class="text">
			<% 
			if(list.size()>0){
			%>
				<form method="post" action="pgRedirect.jsp">
		<table border="1">
			<tbody>
				<tr>
					<th>S.No</th>
					<th>Label</th>
					<th>Value</th>
				</tr>
				<tr>
					<td>1</td>
					<td><label>ORDER_ID::*</label></td>
					<td><input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
						name="ORDER_ID" autocomplete="off"
						value="ORDS_<%= randomInt %>">
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td><label>CUSTID ::*</label></td>
					<td><input id="CUST_ID" tabindex="2" maxlength="30" size="12" name="CUST_ID" autocomplete="off" value="CUST001"></td>
				</tr>
				<tr>
					<td>3</td>
					<td><label>INDUSTRY_TYPE_ID ::*</label></td>
					<td><input id="INDUSTRY_TYPE_ID" tabindex="4" maxlength="12" size="12" name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail"></td>
				</tr>
				<tr>
					<td>4</td>
					<td><label>Channel ::*</label></td>
					<td><input id="CHANNEL_ID" tabindex="4" maxlength="12"
						size="12" name="CHANNEL_ID" autocomplete="off" value="WEB">
					</td>
				</tr>
				<tr>
					<td>5</td>
					<td><label>txnAmount*</label></td>
					<td><input title="TXN_AMOUNT" tabindex="10"
						type="text" name="TXN_AMOUNT"
						value="<%=net_price%>">
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input value="CheckOut" type="submit"	onclick=""></td>
				</tr>
			</tbody>
		</table>
		* - Mandatory Fields
	</form>
		<%} %>
				</div>
		</div>
	</section>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.2.1/owl.carousel.min.js">
  </script>
	<script type="text/javascript">
    $(".owl-carousel").owlCarousel({
      loop: true,
      margin: 10,
      nav: true,
      navText: [],
      autoplay: true,
      responsive: {
        0: {
          items: 1
        },
        600: {
          items: 2
        },
        1000: {
          items: 4
        }
      }
    });
  </script>
	<script type="text/javascript">
    $(".owl-2").owlCarousel({
      loop: true,
      margin: 10,
      nav: true,
      navText: [],
      autoplay: true,

      responsive: {
        0: {
          items: 1
        },
        600: {
          items: 2
        },
        1000: {
          items: 4
        }
      }
    });
  </script>
</body>

</html>