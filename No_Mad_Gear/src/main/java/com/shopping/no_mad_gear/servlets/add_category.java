package com.shopping.no_mad_gear.servlets;

import com.shopping.no_mad_gear.FactoryProvider;
import com.shopping.no_mad_gear.dao.category_dao;
import com.shopping.no_mad_gear.entities.Category;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class add_category extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String title = request.getParameter("categoryTitle");
                String desc = request.getParameter("categoryDescription");
                
                Category category = new Category();
                category.setCategoryTitle(title);
                category.setCategoryDescription(desc);
                
                category_dao category_dao = new category_dao(FactoryProvider.getFactory());
                int catId = category_dao.saveCategory(category);
                
                HttpSession http_session = request.getSession();
                String msg = "Category Added Successfully With ID: "+catId;
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