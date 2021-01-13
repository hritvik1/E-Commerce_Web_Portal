package com.shopping.no_mad_gear.dao;

import com.shopping.no_mad_gear.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class user_dao {
    
    private SessionFactory factory;

    public user_dao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "from User where userEmail=: e and userPassword=: p";
            Session session = this.factory.openSession();
            Query q = session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            user = (User) q.uniqueResult();
            session.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}