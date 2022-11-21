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

<body class="sub_page">
	<div class="hero_area"></div>
	<br>
	<div class="container">
		<div class="row">
			<div class="custom_heading-container ">
				<h2>New Password</h2>
			</div>
		</div>
	</div>
	<div class="col-md-5">
		<div class="form_contaier">
			<%
          if(request.getAttribute("msg")!=null)
          {
        	  out.print(request.getAttribute("msg"));
          }
          %>
			<form method="post" action="UserController">
				
				<input type="hidden" name="email" value="<%=request.getAttribute("email") %>">
				<div class="form-group">
					<label>New Password</label> <input type="password" class="form-control"
						id="new_password" name="new_password" placeholder="New_password">
				</div>
				<div class="form-group">
					<label>Confirm Password</label> <input type="password" class="form-control"
						id="cnew_password" name="cnew_password" placeholder="Confirm password">
				</div>
				<button type="submit" class="btn btn-primary" name="action"
					value="update Password">Login</button>
			</form>
		</div>

	</div>
	<br>

	<!-- info section -->
	<section class="info_section layout_padding2">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="info_contact">
						<h4>Contact</h4>
						<div class="box">
							<div class="img-box">
								<img src="images/telephone-symbol-button.png" alt="">
							</div>
							<div class="detail-box">
								<h6>+01 123567894</h6>
							</div>
						</div>
						<div class="box">
							<div class="img-box">
								<img src="images/email.png" alt="">
							</div>
							<div class="detail-box">
								<h6>demo@gmail</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="info_menu">
						<h4>Menu</h4>
						<ul class="navbar-nav  ">
							<li class="nav-item active"><a class="nav-link"
								href="index.jsp">Home <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item"><a class="nav-link" href="about.jsp">
									About </a></li>
							<li class="nav-item"><a class="nav-link" href="medicine.jsp">
									Medicine </a></li>
							<li class="nav-item"><a class="nav-link" href="buy.jsp">
									Online Buy </a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6">
					<div class="info_news">
						<h4>newsletter</h4>
						<form action="">
							<input type="text" placeholder="Enter Your email">
							<div
								class="d-flex justify-content-center justify-content-md-end mt-3">
								<button>Subscribe</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!-- end info section -->

	<!-- footer section -->
	<section class="container-fluid footer_section">
		<p>
			&copy; 2019 All Rights Reserved. Design by <a
				href="https://html.design/">Free Html Templates</a>
		</p>
	</section>
	<!-- footer section -->

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