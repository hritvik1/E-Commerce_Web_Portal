package com.shopping.no_mad_gear.servlets;

import com.shopping.no_mad_gear.FactoryProvider;
import com.shopping.no_mad_gear.dao.user_dao;
import com.shopping.no_mad_gear.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class login_user extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String email = request.getParameter("email");
                String pass = request.getParameter("password");
                user_dao u_dao = new user_dao(FactoryProvider.getFactory());
                User user = u_dao.getUserByEmailAndPassword(email, pass);
                
                HttpSession http_session = request.getSession();
                
                if(user==null) {
                    String msg = "Invalid Details";
                    http_session.setAttribute("message", msg);
                    response.sendRedirect("login.jsp");
                    return;
                }
                else {
                    http_session.setAttribute("current_user", user);
                    if(user.getUserType().equals("admin")) {
                        response.sendRedirect("user_admin.jsp");
                    }
                    else if(user.getUserType().equals("normal")) {
                        response.sendRedirect("user_normal.jsp");
                    }
                    else {
                        out.println("not identified user type!!");
                    }
                }
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