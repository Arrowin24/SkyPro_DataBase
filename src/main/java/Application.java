package main.java;

import main.java.dao.EmployeeDAO;
import main.java.dao.EmployeeDAOImpl;

public class Application {

    public static void main(String[] args) {
        EmployeeDAO  employeeDAO = new EmployeeDAOImpl();

        Employee employee = new Employee("111","dfddf","nnn",30,1);

        employeeDAO.create(employee);
        employeeDAO.readAll().forEach(System.out::println);
    }
}
