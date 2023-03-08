package main.java.dao;

import main.java.Employee;

import java.util.List;

public interface EmployeeDAO {
    void create(Employee employee);

    Employee read(int id);

    List<Employee> readAll();

    void updateAge(Employee employee);

    void delete(Employee employee);
}
