package trg.talentsprint.starterkit.repository;

import org.springframework.data.repository.CrudRepository;

import trg.talentsprint.starterkit.model.CartLineItem;
import trg.talentsprint.starterkit.model.Product;

public interface CartLineItemRepository extends CrudRepository<CartLineItem,Integer> {

	//String searchInvoicenumber();
	
	//Product findByProductname(String productname);
	
	

}
