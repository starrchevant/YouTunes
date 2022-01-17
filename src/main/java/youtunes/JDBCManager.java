package youtunes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCManager {

	private String jdbcUrl;
	private String jdbcUserName;
	private String jdbcPassword;
	private Connection conn;

	public JDBCManager() {
		jdbcUrl = "jdbc:mysql://localhost:3306/Youtunes";
		jdbcUserName = "youtunes_user";
		jdbcPassword = "MySQL8IsGreat!";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConn(){
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
		return conn;
		}
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void closeConn(){
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	};
}

/*
 * 
 * create the classes they talk about
 * 
 * Private variables: jdbcUrl, jdbcUserName, jdbcPassword Constructor:
 * initialize the variables with the credentials to connect to your MySQL
 * database. Add a try/catch block to call the MySQL jdbc driver. For example,
 * “Class.forName(“com.mysql.cj.jdbc.Driver.” If you are not sure how to add the
 * MySQL database driver or need assistance, refer to the courses textbook in
 * CSD 430.
 */