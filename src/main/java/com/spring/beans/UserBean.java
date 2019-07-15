package com.spring.beans;

import com.spring.dto.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

public class UserBean {

    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    //@Override
    public void addUser(Users user) {

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(user);
        transaction.commit();

        session.close();

    }
	
	 public void deleteUser(Long id) {

        Users us = new Users();
        us.setId(id);

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(us);
        transaction.commit();
        session.close();

    }

	 public void deleteFood(Long id) {

        Food fd = new Food();
        fd.setId(id);

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(fd);
        transaction.commit();
        session.close();

    }
	
    //@Override
    public List<Users> getAllUsers() {

        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = criteriaBuilder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        List<Users> allUsers = session.createQuery(query).getResultList();
        session.close();
        return allUsers;

    }

    public List<Food> getFood() {

        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Food> query = criteriaBuilder.createQuery(Food.class);
        Root<Food> root = query.from(Food.class);
        List<Food> allFood = session.createQuery(query).getResultList();
        session.close();
        return allFood;

    }

    public List<UserFood> getUserFood() {

        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<UserFood> query = criteriaBuilder.createQuery(UserFood.class);
        Root<UserFood> root = query.from(UserFood.class);
        List<UserFood> allFood = session.createQuery(query).getResultList();
        session.close();
        return allFood;

    }




    //@Override
    public Users getUser(Long id) {

        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = criteriaBuilder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        Users users = session.createQuery(query.where(criteriaBuilder.equal(root.get("id"), id))).getSingleResult();
        session.close();
        return users;
    }

    //@Override
    public Users getUser(String email) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = criteriaBuilder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        Users users = session.createQuery(query.where(criteriaBuilder.equal(root.get("email"), email))).getSingleResult();
        session.close();
        return users;
    }

    //@Override
    public void saveUser(Users users) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(users);
        transaction.commit();
        session.close();
    }


    public void addUserFood(UserFood userFood) {

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(userFood);
        transaction.commit();

        session.close();

    }

 public void addFood(Food food) {

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(food);
        transaction.commit();

        session.close();

    }





}