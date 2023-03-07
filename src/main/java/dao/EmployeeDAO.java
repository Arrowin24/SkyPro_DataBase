package main.java.dao;

import main.java.Employee;

import java.util.List;

public interface EmployeeDAO {
    void create(Employee employee);

    Employee read(int id);

    List<Employee> readAll();

    void updateAge(int id, int age);

    void delete(int id);
}
