<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="css/styles.css">
<meta charset="UTF-8">
<title>Please Login</title>
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-dark">
      <a class="navbar-brand" href="#"><i class="fas fa-book"></i> Wilmington Library</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <ul class="nav navbar-nav navbar-right">
                         <li><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;"><i class="fas fa-sign-in-alt"></i> Login</button></li>
                      </ul>

      <div class="collapse navbar-collapse" id="navbarSupportedContent" >
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#"><i class="fas fa-home" ></i> Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="#"><i class="fas fa-book"></i> Catalog</a>
          </li>
          <li class="nav-item dropdown active">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-users"></i>
              Users
            </a>
            <div class="dropdown-menu active" aria-labelledby="navbarDropdown">
              <a class="dropdown-item" href="#">Members</a>
              <a class="dropdown-item" href="#">Admin</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="#">Transactions</a>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="#"><i class="fas fa-info-circle"></i> About</a>
          </li>
        </ul>
        <!-- <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form> -->
      </div>
    </nav>
    
    <!-- Jumbotron -->
    <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">Welcome to the Wilmington Library</h1>
    <p class="lead">Feel free to browse our selection of books.</p>
  </div>
</div>
<%
        String myname =  (String)session.getAttribute("username");
        
        if(myname!=null)
            {
             out.println("Welcome  "+myname+"  , <a href=\"logout.jsp\" >Logout</a>");
            }
        else 
            {
            %>
<form action="checkLogin.jsp">
 <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <input type="submit" value="Login" />
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>
            <% 
            }      
            %>
            
             <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
</body>
</html>

          <!--   <form action="checkLogin.jsp">
                <table>
                    <tr>
                        <td> Username  : </td><td> <input name="username" size=15 type="text" /> </td> 
                    </tr>
                    <tr>
                        <td> Password  : </td><td> <input name="password" size=15 type="password" /> </td> 
                    </tr>
                </table>
                <input type="submit" value="Login" />
            </form> -->