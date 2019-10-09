<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="col-md-12" id="center">
    <div class="row masonry-archive" data-columns>
<%@include file="/WEB-INF/jspf/navbar.jspf" %>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/testdb", "root", "test");
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("select * from user");
                while (rs.next()) { 
                    String email= rs.getString("email");
                    String category= rs.getString("category");
                    int attendance = rs.getInt("attendance");
                    int total = rs.getInt("total");
                    String percentage = "-";
                    if(total != 0) {
                        percentage = String.valueOf((attendance * 100)/total) + "%";
                    }
                    %>
            <div class="item">
            <div class="thumbnail">
                <p class="text-right article-img">
                   
                    <img src="" alt="" class="img-responsive">
                </p>
                <div class="caption">
                    <p><strong><%= email %></strong></p>
            <hr>
            <p><%= category %></p>
            <p><%= percentage %></p>
                </div>
            </div>
        </div>
                    <%
                    
                }
                stmt.close();
        }
        catch(SQLException e) {
                out.println("SQLException caught: " +e.getMessage());
        }    

%>
    </div>
</div>
