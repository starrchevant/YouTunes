<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="youtunes.Artist,youtunes.JdbcArtistDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="site.css" type="text/css" rel="stylesheet"/>
<title>Artists Details</title>
</head>
<body>
<%@include file= "../TopNav.jsp"%>
Artist Details

<% JdbcArtistDao accessO = new JdbcArtistDao();

if (request.getMethod().equals("GET")) { 
	Artist a = accessO.find(Long.parseLong(request.getParameter("artist_id")));

%>

<!--html stuff to do if where in a get request-->
<!-- Here is a form to enter all information from the bean -->
<form method = "POST" action="Details.jsp">
	<label for="fName"> Artist Name:</label>
	<input type="text" value="<%=a.getFirstName() %>" name="fName"/>
	<br/>
	<br/>
	
	<label for="lName">Last Name:</label>
	<input type="text" value="<%=a.getLastName() %>" name="lName"/>
	<br/>
	<br/>
	<input type="hidden" name="artist_id" value="<%=a.getiD()%>">
	<input type=submit value="Update Artist"/>

	
</form>

<% } else {
	    Artist artistN = new Artist(Long.parseLong(request.getParameter("artist_id")), request.getParameter("fName"), request.getParameter("lName"));
	    accessO.update(artistN);
	    response.sendRedirect("/youtunes/index.jsp");
} %>
<%@include file= "../Footer.jsp"%>
<%@include file= "../ScriptFooter.jsp"%>

</body>
</html>