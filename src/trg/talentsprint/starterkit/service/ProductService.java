package trg.talentsprint.starterkit.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;

import trg.talentsprint.starterkit.model.Invoice;
import trg.talentsprint.starterkit.model.Product;
import trg.talentsprint.starterkit.repository.ProductRepository;

@Service
@Transactional
public class ProductService {
	
	@Autowired
	private ProductRepository productrepository;

	public ProductService(ProductRepository productrepository) {
		this.productrepository = productrepository;
	}
	
	public void saveMyProduct(Product product){
		productrepository.save(product);
	}

	public List<Product> findAll() {
		return (List<Product>) productrepository.findAll();
	}
	
	public Product findbyProductname(String productname) {
		return productrepository.findByProductname(productname);
	}
	
	
	public List<String> search(String searchTerm) throws Exception {
		return productrepository.search(searchTerm);
		
	}
	
	public List<Product> findAllAvailableProducts() {
		return productrepository.findAllAvailableProducts();
	}

	public Product findById(int productid) {
		// TODO Auto-generated method stub
		return productrepository.findByProductid(productid);
	}

	/*public List<Product> getStudentsByPage(int pageid, int total) {
		// TODO Auto-generated method stub
		return productrepository.findById(pageid,total);
	}*/

	public void delete(Product p) {
         productrepository.delete(p);		
	}

	public void deleteAll() {
		productrepository.deleteAll();
		
	}


	
	


}
