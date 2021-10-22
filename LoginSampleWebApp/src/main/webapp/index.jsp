<%@ page import="javax.swing.text.Style"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>

<c:set var="errMsg" value="${null}"/>
<c:set var="displayForm" value="${true}"/>
<c:if test="${pageContext.request.method=='POST'}">
	<jsp:useBean id="loginBean" class="packt.book.jee_eclipse.ch2.bean.LoginBean">
		<jsp:setProperty name="loginBean" property="*" />
	</jsp:useBean>
	<c:choose>
		<c:when test="${!loginBean.isValidUser()}">
			<c:set var="errMsg" value="Invalid user or password. Please try again." />
		</c:when>
		<c:otherwise>
			<h2>
				<c:out value="Welcome admin!"/>
			</h2>
			<c:out value="You are successfully logged in"/>
			<c:set var="displayForm" value="${false}"></c:set>
		</c:otherwise>
	</c:choose>
</c:if>
<br>Hilfsausgabe:<br>
PageContext Request Method:<c:out value="${pageContext.request.method}"/><br>
Übereinstimmend mit POST:<c:out value="${pageContext.request.method=='POST'}"/><br>
Valid User? <c:out value="${!loginBean.isValidUser()}"/><br>
Formular anzeigen: <c:out value="${displayForm}"/><br>
Inhalt errMsg: <c:out value="${errMsg}"/><br>

<c:if test="${displayForm}">
	<body>
		<form method="post">
			<h2>Login</h2>
			<!-- Prüfe ob errMsg gesetzt ist, falls ja anzeigen -->
			<c:if test="${errMsg != null}">
				<span style="color: red;">
				<c:out value="${errMsg}"/>
				</span><br>
			</c:if>
			Username: <input type="text" name="userName"><br>
			Password: <input type="password" name="password"><br>
			<button type="submit" name="submit">Submit</button>
			<button type="reset">Reset</button>
		</form>
	</body>
</c:if>
</html>