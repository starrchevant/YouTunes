<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="youtunes.Artist,youtunes.JdbcArtistDao" %>
<!DOCTYPE html>
<html>
<head>
<link href="site.css" type="text/css" rel="stylesheet"/>
<meta charset="ISO-8859-1">
<title>New Artists</title>
</head>
<body>
<%@include file= "../TopNav.jsp"%>
New Artists

<% if (request.getMethod().equals("GET")) { %>

<!--html stuff to do if where in a get request-->
<!-- Here is a form to enter all information from the bean -->
<form method = "POST" action="New.jsp">
	<label for="fName"> Artist Name:</label>
	<input type="text" name="fName"/>
	<br/>
	<br/>
	
	<label for="lName">Last Name:</label>
	<input type="text" name="lName"/>
	<br/>
	<br/>
	
	<input type=submit value="Create Artist"/>
	
</form>

<% } else {
	    Artist artistN = new Artist(0, request.getParameter("fName"), request.getParameter("lName"));
	    JdbcArtistDao accessO = new JdbcArtistDao();
	    accessO.add(artistN);
	    response.sendRedirect("/youtunes/index.jsp");
} %>
<%@include file= "../Footer.jsp"%>
<%@include file= "../ScriptFooter.jsp"%>

</body>
</html>