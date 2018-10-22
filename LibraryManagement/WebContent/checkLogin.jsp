<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wilmington Library</title>
</head>
<body>
<%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
           out.println("Checking login. . .<br>");
            if (username == null || password == null) {
 
                out.print("Invalid parameters ");
            }
 
            // Here you put the check on the username and password
            if (username.toLowerCase().trim().equals("admin") && password.toLowerCase().trim().equals("admin")) {
                out.println("Welcome " + username + " <a href=\"index.jsp\">Go to Library</a>");
                session.setAttribute("username", username);
            }
           else
               {
                out.println("Invalid username and password");
           }
 
 
 
 
%>
</body>
</html>