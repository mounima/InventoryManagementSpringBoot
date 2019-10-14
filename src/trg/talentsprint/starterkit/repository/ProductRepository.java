package trg.talentsprint.starterkit.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import trg.talentsprint.starterkit.model.Product;

public interface ProductRepository extends CrudRepository<Product,Integer>{

	Product findByProductname(String productname);
	
	@Query("SELECT productname FROM Product where productname like %:keyword%")
	public List<String> search(@Param("keyword") String keyword);

	//List<Product> fetch(String searchTerm) throws Exception;
	
	@Query("SELECT p FROM Product p where p.quantityavailable > 0")
    public List<Product> findAllAvailableProducts();

	public Product findByProductid(int id);

	/*@Query("SELECT p FROM Product p limit \"+(pageid-1)+\",\"+total")
	public List<Product> findById(int pageid, int total);*/
}