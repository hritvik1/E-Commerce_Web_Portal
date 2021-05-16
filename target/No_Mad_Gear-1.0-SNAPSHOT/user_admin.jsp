<%@page import="java.util.Map"%>
<%@page import="com.shopping.no_mad_gear.dao.helper_dao"%>
<%@page import="java.util.List"%>
<%@page import="com.shopping.no_mad_gear.entities.Category"%>
<%@page import="com.shopping.no_mad_gear.FactoryProvider"%>
<%@page import="com.shopping.no_mad_gear.dao.category_dao"%>
<%@page import="com.shopping.no_mad_gear.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        String msg = "You are not logged in";
        session.setAttribute("message", msg);
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            String msg = "You are not admin";
            session.setAttribute("message", msg);
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
<%
    category_dao c_dao = new category_dao(FactoryProvider.getFactory());
    List<Category> list = c_dao.getCategories();
    Map<String, Long> m = helper_dao.getCounts(FactoryProvider.getFactory());
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Admin (No Mad Gear)</title>
        <%@include file="vendor/bundle_bootstrap_v5.jsp" %>
        <%@include file="common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar_main.jsp" %>
        <div class="container admin">
            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/seo-and-web.png" class="img-fluid rounded-circle" style="width: 50%; height: auto;"/>
                            </div>
                            <h1><%= m.get("userCount") %></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/list.png" class="img-fluid rounded-circle" style="width: 50%; height: auto;"/>
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/product.png" class="img-fluid rounded-circle" style="width: 50%; height: auto;"/>
                            </div>
                            <h1><%= m.get("productCount") %></h1>
                            <h1 class="text-uppercase text-muted">Products</h1> 
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-1"></div>
                <div class="col-md-5">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add_category">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/keys.png" class="img-fluid rounded-circle" style="width: 27%; height: auto;"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Add Category</h1> 
                        </div>
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#add_product">
                        <div class="card-body text-center">
                            <div class="container">
                                <img src="images/plus.png" class="img-fluid rounded-circle" style="width: 27%; height: auto;"/>
                            </div>
                            <h1 class="text-uppercase text-muted">Add Products</h1> 
                        </div>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
            <div class="container-fluid mt-3">
                <%@include file="components/message_display_main.jsp" %>
            </div>
        </div>
        <div class="modal fade" id="add_category" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="add_category">
                            <div class="form-group">
                                <input type="text" class="form-control" name="categoryTitle" placeholder="Enter Tiitle" required />
                            </div>
                            <div class="form-group mt-3">
                                <textarea class="form-control" placeholder="Enter Descrpition" style="height: 100px;" name="categoryDescription" required></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success mt-3">Add Category</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="add_product" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="add_product" enctype="multipart/form-data">
                            <div class="form-group">
                                <input type="text" class="form-control" name="productTitle" placeholder="Enter Tiitle" required />
                            </div>
                            <div class="form-group mt-2">
                                <textarea class="form-control" placeholder="Enter Descrpition" style="height: 70px;" name="productDescription" required></textarea>
                            </div>
                            <div class="form-group mt-2">
                                <input type="number" class="form-control" name="productPrice" placeholder="Enter Price" required />
                            </div>
                            <div class="form-group mt-2">
                                <input type="number" class="form-control" name="productDiscount" placeholder="Enter Discount" required />
                            </div>
                            <div class="form-group mt-2">
                                <input type="number" class="form-control" name="productQuantity" placeholder="Enter Quantity" required />
                            </div>
                            <div class="form-group mt-2">
                                <label for="pCat">Choose Category</label>
                                <select name="productCategory" id="pCat" class="form-control">
                                    <%
                                        for(Category c:list) {
                                    %>
                                        <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group mt-2">
                                <label for="pPic">Select Pic Of Product</label>
                                <input type="file" accept="image/*" id="pPic" class="form-control" name="productPic" required />
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-success mt-3">Add Product</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>