package youtunes;

import java.util.List;
 
public interface GenericDao<E, K>{
	
	public void add(E entity);	
	
	public List<E> list();
	
	public void update(E entity); 
	
	public E find(K key);
	
	public void remove(K key);

}
