<%-- 
    Document   : registration
    Created on : 3 Dec 2024, 15.07.50
    Author     : Aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Signup | Registration</title>
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <div class="container">
      <div class="registration form">
        <header>Signup</header>
        <form action="RegisterServlet" method="post">
            <input type="text" name="name" placeholder="Enter your name" required />
            <input type="text" name="email" placeholder="Enter your email" required />
            <input type="password" name="password" placeholder="Create a password" required />
            <input type="submit" class="button" value="Signup" />
        </form>
        <div class="signup">
          <span class="signup">
            Already have an account?
            <a href="index.jsp">Login</a>
          </span>
        </div>
      </div>
    </div>
  </body>
</html>
