<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="youtunes.Artist,youtunes.JdbcArtistDao" %>
    <%@page import="youtunes.Album,youtunes.JdbcAlbumDao,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<link href="site.css" type="text/css" rel="stylesheet"/>
<meta charset="ISO-8859-1">
<title>New Albums</title>
</head>
<body>
<%@include file= "../TopNav.jsp"%>
New Album

<% if (request.getMethod().equals("GET")) { %>

<!--html stuff to do if where in a get request-->
<!-- Here is a form to enter all information from the bean -->
<form method = "POST" action="New.jsp">
	<label for="title"> Album Title:</label>
	<input type="text" name="title"/>
	<br/>
	<br/>
	
	<label for="price"> Album Price:</label>
	<input type="text" name="price"/>
	<br/>
	<br/>
	
	<label for="genre"> Album Genre:</label>
	<select name="genre">
	<option value="none">--Select--</option>
    <option value="Classical">Classical</option>
    <option value="Jazz">Jazz</option>
    <option value="Blues">Blues</option>
    <option value="Rock">Rock</option>
  </select>
	<br/>
	<br/>
	
	<label for="img_url"> Album Art:</label>
	<input type="text" name="img_url"/>
	<br/>
	<br/>
	
	<label for="artist_id"> Artist ID:</label>
	<select name="artist_id">
	<%
      JdbcArtistDao daO = new JdbcArtistDao(); 
      List<Artist> list = daO.list();
      for(int i = 0; i < list.size(); i++){ 
      %>
          <option value="<%=list.get(i).getiD()%>"><%=list.get(i).getFirstName() +" "+ list.get(i).getLastName() %></option>
      
      <% 
      
    	  
      }
      
	 %>
	</select>
	<br/>
	<br/>
	
	<input type=submit value="Create Album"/>
	
</form>

<% } else {
	/*public Album(Long album_id, String title, Double price, String genre, String img_url, Long artist_id)*/
	    Album albumN = new Album(Long.valueOf(0), request.getParameter("title"), Double.parseDouble(request.getParameter("price")),
	    		request.getParameter("genre"), request.getParameter("img_url"), 
	    		Long.parseLong(request.getParameter("artist_id")));
	    JdbcAlbumDao accessO = new JdbcAlbumDao();
	    accessO.add(albumN);
	    response.sendRedirect("/youtunes/index.jsp");
} %>
<%@include file= "../Footer.jsp"%>
<%@include file= "../ScriptFooter.jsp"%>

</body>
</html>