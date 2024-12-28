
<%@page import="java.util.List"%>
<%@page import="model.Device"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HalamanAdmin</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #ffffff;
            }
            
            header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 10px 20px;
                background-color: #ffffff;
                color: #ff6600;
                
            }
            
            .logo{
                font-size: 20px;
                font-weight: bold;
            }
            
            .header-actions {
                display: flex;
                align-items: center;
            }
              
            .search-bar {
                padding: 5px 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                margin-right: 10px;
            }
            
            .search-btn {
                background-color: #ffffff;
                border: 1px solid #ddd;
                padding: 5px 10px;
                cursor: pointer;
                border-radius: 5px;
            }
            
            .profile-icon {
                font-size: 24px;
                margin-left: 10px;
            }
            
            .container {
                padding: 20px;
                background-color: white;
                display: flex;
                
            }
            
            #add-device-btn {
                background-color: #ff6600;
                color: white;
                border: none;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                border-radius: 30px;
            }
            
            .device-list {
                padding: 90px;
                background-color: #e6f0ff;
                border-radius: 5px;
                text-align: center;
                margin: 90px;
            }
            
            .modal {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
            }

            .modal-content {
                background-color: white;
                width: 90%;
                max-width: 600px;
                border-radius: 10px;
                padding: 20px;
                position: relative;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                max-height: 90%;
                overflow-y: auto;
            }

            .close-btn {
                position: absolute;
                top: 10px;
                right: 15px;
                font-size: 20px;
                cursor: pointer;
            }

            .modal-content h2 {
                text-align: center;
                margin-bottom: 20px;
                font-size: 1.5rem;
            }

            form label {
                display: block;
                margin: 10px 0 5px;
                font-weight: bold;
                font-size: 14px;
            }

            form input, form textarea {
                width: 100%;
                padding: 4px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 14px;
                background-color: #f9f9f9;
            }

            form textarea {
                resize: none;
                height: 80px;
            }

            .modal-buttons {
                display: flex;
                justify-content: flex-end;
                gap: 10px;
            }

            .close-button {
                background-color: #b0b0b0;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .close-button:hover {
                background-color: #909090;
            }

            .submit-button {
                background-color: #FF5733;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .submit-button:hover {
                background-color: #e74c3c;
            }
            
            .content {
                flex-grow: 3;
                margin-left: 10px;
                margin-right: 40px;
                background-color: white;
            }
            
            .filter {
                flex-grow: 1;
                background-color: pink;
                margin-left: 40px;
                background: white;
                border: 1px solid #ddd;
                border-radius: 5px;
                overflow: hidden;
            }

            .filter-header {
              background-color: #ff6600;
              color: white;
              font-weight: bold;
              text-align: center;
              padding: 10px 0;
            }

            .filter-category {
              padding: 10px;
            }

            .filter-category h3 {
              margin: 0;
              font-size: 16px;
              color: #333;
              border-bottom: 1px solid #ddd;
              padding-bottom: 5px;
            }

            .filter-category ul {
              list-style-type: none;
              padding: 0;
              margin: 10px 0 0;
            }

            .filter-category li {
              padding: 10px 5px;
              cursor: pointer;
              color: #555;
            }

            .filter-category li:hover {
              background-color: #f9f9f9;
              color: #000;
            }
            
            .deviceList {
                flex: 3;
                margin-top: 10px;
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
            
        </style>
        
    </head> 
    <body>
        <header>
        <div class="logo">Benchmark Buddy</div>
        <div class="header-actions">
            <input type="text" class="search-bar" placeholder="Search...">
            <button class="search-btn">🔍</button>
            <div class="profile-icon">👤</div>
        </div>
        </header>
        
        <%
        // Retrieve the devices list from the session
        List<Device> devices = (List<Device>) request.getSession().getAttribute("recommendedDevices");
        %>
        
         <div style="height: 35px; background-color: #ff6600; margin: 20px;"></div>
        
       <div class="container">   
           <div class="filter">
               <div class="filter-header">FILTER</div>
                <div class="filter-category">
                  <h3>Kategori</h3>
                  <ul>
                    <li>Gaming Laptop</li>
                    <li>Office Laptop</li>
                    <li>Students Laptop</li>
                    <li>Creators Laptop</li>
                    <li>Home Laptop</li>
                  </ul>
                </div>
           </div>
            <div class="content">
                <button id="add-device-btn">+ Tambah Device</button>
                <div class="deviceList">
                    <% if (devices == null || devices.isEmpty()) { %>
                        <div class="device-list" id="device-list">
                            <p>Belum ada Device</p>
                        </div>
                    <% } else { %>
                        <div class="products-grid">
                            <% for (Device device : devices) { %>
                                <div class="product-card">
                                    <img src="https://via.placeholder.com/150" alt="Product Image">
                                    <h3><%= device.getName() %></h3>
                                    <p>Price: <%= device.getPrice() %></p>
                                    <button>Edit Device</button>
                                    <button>Hapus Device</button>
                                </div>
                            <% } %>
                        </div>
                    <% } %>
                </div>
                
                <div class="modal" id="deviceModal">
        <div class="modal-content">
            <span class="close-btn" id="closeModalBtn">&times;</span>
            <h2>Tambah Device</h2>
            <form id="deviceForm" action="${pageContext.request.contextPath}/DeviceServlet" method="post" enctype="multipart/form-data"> 
                <input type="hidden" name="action" value="tambahDevice">
                <label for="deviceName">Nama Device</label>
                <input type="text" id="deviceName" name="name" placeholder="Example: Acer Nitro 5">

                <label for="deviceBrand">Brand Device</label>
                <input type="text" id="deviceBrand" name="brand" placeholder="Example: Asus">

                <label for="devicePrice">Harga Device</label>
                <input type="text" id="devicePrice" name="price" placeholder="Example: Rp14.000.000,00">

                <label for="deviceCategory">Kategori</label>
                <input type="text" id="deviceCategory" name="category" placeholder="Example: Laptop Gaming">

                <label for="deviceOS">Sistem Operasi</label>
                <input type="text" id="deviceOS" name="operatingSystem" placeholder="Example: Windows 11">

                <label for="deviceProcessor">Prosesor</label>
                <input type="text" id="deviceProcessor" name="processor" placeholder="Example: Intel Core i7">

                <label for="deviceGraphics">Kartu Grafis</label>
                <input type="text" id="deviceGraphics" name="graphicsCard" placeholder="Example: NVIDIA GTX 1650">

                <label for="graphicsCardType">Tipe Kartu Grafis</label>
                <select id="graphicsCardType" name="graphicsCardType">
                    <option value="Dedicated">Dedicated</option>
                    <option value="Integrated">Integrated</option>
                </select>

                <label for="deviceDisplay">Layar</label>
                <input type="text" id="deviceDisplay" name="display" placeholder="Example: 15.6-inch, FHD">

                <label for="deviceMemory">Memori</label>
                <input type="number" id="deviceMemory" name="memory" placeholder="Example: 16GB">

                <label for="deviceStorage">Penyimpanan</label>
                <input type="text" id="deviceStorage" name="storage" placeholder="Example: 512GB SSD">

                <label for="deviceBattery">Baterai</label>
                <input type="text" id="deviceBattery" name="battery" placeholder="Example: 6 hours">

                <label for="deviceImage">Gambar</label>
                <input type="file" id="deviceImage" name="image" accept="image/*">

                <button type="submit">Simpan Device</button>
            </form>
        </div>
    </div>
            </div>
        </div>
         
        
        
        <script>
            const addDeviceBtn = document.getElementById('add-device-btn');
            const deviceModal = document.getElementById('deviceModal');
            const closeModalBtns = document.querySelectorAll('.close-btn, #closeModalBtn2');

            addDeviceBtn.addEventListener('click', () => {
                deviceModal.style.display = 'flex';
            });

            closeModalBtns.forEach(btn => {
                btn.addEventListener('click', () => {
                    deviceModal.style.display = 'none';
                });
            });

            window.addEventListener('click', (e) => {
                if (e.target === deviceModal) {
                    deviceModal.style.display = 'none';
                }
            });
            
            document.addEventListener('DOMContentLoaded', () => {
            const categories = document.querySelectorAll('.filter-category li');

            categories.forEach(category => {
              category.addEventListener('click', () => {
//                alert(`You selected: ${category.textContent}`);
                console.log(category.textContent);
              });
            });
          });

        </script>
        
    </body>
</html>