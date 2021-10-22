<%@page import="javax.swing.text.Style"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<%
	String errMsg = null;
	// prüfen ob das Formular abgeschickt wurde
	if("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("submit") != null) {
		// dann wurde das Formular abgeschickt
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		if(userName.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin")) {
			System.out.println("Welcome admin!");
		} else {
			errMsg = "Invalid User Id or password. Please try again";
		}
	}
 %>
<body>
<form method="post">
<h2>Login</h2>
<!-- Prüfe ob errMsg gesetzt ist, falls ja anzeigen -->
<% if(errMsg != null) { %>
		<span style="color: red;"><% out.print(errMsg); %></span><br>
<% } %>
Username: <input type="text" name="userName"><br>
Password: <input type="password" name="password"><br>
<button type="submit" name="submit">Submit</button>
<button type="reset"> Reset</button>
</form>
</body>
</html>