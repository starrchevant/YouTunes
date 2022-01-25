package youtunes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;


public class JdbcArtistDao implements ArtistDao {

	private JdbcManager db;

	public JdbcArtistDao() {
		db = new JdbcManager();
	}

	@Override
	public void add(Artist entity) {
		// TODO Auto-generated method stub
		Connection connection = db.getConn();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "INSERT INTO artist(first_name, last_name) VALUES('" + entity.getFirstName() + "' , '"
						+ entity.getLastName() + "')";

				try {
				     s.executeUpdate(sql);
				} finally {
					s.close();
				}
			} catch (SQLException e) {
				System.out.println("Could not insert artist " + e.getMessage());
			} finally {
				db.closeConn();
			}
		}
	}

	@Override
	public List<Artist> list() {
		// TODO Auto-generated method stub
		LinkedList<Artist> result = new LinkedList<Artist>();
		Connection connection = db.getConn();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "SELECT artist_id, first_name, last_name FROM artist";
				try {
					ResultSet rs = s.executeQuery(sql);
					try {
						while (rs.next()) {
							result.add(new Artist(rs.getInt(1), rs.getString(2), rs.getString(3)));
						}
					} finally {
						rs.close();
					}
				} finally {
					s.close();
				}
			} catch (SQLException e) {
				System.out.println("Could not provide list " + e.getMessage());
			} finally {
				db.closeConn();
			}
		}
		return result;
	}

	@Override
	public void update(Artist entity) {
		// TODO Auto-generated method stub
		Connection connection = db.getConn();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "UPDATE artist SET first_name = '" + entity.getFirstName() + "' , last_name = '"
						+ entity.getLastName() + "' WHERE artist_id = " + entity.getiD();
				try {
					s.executeUpdate(sql);
				} finally {
					s.close();
				}
			} catch (SQLException e) {
				System.out.println("Could not update artist " + e.getMessage());
			} finally {
				db.closeConn();
			}
		}

	}

	@Override
	public Artist find(Long key) {
		// TODO Auto-generated method stub
		Connection connection = db.getConn();
		Artist result = null;
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "SELECT artist_id, first_name, last_name FROM artist WHERE artist_id=" + key;

				try {
					ResultSet rs = s.executeQuery(sql);
					try {
						if (rs.next()) {
							result = new Artist(rs.getInt(1), rs.getString(2), rs.getString(3));
						}
					} finally {
						rs.close();
					}
				} finally {
					s.close();
				}
			} catch (SQLException e) {
				System.out.println("Could not find artist " + e.getMessage());
			} finally {
				db.closeConn();
			}
		}
		return result;
	}

	@Override
	public void remove(Long key) {
		// TODO Auto-generated method stub
		Connection connection = db.getConn();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "DELETE FROM artist WHERE artist_id=" + key;

				try {
					s.executeUpdate(sql);
				} finally {
					s.close();
				}
			} catch (SQLException e) {
				System.out.println("Could not remove artist " + e.getMessage());
			} finally {
				db.closeConn();
			}
		}

	}

}
