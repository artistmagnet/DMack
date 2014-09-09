<%-- 
    Document   : doRegister
    Created on : Nov 1, 2011, 4:14:13 AM
    Author     : SandorC
--%>

<%@page import="com.fxss.artistmagnet.sql.AccountTypes"%>
<%@page import="com.fxss.artistmagnet.sql.UsersHelper"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.fxss.artistmagnet.sql.Users"%>
<%
AccountTypes accountTypes = new AccountTypes();
accountTypes.setAccountTypeId(Integer.parseInt(request.getParameter("account")));
Users user = new Users();
user.setFirstName(request.getParameter("firstName"));
user.setLastName(request.getParameter("lastName"));
user.setEmail(request.getParameter("email"));
user.setPassword(request.getParameter("password"));
SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
user.setBirthday(sdf.parse(request.getParameter("birthday_year")+"/"+request.getParameter("birthday_month")+"/"+request.getParameter("birthday_day")));
user.setAccountTypes(accountTypes);
user.setJoinedDate(new Date());
UsersHelper usersHelper = new UsersHelper();
usersHelper.saveUser(user);

%>
<jsp:forward page="index.jsp"/>