<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="seller_header.jsp"%>
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
	Product p=ProductDao.getProductpid(Integer.parseInt(request.getParameter("pid")));
%>
	<!-- health section -->

	<section class="health_section layout_padding">
		<div class="health_carousel-container">
			<h2 class="text-uppercase">View Products</h2>
			<div class="layout_padding2">
				<div class="owl-carouse">
				
					<div class="item">
						<div class="box">
							<div class="btn_container">
								<a href="seller_product_edit.jsp?pid=<%=p.getId()%>"> Edit</a>
								<a href="seller_product_delete.jsp?pid=<%=p.getId()%>"> Delete</a>
							</div>
							<div class="img-box">
								<img src="product_images/<%=p.getProduct_image()%>" alt="" style=width:200px;>
							</div>
							<div class="detail-bo">
								 <div class="text">
									<h5><%=p.getProduct_name() %></h5>
									<h6><%=p.getProduct_desc() %></h6>
									
									<h3 class="price">
										<span>$</span><%=p.getProduct_price() %>
									</h3>
								</div>
							</div>
						</div>
					</div>

				</div>
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