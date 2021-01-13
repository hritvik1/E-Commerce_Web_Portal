package com.shopping.no_mad_gear.dao;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class helper_dao {
    public static Map<String, Long> getCounts(SessionFactory factory) {
        
        String user = "Select count(*) from User";
        String product = "Select count(*) from Product";
        
        Session s = factory.openSession();
        Query q1 = s.createQuery(user);
        Query q2 = s.createQuery(product);
        Long userCount = (Long) q1.list().get(0);
        Long productCount = (Long) q2.list().get(0);
        
        Map<String, Long> map = new HashMap<>();
        map.put("userCount", userCount);
        map.put("productCount", productCount);
        s.close();
        return map;
    }
}
