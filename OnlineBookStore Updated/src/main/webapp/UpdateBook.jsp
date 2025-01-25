<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="OnlineBookStore.AdminBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Book</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<!-- Custom CSS -->
<style>
body {
    background: linear-gradient(135deg, #ff7eb3, #ff758c, #ff6a67);
    height: 100vh;
    margin: 0;
    font-family: 'Roboto', sans-serif;
    color: white;
    position: relative;
}

.header {
    background-color: rgba(0, 0, 0, 0.8);
    color: white;
    padding: 15px 20px;
    font-size: 1.5rem;
    position: sticky;
    top: 0;
    z-index: 10;
    text-align: center;
}

.message-container {
    background: linear-gradient(135deg, #ff758c, #ff6a67, #ff7eb3);
    border-radius: 15px;
    padding: 20px 30px;
    text-align: center;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
    position: fixed;
    top: 80px; /* Adjusted to stay below the header */
    left: 50%;
    transform: translate(-50%, 0);
    animation: slideIn 0.8s ease-in-out, fadeOut 10s forwards;
    z-index: 100;
}

.message-title {
    font-size: 1.8rem;
    font-weight: bold;
    margin-bottom: 10px;
}

.message-text {
    font-size: 1.2rem;
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

@keyframes slideIn {
    0% {
        opacity: 0;
        transform: translate(-50%, -20px);
    }
    100% {
        opacity: 1;
        transform: translate(-50%, 0);
    }
}

@keyframes fadeOut {
    0%, 90% {
        opacity: 1;
    }
    100% {
        opacity: 0;
        transform: translate(-50%, -20px);
    }
}
</style>
</head>
<body>
   <!-- <div class="header">
        Add Book Page
    </div> --> 

    <% AdminBean ab = (AdminBean) session.getAttribute("abean"); %>
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null && !msg.isEmpty()) {
    %>
    <div class="message-container" id="popupMessage">
        <h1 class="message-title">Success!</h1>
        <p class="message-text">
            <%= msg %>
        </p>
    </div>
    <%
        }
    %>

    <!-- Including the form -->
    <%@ include file="ViewBook.jsp" %>

    <!-- Bootstrap JS -->
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Automatically remove the popup after 10 seconds
        setTimeout(() => {
            const popup = document.getElementById('popupMessage');
            if (popup) {
                popup.style.display = 'none';
            }
        }, 10000);
    </script>
</body>
</html>
