package com.concretepage.dao;

import com.concretepage.entity.Person;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Transactional
@Repository
public class PersonDAO implements IPersonDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public Person getPersonById(int id) {
        return hibernateTemplate.get(Person.class, id);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Person> getAllPersons() {
        String hql = "FROM person as p";
        return (List<Person>) hibernateTemplate.loadAll(Person.class);
    }

    @Override
    public boolean addPerson(Person person) {
        hibernateTemplate.save(person);
        return false;
    }

    @Override
    public void updatePerson(Person person) {
        Person p = getPersonById(person.getId());
        p.setName(person.getName());
        hibernateTemplate.update(p);
    }

    @Override
    public void deletePerson(int id) {
        hibernateTemplate.delete(getPersonById(id));
    }

    @SuppressWarnings("unchecked")
    @Override
    public boolean personExists(String name) {
        String hql = "FROM person as p WHERE p.name = ?";
        List<Person> persons = (List<Person>) hibernateTemplate.find(hql, name);
        return persons.size() > 0 ? true : false;
    }
}
