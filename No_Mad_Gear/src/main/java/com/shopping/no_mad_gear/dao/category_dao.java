package com.shopping.no_mad_gear.dao;

import com.shopping.no_mad_gear.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class category_dao {
    private SessionFactory factory;

    public category_dao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(Category cat) {
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();
        int catId = (int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
    
    public List<Category> getCategories() {
        
        Session s = this.factory.openSession();
        Query qry = s.createQuery("from Category");
        List<Category> list = qry.list();
        return list;
    }
    
    public Category getCategoryById(int cid) {
        Category cat = null;
        try {
            Session session = this.factory.openSession();
            cat = session.get(Category.class, cid);
            session.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
