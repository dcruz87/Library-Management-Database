<%@ page import="java.sql.*" %>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver");  //load driver 
	
	Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","mysql"); // create connection 
	
	if(request.getParameter("btn_update")!=null) //check button click event not null
	{
		int hide; 
		
		String author_up,title_up;
		
		hide=Integer.parseInt(request.getParameter("txt_hide")); //it is hidden id get for update record
		author_up=request.getParameter("txt_author");  //txt_author
		title_up=request.getParameter("txt_title"); //txt_title
		
		PreparedStatement pstmt=null; //create statement  
		
		pstmt=con.prepareStatement("update books set author=?, title=? where id=?"); //sql update query 
		pstmt.setString(1,author_up);
		pstmt.setString(2,title_up);
		pstmt.setInt(3,hide);
		pstmt.executeUpdate(); //execute query
		
		con.close(); //connection close

		out.println("Update Successfully...! Click Back link."); //after update record successfully message
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
		
	<!--css for div main class and table-->
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
		
		<!-- javascript for form validation-->
		<script>
		
			function validate()
			{
				var author = document.myform.txt_author;
				var title = document.myform.txt_title;
				
				if (author.value == "")
				{
					window.alert("please enter author ?");
					author.focus();
					return false;
				}
				if (title.value == "")
				{
					window.alert("please enter title ?");
					title.focus();
					return false;
				}
			}
			
		</script>
		
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
	<div class="main">

	<form method="post" name="myform"  onsubmit="return validate();">
	
		<center>
			<h1>Update Record</h1>
		</center>
		
		<table>	
		   <%
		try
		{
			Class.forName("com.mysql.jdbc.Driver"); //load driver  
		
			Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/test","root","mysql"); // create connection  
	
			if(request.getParameter("edit")!=null) 
			{
				int id=Integer.parseInt(request.getParameter("edit"));
		
				String author,title;
		
				PreparedStatement pstmt=null; // create statement
				
				pstmt=con.prepareStatement("select * from books where id=?"); // sql select query
				pstmt.setInt(1,id);
				ResultSet rs=pstmt.executeQuery(); // execute query store in resultset object rs.
				
				while(rs.next()) 
				{
					id=rs.getInt(1);
					author=rs.getString(2);
					title=rs.getString(3);
			%>
			<tr>
				<td>Author</td>
				<td><input type="text" name="txt_author" value="<%=author%>"></td>
			</tr>
			
			<tr>
				<td>title</td>
				<td><input type="text" name="txt_title" value="<%=title%>"></td>
			</tr>	
			
			<tr>
				<td><input type="submit" name="btn_update" value="Update"></td>	
			</tr>
				
				<input type="hidden" name="txt_hide" value="<%=id%>">
		<%
				}
			}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		%>	
		</table>
		
		<center>
				<h1><a href="index.jsp">Back</a></h1>
		</center>
		
	</form>

	</div>
	
	 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
</body>

</html>