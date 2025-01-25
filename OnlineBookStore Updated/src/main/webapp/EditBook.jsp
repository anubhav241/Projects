<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="OnlineBookStore.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Book</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<!-- Custom CSS -->
<style>
body {
    background: linear-gradient(to right, #0b1a3c 80%, #8b0000 20%);
    color: white;
    font-family: 'Roboto', sans-serif;
    height: 100vh;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.container {
    background-color: rgba(0, 0, 0, 0.7);
    border-radius: 15px;
    padding: 40px 30px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
    width: 100%;
    max-width: 600px;
    animation: fadeIn 1s ease-in-out;
}

input[type="text"] {
    background: rgba(255, 255, 255, 0.1);
    border: none;
    border-bottom: 2px solid #ffd700;
    color: white;
    width: 100%;
    padding: 8px;
    margin-bottom: 20px;
    font-size: 16px;
}

button, a.btn-common {
    font-weight: bold;
    padding: 10px 20px;
    border-radius: 5px;
    border: none;
    color: black;
    text-decoration: none;
    display: inline-block;
    background-color: #ffd700;
    transition: background 0.3s ease, color 0.3s ease;
}

button:hover, a.btn-common:hover {
    background-color: #ffffff;
    color: black;
}

.navbar {
    position: fixed;
    top: 0;
    width: 100%;
    background-color: rgba(0, 0, 0, 0.7);
    z-index: 1000;
}

.navbar-brand {
    font-size: 1.8rem;
    color: #ffffff !important;
    font-weight: bold;
}

.navbar-nav {
    margin-left: auto;
}

.navbar-nav .nav-item {
    margin-left: 20px;
}

.navbar-nav .nav-link {
    color: #ffffff;
    text-decoration: none;
    padding: 10px 15px;
    transition: background 0.3s ease, color 0.3s ease;
}

.navbar-nav .nav-link:hover {
    background-color: transparent;
    color: #ffd700;
}

@keyframes fadeIn {
    0% {
        opacity: 0;
        transform: translateY(20px);
    }
    100% {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="AdminLogin.jsp">Admin Dashboard</a>
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="AdminLogin.jsp" class="nav-link"><i class="bi bi-house-door-fill"></i> Home</a>
            </li>
            <li class="nav-item">
                <a href="view" class="nav-link"><i class="bi bi-book-fill"></i> View Book</a>
            </li>
            <li class="nav-item">
                <a href="AddBook.html" class="nav-link"><i class="bi bi-plus-circle"></i> Add Book</a>
            </li>
            <li class="nav-item">
                <a href="logout" class="nav-link"><i class="bi bi-box-arrow-right"></i> Logout</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link"><i class="bi bi-person-circle"></i> Profile</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Form Section -->
<div class="container" style="margin-top: 80px;">
    <h3 class="text-center"><i class="bi bi-pencil-square"></i> Edit Book</h3>
    <form action="update" method="post">
        <% 
        BookBean bb = (BookBean) request.getAttribute("bbean");
        if (bb != null) { 
        %>
        <input type="hidden" name="bcode" value="<%=bb.getCode()%>">
        <label for="bprice">Book Price:</label>
        <input type="text" id="bprice" name="bprice" value="<%=bb.getPrice()%>" required>

        <label for="bqty">Book Quantity:</label>
        <input type="text" id="bqty" name="bqty" value="<%=bb.getQty()%>" required>

        <div class="text-center">
            <button type="submit" class="btn-common">Update Book</button>
            <a href="view" class="btn-common">Back</a>
        </div>
        <% } else { %>
        <p class="text-center">No book details found...</p>
        <% } %>
    </form>
</div>

<!-- Bootstrap JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
