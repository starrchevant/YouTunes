package youtunes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JdbcManager {

	private String jdbcUrl;
	private String jdbcUserName;
	private String jdbcPassword;
	private Connection conn;

	public JdbcManager() {
		jdbcUrl = "jdbc:mysql://localhost:3306/youtunes";
		jdbcUserName = "youtunes_user";
		jdbcPassword = "MySQL8IsGreat!";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConn() {
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
		return conn;
		}
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
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
