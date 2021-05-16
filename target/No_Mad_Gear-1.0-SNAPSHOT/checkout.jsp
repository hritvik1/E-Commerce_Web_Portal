<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        String msg = "You are not logged in";
        session.setAttribute("message", msg);
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>No Mad Gear - Checkout</title>
        <%@include file="vendor/bundle_bootstrap_v5.jsp" %>
        <%@include file="common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar_main.jsp" %>
        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="text-center mb-3">Your Selected Items</h2>
                            <div class="card_body"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="text-center mb-3">Your Details</h2>
                            <form>
                                <div class="form-group">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" value="<%= user.getUserEmail() %>" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email">
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="form-group">
                                    <label for="name" class="form-label">Shipping Name</label>
                                    <input type="text" value="<%= user.getUserName()%>" class="form-control" id="name" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="number" class="form-label">Enter Contact Number</label>
                                    <input type="number" value="<%= user.getUserPhone()%>" class="form-control" id="number" placeholder="Enter Phone Number">
                                </div>
                                <div class="form-group">Enter Shipping Address</label>
                                <textarea class="form-control" value="<%= user.getUserAddress()%>" id="address" placeholder="Enter Address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>