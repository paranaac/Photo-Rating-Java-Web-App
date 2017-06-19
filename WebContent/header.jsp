<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/style/main.css"/>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>${param.title}</title>
</head>

<body>
	<header>
	<br/>
	<img src="${pageContext.request.contextPath}/images/logo.png" alt="Photo Ranking Homepage Logo" />
	<br/>
	</header>
	<nav class="dropdownmenu">
  	<ul>
    <li><a href="${pageContext.request.contextPath}/album">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/top10.jsp">Top 10</a></li>
 	</ul>
	</nav>
	<div class="photocontent">
	
	