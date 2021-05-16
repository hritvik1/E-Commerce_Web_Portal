<%@page import="com.shopping.no_mad_gear.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        String msg = "You are not logged in";
        session.setAttribute("message", msg);
        response.sendRedirect("login.jsp");
        return;
    }
    else {
        if (user.getUserType().equals("admin")) {
            String msg = "Sign in to admin account";
            session.setAttribute("message", msg);
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>No Mad Gear</title>
        <%@include file="vendor/bundle_bootstrap_v5.jsp" %>
        <%@include file="common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar_main.jsp" %>
    </body>
</html>
