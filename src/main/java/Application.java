import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Application {

    public static void main(String[] args) {
       final String user = "postgres";
       final String password = "postgres";
       final String url = "jdbc:postgresql://localhost:5432/skypro";

       try(Connection connection = DriverManager.getConnection(url,user,password);
               PreparedStatement statement = connection.prepareStatement("SELECT * FROM book WHERE book_id = (?)")){

       } catch (SQLException e) {
           System.out.println("Херня произошла");
       }

    }
}
