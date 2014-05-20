<%-- 
    Document   : users
    Created on : Nov 2, 2011, 8:08:21 PM
    Author     : SandorC
--%>
<%@page import="com.fxss.artistmagnet.sql.UsersHelper"%>
<%@page import="com.fxss.artistmagnet.sql.Users"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
    </head>
    <body>
        <table>
            <tr>
                <td>Email</td>
                <td>Birthday</td>
                <td>Account</td>
            </tr>           
            <%
                UsersHelper usersHelper = new UsersHelper();
                List<Users> users = usersHelper.getAllUsers();
                
                for (Users user : users) {
                    
            %>
            <tr>
                <td><%=user.getEmail()%></td>
                <td><%=user.getBirthday()%></td>
            </tr>           
            <%}%>
        </table>

    </body>
</html>
