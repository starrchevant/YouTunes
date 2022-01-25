package youtunes;

public class Artist {
	
	private long id;
	private String firstName;
	private String lastName;
	
	public Artist(long i, String f, String l){
		this.id = i;
		this.firstName = f;
		this.lastName = l;
		
	}
	
	public long getiD() {
		return id;
	}
	public void setiD(long id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firName) {
		this.firstName = firName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lasName) {
		this.lastName = lasName;
	}
	@Override
	public String toString() {
		return "Artist{artistId=" + id + ", firstName=" + firstName + ", lasName=" + lastName + "]";
	}
	
	
	
	

}
