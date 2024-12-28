<%-- 
    Document   : rekomendasiDevice
    Created on : 4 Dec 2024, 16.04.41
    Author     : Aydin Shidqi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Benchmark Buddy</title>
        <style>
            /* General Reset */
            body, h1, h2, h3, p, ul, li, input {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }

            header {
                background-color: #ff6a00;
                padding: 15px 20px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            header h1 {
                color: #fff;
                font-size: 1.8rem;
            }

            .search-bar {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .search-bar input {
                padding: 8px 12px;
                border: none;
                border-radius: 20px;
                outline: none;
            }

            .search-bar img {
                width: 25px;
                cursor: pointer;
            }

            header nav a {
                color: #fff;
                text-decoration: none;
                margin-left: 15px;
                font-size: 1rem;
            }

            header nav img {
                width: 30px;
                border-radius: 50%;
            }

            .container {
                display: flex;
                padding: 30px 20px;
                gap: 20px;
            }

            .filter-section {
                flex: 1;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            }

            .filter-section h2 {
                font-size: 1.5rem;
                color: #ff6a00;
                margin-bottom: 15px;
            }

            .filter-section h3 {
                margin: 20px 0 10px;
                font-size: 1.2rem;
                color: #333;
            }

            .filter-section input {
                width: calc(100% - 20px);
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .recommendation-section {
                flex: 3;
            }

            .recommendation-section h2 {
                color: #ff6a00;
                font-size: 1.8rem;
                margin-bottom: 20px;
            }

            .products-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 20px;
            }

            .product-card {
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 10px;
                padding: 20px;
                text-align: center;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .product-card:hover {
                transform: scale(1.05);
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            }

            .product-card img {
                width: 100%;
                height: 150px;
                object-fit: cover;
                margin-bottom: 15px;
                border-radius: 5px;
            }

            .product-card h3 {
                font-size: 1.2rem;
                margin: 15px 0;
            }

            .product-card p {
                margin: 5px 0;
                font-size: 1rem;
                color: #555;
            }

            .product-card button {
                background-color: #ff6a00;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                margin-top: 10px;
                cursor: pointer;
            }

            .product-card input[type="checkbox"] {
                margin-top: 10px;
            }

            .btn-primary {
                background-color: #ff6a00;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 1rem;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .btn-primary:hover {
                background-color: #e65a00;
                transform: scale(1.05);
            }
            .btn-back {
                margin: 10px 0 20px 20px; /* Atur jarak sesuai kebutuhan */
                background-color: #ff6a00;
                color: #fff;
                border: none;
                padding: 10px 20px;
                font-size: 1rem;
                border-radius: 5px;
                cursor: pointer;
                text-align: center;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .btn-back:hover {
                background-color: #e65a00;
                transform: scale(1.05);
            }

            .rounded-lg {
                border-radius: 10px;
            }

            ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            ul li {
                margin-bottom: 10px;
            }

        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <!--        <header>
                    <h1>Benchmark Buddy</h1>
                    <div class="search-bar">
                        <input type="text" placeholder="Search...">
                        <img src="https://via.placeholder.com/20" alt="Search Icon">
                    </div>
                    <nav>
                        <a href="#">HOME</a>
                        <img src="https://via.placeholder.com/30" alt="User Icon">
                    </nav>
                </header>-->
        <button type="button" class="btn btn-back rounded-lg" onclick="window.location.href = '${pageContext.request.contextPath}/Pages/Rekomendasi.jsp'">
            Kembali ke pilihan Preference
        </button>
        <%
            // Retrieve the devices list from the session
            List<Device> devices = (List<Device>) request.getSession().getAttribute("recommendedDevices");
            List<Device> FilteredDevices = (List<Device>) request.getSession().getAttribute("filteredDevice");
            List<Device> displayDevices = new ArrayList<>();

            // Check if FilteredDevices is not null and not empty
            if (FilteredDevices != null && !FilteredDevices.isEmpty()) {
                displayDevices = FilteredDevices;
            } else if (devices != null) { // Fallback to devices if FilteredDevices is null or empty
                displayDevices = devices;
            }
        %>


        <div class="container">
            <!-- Filter Section -->
            <div class="filter-section">
                <h2>FILTER</h2>
                <h3>Kategori</h3>
                <ul>
                    <li>
                        <button type="button" class="btn btn-primary rounded-lg" onclick="window.location.href = '${pageContext.request.contextPath}/DeviceServlet?action=filterByCategory&category=Gaming'">
                            Gaming Laptop
                        </button>
                    </li>
                    <li>
                        <button type="button" class="btn btn-primary rounded-lg" onclick="window.location.href = '${pageContext.request.contextPath}/DeviceServlet?action=filterByCategory&category=Office'">
                            Office Laptop
                        </button>
                    </li>
                    <li>
                        <button type="button" class="btn btn-primary rounded-lg" onclick="window.location.href = '${pageContext.request.contextPath}/DeviceServlet?action=filterByCategory&category=Students'">
                            Students Laptop
                        </button>
                    </li>
                    <li>
                        <button type="button" class="btn btn-primary rounded-lg" onclick="window.location.href = '${pageContext.request.contextPath}/DeviceServlet?action=filterByCategory&category=Creators'">
                            Creator Laptop
                        </button>
                    </li>
                    <li>
                        <button type="button" class="btn btn-primary rounded-lg" onclick="window.location.href = '${pageContext.request.contextPath}/DeviceServlet?action=filterByCategory&category=Home'">
                            Home Laptop
                        </button>
                    </li>
                </ul>
                <!--                <h3>Rentang Harga</h3>
                                <input type="text" placeholder="Harga Minimum">
                                <input type="text" placeholder="Harga Maksimum">-->
            </div>

            <!-- Recommendation Section -->
            <div class="recommendation-section">
                <h2>Our Recommendation</h2>
                <% if (displayDevices == null || displayDevices.isEmpty()) { %>
                <p>No recommended devices are available at the moment.</p>
                <% } else { %>
                <div class="products-grid">
                    <% for (Device device : displayDevices) {%>
                    <div class="product-card">
                        <!--<img src="<%= device.getPoster_url()%>" alt="Laptop Image">-->
                        <img src="../PagesAssets/device-icon.png" alt="Laptop Image">
                        <h3><%= device.getName()%></h3>
                        <p>Price: <%= device.getPrice()%></p>
                        <button type="button" onclick="window.location.href = '${pageContext.request.contextPath}/DeviceServlet?action=showDevices&idDevices=<%=device.getDeviceId()%>'">Pelajari Lebih Lanjut</button> <br>
<!--                        <input type="checkbox"> Bandingkan-->
                    </div>
                    <% } %>
                </div>
                <% }%>
            </div>
        </div>
    </body>
</html>