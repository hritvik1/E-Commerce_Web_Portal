<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>No Mad Gear - Register</title>
        <%@include file="vendor/bundle_bootstrap_v5.jsp" %>
        <%@include file="common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar_main.jsp" %>
        <div class="container-fluid">
            <div class="row mt-4">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-body px-5">
                            <h3 style="text-align: center;">Sign Up Here</h3>
                            <form action="register_user" method="post">
                                <div class="form-group mt-3">
                                    <label for="name" class="form-label">Name *</label>
                                    <input type="text" class="form-control" name="name" id="name" placeholder="Enter Name Here" required>
                                </div>
                                <div class="form-group mt-3">
                                    <label for="email" class="form-label">Email *</label>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Enter Email Address Here" required>
                                </div>
                                <div class="form-group mt-3">
                                    <label for="password" class="form-label">Password *</label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter Password Here" required>
                                </div>
                                <div class="form-group mt-3">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <input type="number" class="form-control" name="phone" id="phone" placeholder="Enter Phone Number Here">
                                </div>
                                <div class="form-group mt-3">
                                    <label for="phone" class="form-label">Address</label>
                                    <textarea style="height: 100px;" name="address" id="address" class="form-control" placeholder="Enter Address Here"></textarea>
                                </div>
                                <div class="container mt-4" style="text-align: center;">
                                    <button type="submit" class="btn btn-outline-success">Register</button>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%@include file="components/message_display_main.jsp" %>
                </div>
            </div>
        </div>
    </body>
</html>
