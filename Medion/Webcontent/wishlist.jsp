<%@page import="org.eclipse.jdt.internal.compiler.ast.WhileStatement"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp"%>
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
	List<Wishlist> list=WishlistDao.getWishlistByUser(u.getId());
%>
	<!-- health section -->

	<section class="health_section layout_padding">
		<div class="health_carousel-container">
			<%
				if(list.size()>0){ 
			%>
			<h2 class="text-uppercase">My Whislist</h2>
			<div class="layout_padding2">
				<div class="owl-carouse">
				<%for (Wishlist w:list)
				{
					Product p=ProductDao.getProductpid(w.getPid());
				%>
					<div class="item">
						<div class="box">
							<div class="btn_container">
								<a href="remove_from_wishlist.jsp?pid=<%=p.getId()%>"> Remove From Wishlist</a>
								<a href="product_details.jsp?pid=<%=p.getId()%>"> View Details</a>
							</div>
							<div class="img-box">
								<img src="product_images/<%=p.getProduct_image()%>" alt="" style=width:200px;>
							</div>
							<div class="detail-box">
								 <div class="text">
									<h6><%=p.getProduct_name() %></h6>
									
									<h6 class="price">
										<span>$</span><%=p.getProduct_price() %>
									</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%} %>
			</div>
			<%}else{ %>
			<h4>No Products In Wishlist</h4>
			<%} %>
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