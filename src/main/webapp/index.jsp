<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="youtunes.Album,youtunes.JdbcAlbumDao,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link href="site.css" type="text/css" rel="stylesheet"/>
<meta charset="ISO-8859-1">
<title>YouTunes</title>
</head>
<body>
<%@include file= "TopNav.jsp"%>

<div class="about-section">
  <h1>Youtunes</h1>
  <p>Welcome to Youtunes, your "one stop shop" to all of your music needs. Below you will find a list of our current selection. To add a new album, click on the "New Music Album" button. For artists, selct the "Artist" link from the top hand menu pane.</p>
  <form action="albums/New.jsp"><input type="submit" value="New Music Album"></form><p>
</div>
<%
  JdbcAlbumDao daO = new JdbcAlbumDao(); 
  List<Album> list = daO.list();
  for(int i = 0; i < list.size(); i++){
	  %>
	  <div class="column">
      <div class="card">
      <img src="<%=list.get(i).getImg_url() %>" alt="<%=list.get(i).getTitle() %>" style="width:100%"/>
      <div class="container">
        <h2><%= list.get(i).getTitle() %></h2>
        <p class="title"><%=list.get(i).getGenre() %></p>
       <form action="albums/Details.jsp"><input type="hidden" name="album_id" value="<%= list.get(i).getAlbum_id() %>"/>
       <input type="submit" value="Edit"></form>
        
        <button class="button">Delete</button></p>
        <p>$<%=list.get(i).getPrice() %></p>
      </div>
      </div>
      </div>
	  <% 
  }
%>

<br/>
<br/>

<%@include file= "Footer.jsp"%>
<%@include file= "ScriptFooter.jsp"%>
</body>
</html>