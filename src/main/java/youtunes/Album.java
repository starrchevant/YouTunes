package youtunes;

public class Album {
	private Long album_id;
	private String title;
	private Double price;
	private String genre;
	private String img_url;
	private Long artist_id;
	public Album(Long album_id, String title, Double price, String genre, String img_url, Long artist_id) {
		this.album_id = album_id;
		this.title = title;
		this.price = price;
		this.genre = genre;
		this.img_url = img_url;
		this.artist_id = artist_id;
	}
	@Override
	public String toString() {
		return "Album [album_id=" + album_id + ", title=" + title + ", price=" + price + ", genre=" + genre
				+ ", img_url=" + img_url + ", artist_id=" + artist_id + "]";
	}
	public Long getAlbum_id() {
		return album_id;
	}
	public void setAlbum_id(Long album_id) {
		this.album_id = album_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public Long getArtist_id() {
		return artist_id;
	}
	public void setArtist_id(Long artist_id) {
		this.artist_id = artist_id;
	}
}
