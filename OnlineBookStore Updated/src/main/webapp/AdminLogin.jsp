<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="OnlineBookStore.AdminBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Custom CSS -->
<style>
body {
    background: linear-gradient(to right, #0b1a3c 80%, #8b0000 20%);
    color: white;
    font-family: 'Roboto', sans-serif;
    height: 100vh;
    margin: 0;
    padding: 0;
}

.dashboard-card {
    background-color: rgba(0, 0, 0, 0.7);
    border: none;
    border-radius: 15px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    color: #ffffff;
}

.dashboard-card:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
}

.card-title {
    font-size: 1.5rem;
    font-weight: bold;
    text-align: center;
}

.menu-icon {
    font-size: 2.5rem;
    text-align: center;
    margin-bottom: 10px;
}

.dashboard-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.navbar {
    background-color: rgba(0, 0, 0, 0.7);
}

.navbar-brand {
    font-size: 1.8rem;
    color: #ffffff !important;
    font-weight: bold;
}

.menu-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    padding: 20px;
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

.dashboard-card {
    animation: fadeIn 0.8s ease-in-out;
}

/* Custom link styles */
a {
    color: white; /* Set link color to white */
    text-decoration: none; /* Remove underline */
    font-weight: bold;
}

a:hover {
    color: #ffd700; /* Change color to gold on hover */
}
</style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
        </div>
    </nav>

    <!-- Welcome message -->
    <%
    AdminBean ab = (AdminBean) session.getAttribute("abean");
    %>
    <h2
        style="color: #fff; font-family: Arial, sans-serif; text-align: center; margin-top: 20px;">
        Welcome Admin: <span style="font-weight: bold; color: #ffd700;"><%=ab.getfName()%></span>
    </h2>

    <!-- Dashboard -->
    <div class="dashboard-container">
        <div class="menu-container container">
            <!-- Add Book -->
            <div class="dashboard-card card text-center p-4">
                <div class="menu-icon">
                    <i class="bi bi-plus-circle"></i>
                </div>
                <div class="card-title"><a href="AddBook.html">Add Book</a></div>
            </div>
            <!-- View Book -->
            <div class="dashboard-card card text-center p-4">
                <div class="menu-icon">
                    <i class="bi bi-book"></i>
                </div>
                <div class="card-title"><a href="view">View Book</a></div>
            </div>
            <!-- Logout -->
            <div class="dashboard-card card text-center p-4">
                <div class="menu-icon">
                    <i class="bi bi-box-arrow-right"></i>
                </div>
                <div class="card-title"><a href="logout">LogOut</a></div>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Bootstrap Icons -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
        rel="stylesheet">
</body>
</html>
