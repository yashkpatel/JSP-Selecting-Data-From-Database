<%-- 
    Document   : index
    Created on : 28 Mar, 2017, 7:09:27 PM
    Author     : Yash1
--%>

<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selecting Data From A Database</title>
    </head>
    <body>
        <h1>Selecting Data From A Database</h1>
        <%!
        
          public class Actor 
            {
                String URL = "jdbc:mysql://localhost:3306/sakila";
                String USERNAME = "root";
                String PASSWORD = "password";

                Connection conn = null;
                PreparedStatement selectActor = null;
                ResultSet resultSet = null;

                public Actor()
                {
                    try{
                        
                        conn = DriverManager.getConnection(URL,USERNAME,PASSWORD);
                        selectActor = conn.prepareStatement("SELECT actor_id,first_name,last_name FROM actor");
                    
                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                }

                public ResultSet getActors()
                {
                    try{
                        resultSet = selectActor.executeQuery();
                    }catch(SQLException e){
                        e.printStackTrace();
                    }
                    return resultSet;
                }
            }
            
            %>
            
            <%
                Actor actor = new Actor();
                ResultSet actors = actor.getActors();
            %>
            
            <table border="1">
                
                <tbody>
                    <tr>
                        <td>Actor ID</td>
                        <td>First Name</td>
                        <td>Last Name</td>
                    </tr>
                    <% while(actors.next()){ %>
                    <tr>
                        <td><%= actors.getInt("actor_id") %></td>
                        <td><%= actors.getString("first_name") %></td>
                        <td><%= actors.getString("last_name") %></td>
                    </tr>                    
                    <% } %>
                </tbody>
            </table>

        
    </body>
</html>
