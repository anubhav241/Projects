<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "OnlineBookStore.*, java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Books</title>
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
    max-width: 1000px;
    animation: fadeIn 1s ease-in-out;
}

.table-container {
    margin-top: 20px;
}

.table {
    color: white;
    background: rgba(0, 0, 0, 0.5);
    border-radius: 10px;
    border-collapse: separate;
    overflow: hidden;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.5);
    animation: fadeInTable 1s ease-in-out;
}

.table th {
    background: linear-gradient(to right, #0056b3, #0078d4);
    font-weight: bold;
    text-align: center;
    color: white;
    padding: 15px;
}

.table td {
    text-align: center;
    padding: 12px;
    transition: background 0.3s ease-in-out;
}

.table tr {
    transition: transform 0.3s ease-in-out;
}

.table tr:hover {
    background: rgba(255, 255, 255, 0.1);
    transform: scale(1.02);
    cursor: pointer;
}

.action-icons a {
    font-size: 1.2rem;
    margin: 0 10px;
    color: #ffd700;
    transition: color 0.3s ease, transform 0.3s ease;
}

.action-icons a:hover {
    color: white;
    transform: scale(1.2);
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

@keyframes fadeInTable {
    0% {
        opacity: 0;
        transform: scale(0.9);
    }
    100% {
        opacity: 1;
        transform: scale(1);
    }
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

.navbar-nav .nav-item a {
    color: #ffffff;
    text-decoration: none;
}

.navbar-nav .nav-item a:hover {
    color: #ffd700;
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

<!-- Table Section -->
<div class="container" style="margin-top: 80px;">
    <h3 class="text-center"><i class="bi bi-card-list"></i> Available Books</h3>
    <div class="table-container">
        <% 
        ArrayList<BookBean> al = (ArrayList<BookBean>) session.getAttribute("alist");
        if (al == null || al.size() == 0) { 
        %>
        <p class="text-center">No books available...</p>
        <% } else { %>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th>Code</th>
                    <th>Name</th>
                    <th>Author</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                for (BookBean bb : al) { 
                %>
                <tr>
                    <td><%= bb.getCode() %></td>
                    <td><%= bb.getName() %></td>
                    <td><%= bb.getAuthor() %></td>
                    <td><%= bb.getPrice() %></td>
                    <td><%= bb.getQty() %></td>
                    <td class="action-icons">
                        <a href="edit?bcode=<%= bb.getCode() %>" title="Edit"><i class="bi bi-pencil-square"></i></a>
                        <a href="delet?bcode=<%= bb.getCode() %>" title="Delete"><i class="bi bi-trash-fill"></i></a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
    </div>
</div>

<!-- Bootstrap JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
