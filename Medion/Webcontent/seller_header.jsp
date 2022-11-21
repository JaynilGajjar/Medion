<%@page import="com.bean.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	User u=null;
		if(session!=null)
		{
			if(session.getAttribute("u")!=null)
			{
				u=(User)session.getAttribute("u");
			}
		}
%>
	<div class="hero_area">
		<!-- header section strats -->
		<header class="header_section">
			<div class="container">
				<div class="top_contact-container">
					<div class="tel_container">
						<a href="">Hello ,
						</a>
					</div>
					<div class="social-container">
						<a href=""> <img src="images/fb.png" alt="" class="s-1">
						</a> <a href=""> <img src="images/twitter.png" alt="" class="s-2">
						</a> <a href=""> <img src="images/instagram.png" alt=""
							class="s-3">
						</a>
					</div>
				</div>
			</div>
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container pt-3">
					<a class="navbar-brand" href="seller_index.jsp"> <img
						src="images/logo.png" alt=""> <span> Medion </span>
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<div
							class="d-flex  flex-column flex-lg-row align-items-center w-100 justify-content-between">
							<ul class="navbar-nav  ">
								<li class="nav-item active"><a class="nav-link"
									href="seller_index.jsp">Home <span class="sr-only">(current)</span></a>
								</li>
								<li class="nav-item"><a class="nav-link" href="seller_index.jsp">
										About </a></li>
								<li class="nav-item"><a class="nav-link"
									href="seller_view_product.jsp">View Medicines </a></li>

								<li class="nav-item"><a class="nav-link"
									href="seller_add_product.jsp">Add Product</a></li>


							</ul>
							<form class="form-inline ">
								<input type="search" placeholder="Search">
								<button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
							</form>
							<%
								if(u==null)
								{
								%>
							<div class="login_btn-contanier ml-0 ml-lg-3">
								<a href=""> <img src="images/user.png" alt=""> <span>
										<a class="nav-link" href="login.jsp">Login</a>
								</span> <%
								} 
								else
								{
								%>
									<div class="login_btn-contanier ml-0 ml-lg-3">

										<a class="nav-link" href="logout.jsp">Logout(<%=u.getFname() %>)
										</a> <a class="nav-link" href="seller_change_password.jsp">Change
											Password</a>

										<% 
								}
								%>
										</span></a>
							</div>
						</div>
					</div>

				</nav>
			</div>
		</header>