package com.concretepage.dao;

import com.concretepage.entity.Person;

import java.util.List;

public interface IPersonDAO {
    List<Person> getAllPersons();

    Person getPersonById(int id);

    //List<Person> getPersonByName(String name);

    boolean addPerson(Person person);

    void updatePerson(Person person);

    void deletePerson(int id);

    boolean personExists(String name);
}
 