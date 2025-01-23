<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	import="OnlineBookStore.AdminBean"    
%>
<%
AdminBean ab = (AdminBean) session.getAttribute("abean");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - <% ab.getfName(); %></title>
    <style>
    * {
	    margin: 0;
	    padding: 0;
	    box-sizing: border-box;
	    font-family: 'Arial', sans-serif;
	}

	body, html {
	    width: 100%;
	    height: 100%;
	}
	
	header {
	    width: 100%;
	    background: #333;
	    padding: 10px 20px;
	    position: fixed;
	    top: 0;
	    z-index: 1000;
	}
	nav {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    max-width: 1200px;
	    margin: 0 auto;
	}
	
	.logo {
	    color: white;
	    font-size: 24px;
	}
	
	.nav-links {
	    display: flex;
	    list-style: none;
	}
	
	.nav-links li {
	    margin-left: 20px;
	}
	
	.nav-links a {
	    color: white;
	    text-decoration: none;
	    font-size: 18px;
	    transition: color 0.3s ease;
	}
	
	.nav-links a:hover {
	    color: #007BFF;
	}
	
	.burger {
	    display: none;
	    cursor: pointer;
	}
	
	.burger div {
	    width: 25px;
	    height: 3px;
	    background: white;
	    margin: 5px;
	    transition: all 0.3s ease;
	}
	
	.hero {
	    height: 100vh;
	    background: url('hero.jpg') no-repeat center center/cover;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    text-align: center;
	}
	
	.hero-content {
	    color: white;
	}
	
	.hero h1 {
	    font-size: 48px;
	    margin-bottom: 20px;
	}
	
	.hero p {
	    font-size: 24px;
	    margin-bottom: 30px;
	}
	
	.cta {
	    padding: 10px 20px;
	    background: #007BFF;
	    color: white;
	    text-decoration: none;
	    font-size: 18px;
	    border-radius: 5px;
	    transition: background 0.3s ease;
	}
	
	.cta:hover {
	    background: #0056b3;
	}
	
	footer {
	    background: #333;
	    color: white;
	    text-align: center;
	    padding: 20px;
	    position: absolute;
	    bottom: 0;
	    width: 100%;
	}
	
	@media (max-width: 768px) {
	    .nav-links {
	        display: none;
	        flex-direction: column;
	        width: 100%;
	        text-align: center;
	    }
	
	    .nav-links li {
	        margin: 10px 0;
	    }
	
	    .burger {
	        display: block;
	    }
	}
	
	@media (max-width: 500px) {
	    .hero h1 {
	        font-size: 32px;
	    }
	
	    .hero p {
	        font-size: 18px;
	    }
	
	    .cta {
	        font-size: 16px;
	    }
	}
    
    </style>
</head>
<body>
    <header>
        <nav>
            <div class="logo">MyWebsite</div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
            <div class="burger">
                <div class="line1"></div>
                <div class="line2"></div>
                <div class="line3"></div>
            </div>
        </nav>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h1>Welcome to MyWebsite</h1>
            <p>Your success is our commitment. Let's build something amazing together.</p>
            <a href="#" class="cta">Get Started</a>
        </div>
    </section>

    <footer>
        <p>&copy; 2024 MyWebsite. All rights reserved.</p>
    </footer>

    <script>
	    document.addEventListener('DOMContentLoaded', () => {
	        const burger = document.querySelector('.burger');
	        const nav = document.querySelector('.nav-links');
	        
	        burger.addEventListener('click', () => {
	            nav.classList.toggle('nav-active');
	            
	            // Burger animation
	            burger.classList.toggle('toggle');
	        });
	    });

    </script>
</body>
</html>
