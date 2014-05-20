<%-- 
    Document   : check_recaptcha
    Created on : Nov 1, 2011, 6:11:17 AM
    Author     : SandorC
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaImpl" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaResponse" %>
<%
    String remoteAddr = request.getRemoteAddr();
    ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
    reCaptcha.setPrivateKey("6Lf4AMsSAAAAAL6VfVYNimrwx3Yx41_X2Uf2gfww");

    String challenge = request.getParameter("recaptcha_challenge_field");
    String uresponse = request.getParameter("recaptcha_response_field");
    ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

    if (reCaptchaResponse.isValid()) {
        out.print("true");
    } else {
        out.print("false");
    }
%>