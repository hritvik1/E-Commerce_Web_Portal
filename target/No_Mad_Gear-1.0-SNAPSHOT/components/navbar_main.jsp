<%@page import="com.shopping.no_mad_gear.entities.User"%>
<%
    User usr = (User) session.getAttribute("current_user");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-light">
    <div class="container">
        <a href="index.jsp"><img id="main_pic" src="images/icon.png" /></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="#!" data-bs-toggle="modal" data-bs-target="#cart"> <i class="fa fa-cart-plus"></i> <span class="cart_items">(0)</span></a>
                </li>
            <%
                if(usr==null) {
            %>
                <li class="nav-item">
                    <a class="nav-link active" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="register.jsp">Register</a>
                </li>
            </ul>
            <%
                }
                else {
            %>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link active" href="<%= usr.getUserType().equals("admin")?"user_admin.jsp":"user_normal.jsp" %>"><%= usr.getUserName() %></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="logout_user">Logout</a>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </div>
</nav>