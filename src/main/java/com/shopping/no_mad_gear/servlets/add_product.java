package com.shopping.no_mad_gear.servlets;

import com.shopping.no_mad_gear.FactoryProvider;
import com.shopping.no_mad_gear.dao.category_dao;
import com.shopping.no_mad_gear.dao.product_dao;
import com.shopping.no_mad_gear.entities.Category;
import com.shopping.no_mad_gear.entities.Product;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class add_product extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String pTitle = request.getParameter("productTitle");
                String pDesc = request.getParameter("productDescription");
                int pPrice = Integer.parseInt(request.getParameter("productPrice"));
                int pDisc = Integer.parseInt(request.getParameter("productDiscount"));
                int pQty = Integer.parseInt(request.getParameter("productQuantity"));
                int pCat = Integer.parseInt(request.getParameter("productCategory"));
                Part part = request.getPart("productPic");
                
                Product product = new Product();
                product.setProductName(pTitle);
                product.setProductDescription(pDesc);
                product.setProductPrice(pPrice);
                product.setProductDiscount(pDisc);
                product.setProductQuantity(pQty);
                product.setProductPic(part.getSubmittedFileName());
                
                category_dao c_dao = new category_dao(FactoryProvider.getFactory());
                Category category = c_dao.getCategoryById(pCat);
                product.setCategory(category);
                
                product_dao p_dao = new product_dao(FactoryProvider.getFactory());
                p_dao.saveProduct(product);
                
                String path = request.getRealPath("images")+File.separator+"product_img"+File.separator+part.getSubmittedFileName();
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = part.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
                
                HttpSession http_session = request.getSession();
                String msg = "Product Added Successfully....";
                http_session.setAttribute("message", msg);
                response.sendRedirect("user_admin.jsp");
                return;
                
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}