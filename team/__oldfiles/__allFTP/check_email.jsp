<%-- 
    Document   : check_email
    Created on : Dec 9, 2011, 8:18:16 AM
    Author     : SandorC
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="am" uri="/WEB-INF/tlds/am" %>
<am:checkEmail email="${param.email}" var="exists"/>
${exists}