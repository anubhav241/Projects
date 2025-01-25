<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Message</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Custom CSS -->
<style>
body {
	background: linear-gradient(135deg, #ff7eb3, #ff758c, #ff6a67);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 0;
	font-family: 'Roboto', sans-serif;
	color: white;
}

.message-container {
	background-color: rgba(0, 0, 0, 0.8);
	border-radius: 15px;
	padding: 30px 40px;
	text-align: center;
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
	animation: fadeIn 0.8s ease-in-out;
}

.message-title {
	font-size: 2rem;
	font-weight: bold;
}

.message-text {
	font-size: 1.2rem;
	margin: 10px 0 20px;
}

.btn {
	background: linear-gradient(90deg, #ff758c, #ff6a67);
	border: none;
	padding: 10px 20px;
	color: white;
	font-weight: bold;
	text-transform: uppercase;
	border-radius: 5px;
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.btn:hover {
	transform: translateY(-2px);
	box-shadow: 0 4px 10px rgba(255, 255, 255, 0.3);
}

@
keyframes fadeIn { 0% {
	opacity: 0;
	transform: translateY(20px);
}
100
%
{
opacity
:
1;
transform
:
translateY(
0
);
}
}
</style>
</head>
<body>
	
	
	<div class="message-container">
		<h1 class="message-title"><%
        	String msg = (String)request.getAttribute("msg");
        	out.println(msg);
        %></h1>
		

		<a href="AdminLogin.html" class="btn">Back to Login</a>
	</div>
		<%@include file="home.html"%>


	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
