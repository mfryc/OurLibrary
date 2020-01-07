package com.ourlibrary.dao;

import com.ourlibrary.entity.Role;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;

@Repository
public class RoleRepository {

    @Autowired
    private EntityManager entityManager;

    public Role findRoleByName(String theRoleName) {
        Session currentSession = entityManager.unwrap(Session.class);

        Query<Role> theQuery = currentSession.createQuery("from Role where name=:roleName", Role.class);
        theQuery.setParameter("roleName", theRoleName);

        Role role = null;

        try {
            role = theQuery.getSingleResult();
        } catch (Exception e) {
            role = null;
        }

        return role;
    }

}
