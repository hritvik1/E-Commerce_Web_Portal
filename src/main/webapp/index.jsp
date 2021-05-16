<%@page import="com.shopping.no_mad_gear.product_discription_shortner"%>
<%@page import="com.shopping.no_mad_gear.entities.Category"%>
<%@page import="com.shopping.no_mad_gear.dao.category_dao"%>
<%@page import="java.util.List"%>
<%@page import="com.shopping.no_mad_gear.entities.Product"%>
<%@page import="com.shopping.no_mad_gear.dao.product_dao"%>
<%@page import="com.shopping.no_mad_gear.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>No Mad Gear - Home</title>
        <%@include file="vendor/bundle_bootstrap_v5.jsp" %>
        <%@include file="common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar_main.jsp" %>
        <div class="row mt-4 mx-4">
            <%
                String cat = request.getParameter("category");
                product_dao p_dao = new product_dao(FactoryProvider.getFactory());
                List<Product> plist = null;
              
                if(cat==null || cat.trim().equals("all")){
                    plist = p_dao.getAllProducts();
                }
                else {
                    int cid = Integer.parseInt(cat.trim());
                    plist = p_dao.getAllProductsById(cid);
                }
                
                category_dao cdao = new category_dao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();
            %>
            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">All Products</a>
                    <%
                        for(Category c:clist) {
                    %>
                    <a href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
                    <%
                        }
                    %>
                </div>
            </div>
            <div class="col-md-10">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <%
                                for(Product p:plist) {
                            %>
                            <div class="card text-center">
                                <img src="images/product_img/<%= p.getProductPic() %>" style="width: 30%; height: auto;" class="card-img-top p-2" />
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getProductName() %></h5>
                                    <p class="card-text"><%= product_discription_shortner.get10Words(p.getProductDescription()) %></p>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn btn-outline-success" onclick="add_to_cart(<%= p.getProductId()%>, '<%= p.getProductName()%>',<%= p.getActualPrice()%>)">Add to Cart</button>
                                    <button class="btn btn-outline-primary">₹ <%= p.getActualPrice()%>/-&nbsp;&nbsp;<span class="text-secondary" style="font-size: 12px!important; font-style: italic;"><del>₹&nbsp;<%= p.getProductPrice() %></del>&nbsp;&nbsp;<%= p.getProductDiscount() %>% Off</span></button>
                                </div>
                            </div>
                            <%
                                }
                                if(plist.size()==0) {
                                    out.println("no item in this categoty");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/cart_modal_main.jsp" %>
    </body>
</html>