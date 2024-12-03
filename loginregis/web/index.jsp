<%-- 
    Document   : index
    Created on : 3 Dec 2024, 15.06.08
    Author     : Aaron
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="css/style.css" />
  </head>
  <body>
    <div class="container">
      <div class="login form">
        <header>Login</header>
        <form action="#">
          <input type="text" placeholder="Enter your email" required />
          <input type="password" placeholder="Enter your password" required />
          <a href="#">Forgot password?</a>
          <input type="button" class="button" value="Login" />
        </form>
        <div class="signup">
          <span class="signup"
            >Don't have an account?
            <a href="registration.jsp">Signup</a>
          </span>
        </div>
      </div>
    </div>
  </body>
</html>
