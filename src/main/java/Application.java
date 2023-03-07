package main.java;

import main.java.dao.EmployeeDAO;
import main.java.dao.EmployeeDAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Application {

    public static void main(String[] args) {
        final String user = "postgres";
        final String password = "postgres";
        final String url = "jdbc:postgresql://localhost:5432/skypro";

        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            EmployeeDAO employeeDAO = new EmployeeDAOImpl(connection);

            City city = new City(1, "Moscow");

            Employee employee = new Employee(16,"Tem", "Temmer", "man", 10, city);
            employeeDAO.create(employee);

            List<Employee> list = new ArrayList<>(employeeDAO.readAll());
            list.forEach(System.out::println);
        } catch (SQLException e) {
            System.out.println("Херня произошла");
        }

    }
}
