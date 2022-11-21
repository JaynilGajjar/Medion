<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	ProductDao.deleteProduct(Integer.parseInt(request.getParameter("pid")));
	request.setAttribute("msg","Product deleted successfully");
	request.getRequestDispatcher("seller_view_product.jsp").forward(request, response);
%>
</body>
</html>