<%@page import="java.sql.*" %>

<%
try
{	
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","mysql");  //create connection 

	if(request.getParameter("delete")!=null)
	{
		int id=Integer.parseInt(request.getParameter("delete"));
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("delete from books where id=? "); //sql delete query
		pstmt.setInt(1,id);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>	
<html>

	<head>
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="./css/styles.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" href="css/styles.css">
		<title>Wilmington Library</title>
				<!--css for div main class and table -->
		<style type="text/css">
		
		.main
		{
			width:700px;;
			margin-left:250px;
			padding: 10px;
			border: 5px solid grey;
			
		}
		table
		{
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 600px;
		}
		td
		{
			border: 5px solid silver;
			text-align: left;
			padding: 8px;
		}
		</style>
	</head>	
	
<body>
  <nav class="navbar navbar-expand-lg navbar-dark">
      <a class="navbar-brand" href="#"><i class="fas fa-book"></i> Wilmington Library</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <ul class="nav navbar-nav navbar-right">
                         <li><button onclick="document.getElementById('id01').style.display='block'" style="width:auto;"><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</button></li>
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
		<div class="main">
		
			<center>
				<h1><a href="add.jsp">Add Book</a></h1>
			</center>
		
		<table>
			<tr>
				<th>ID</th>
				<th>Author</th>
				<th>Title</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		<%
		try
		{	
			Class.forName("com.mysql.jdbc.Driver");  //load driver 
			
			Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","mysql");  //create connection 

			PreparedStatement pstmt=null; //create statement
		
			pstmt=con.prepareStatement("select * from books"); //sql select query  
			
			ResultSet rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
		
			while(rs.next())
			{%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					
					<td><a href="update.jsp?edit=<%=rs.getInt(1)%> ">Edit</a></td>
					<td><a href="?delete=<%=rs.getInt(1)%> ">Delete</a></td>
					
				</tr>
		<%
			}
			
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
		%>
		
		</table>
		
		</div>
<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 	
</body>

</html>