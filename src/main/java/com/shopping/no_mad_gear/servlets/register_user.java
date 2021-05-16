package com.shopping.no_mad_gear.servlets;

import com.shopping.no_mad_gear.FactoryProvider;
import com.shopping.no_mad_gear.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class register_user extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                String u_name = request.getParameter("name");
                String u_email = request.getParameter("email");
                String u_pass = request.getParameter("password");
                String u_phone = request.getParameter("phone");
                String u_address = request.getParameter("address");
                
                User user = new User(u_name, u_email, u_pass, u_phone, "abc.jpg", u_address, "normal");
                
                Session hiber_session = FactoryProvider.getFactory().openSession();
                Transaction tx = hiber_session.beginTransaction();
                int user_id = (int) hiber_session.save(user);
                tx.commit();
                hiber_session.close();
                
                String msg = "Successfully Registered With User ID: "+user_id;
                
                HttpSession http_session = request.getSession();
                http_session.setAttribute("message", msg);
                response.sendRedirect("register.jsp");
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