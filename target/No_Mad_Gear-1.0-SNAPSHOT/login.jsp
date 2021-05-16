<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>No Mad Gear - Login</title>
        <%@include file="vendor/bundle_bootstrap_v5.jsp" %>
        <%@include file="common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar_main.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3 mt-4">
                    <div class="card">
                        <div class="card-header">
                            <h3 style="text-align: center">Login Here</h3>
                        </div>
                        <div class="card-body">
                            <form action="login_user" method="post">
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email Address</label>
                                    <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
                                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>
                                <a style="text-decoration: none;" href="register.jsp">If not registered, click here</a>
                                <div class="container" style="text-align: center">
                                    <button type="submit" class="btn btn-primary border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary border-0">Reset</button>
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