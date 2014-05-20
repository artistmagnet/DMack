<%-- 
    Document   : doRegister
    Created on : Nov 1, 2011, 4:14:13 AM
    Author     : SandorC
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="am" uri="/WEB-INF/tlds/am" %>

<am:sendInviteMail to="${param.emailAddresses}" message="${param.message}"/>
