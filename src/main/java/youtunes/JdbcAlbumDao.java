package youtunes;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class JdbcAlbumDao implements AlbumDao {

	private JdbcManager db;

	public JdbcAlbumDao() {
		db = new JdbcManager();
	}

	@Override
	public void add(Album entity) {
		// TODO Auto-generated method stub
		Connection connection = db.getConn();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "INSERT INTO album(title, price, genre, img_url, artist_id) VALUES('" + entity.getTitle()
						+ "' , " + entity.getPrice() + ", '" + entity.getGenre() + "' , '" + entity.getImg_url()
						+ "' , " + entity.getArtist_id() + " )";

				try {
					s.executeUpdate(sql);

					} finally {
						s.close();
					}
				
			} catch (SQLException e) {
				System.out.println("Could not insert ablum " + e.getMessage());
			} finally {
				db.closeConn();
			}
		}
	}

	@Override
	public List<Album> list() {
		// TODO Auto-generated method stub
		LinkedList<Album> result = new LinkedList<Album>();
		Connection connection = db.getConn();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "SELECT album_id, title, price, genre, img_url, artist_id FROM album";
				try {
					ResultSet rs = s.executeQuery(sql);
					try {
						while (rs.next()) {
							result.add(new Album(rs.getLong(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
									rs.getString(5), rs.getLong(6)));
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
	public void update(Album entity) {
		// TODO Auto-generated method stub
		Connection connection = db.getConn();
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "UPDATE album SET title = '" + entity.getTitle() + "' , price = " + entity.getPrice()
						+ " , genre = '" + entity.getGenre() + "', img_url = '" + entity.getImg_url()
						+ "' , artist_id = " + entity.getArtist_id() + " WHERE album_id = " + entity.getAlbum_id();
				try {
					s.executeUpdate(sql);
					
				} finally {
					s.close();
				}
			} catch (SQLException e) {
				System.out.println("Could not update album " + e.getMessage());
			} finally {
				db.closeConn();
			}
		}

	}

	@Override
	public Album find(Long key) {
		// TODO Auto-generated method stub
		Connection connection = db.getConn();
		Album result = null;
		if (connection != null) {
			try {
				Statement s = connection.createStatement();
				String sql = "SELECT album_id, title, price, genre, img_url, artist_id FROM album WHERE album_id=" + key;

				try {
					ResultSet rs = s.executeQuery(sql);
					try {
						if (rs.next()) {
							result = new Album(rs.getLong(1), rs.getString(2), rs.getDouble(3), rs.getString(4),
									rs.getString(5), rs.getLong(6));						
						}
					} finally {
						rs.close();
					}
				} finally {
					s.close();
				}
			} catch (SQLException e) {
				System.out.println("Could not find album " + e.getMessage());
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
				String sql = "DELETE FROM album WHERE album_id=" + key;

				try {
					s.executeUpdate(sql);
					
				} finally {
					s.close();
				}
			} catch (SQLException e) {
				System.out.println("Could not remove album " + e.getMessage());
			} finally {
				db.closeConn();
			}
		}

	}

}
