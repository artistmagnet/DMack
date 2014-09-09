<html><head><title>Test JSP page</title></head><body bgcolor=white>

<table border="0"><tr><td><h1>Sample Application JSP Page</h1>
This is the output of a JSP page that is part of the Hello, World application.
It displays several useful values from the requestwe are currently processing.</td></tr>
</table>

<table border="0" border="100%"><tr>
<th align="right">Request Method:</th>
<td align="left"><%= request.getMethod() %></td></tr><tr>
<th align="right">Servlet Path:</th>
<td align="left"><%= request.getServletPath() %></td></tr></table>

<%@ page import="java.sql.*" %>
<%
    Connection conn = null;
    String url = "jdbc:mysql://localhost:3306/";
    String dbName = "artmag_db1";
    String driver = "com.mysql.jdbc.Driver";
    String userName = "artmag";
    String password = "StosBorbat09";
    try {
        Class.forName(driver).newInstance();
        conn = DriverManager.getConnection(url + dbName, userName, password);
        out.println("Connected to the database");
Statement s = conn.createStatement();
        s.executeQuery("SELECT id FROM users");
        ResultSet rs = s.getResultSet();
        int count = 0;
        while (rs.next()) {
            int idVal = rs.getInt("id");
            out.println(
                    "id = " + idVal);
        }
        rs.close();
        s.close();
        conn.close();
        out.println("Disconnected from database");
    } catch (Exception e) {
        out.println(e.getMessage());
    }

%>

test

</body></html>
