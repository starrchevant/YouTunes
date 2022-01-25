<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="youtunes.Artist,youtunes.JdbcArtistDao,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link href="site.css" type="text/css" rel="stylesheet"/>
<meta charset="ISO-8859-1">
<title>Artists List</title>
</head>
<body>
<%@include file= "/TopNav.jsp"%>
<% JdbcArtistDao daO = new JdbcArtistDao(); 
  List<Artist> list = daO.list();
  for(int i = 0; i < list.size(); i++){
%>
	  <p><%=list.get(i).getFirstName() %>
	  <%=list.get(i).getLastName() %></p>
<%
}%>
<%@include file= "/Footer.jsp"%>
<%@include file= "/ScriptFooter.jsp"%>

</body>
</html>