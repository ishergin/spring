package com.concretepage.service;

import com.concretepage.entity.Person;

import java.util.List;

public interface IPersonService {
    List<Person> getAllPersons();

    Person getPersonById(int id);

    boolean addPerson(Person person);

    void updatePerson(Person person);

    void deletePerson(int id);
}
