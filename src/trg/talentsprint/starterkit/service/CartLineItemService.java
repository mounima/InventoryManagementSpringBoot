package trg.talentsprint.starterkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import trg.talentsprint.starterkit.model.CartLineItem;
import trg.talentsprint.starterkit.model.Invoice;
import trg.talentsprint.starterkit.model.Product;
import trg.talentsprint.starterkit.repository.CartLineItemRepository;


@Service
@Transactional
public class CartLineItemService {
	
	@Autowired
	private CartLineItemRepository cartlineitemrepository;
	
	public CartLineItemService(CartLineItemRepository cartlineitemrepository) {
		this.cartlineitemrepository = cartlineitemrepository;
	}
	
	public void saveMyCartLineItem(CartLineItem cartlineitem){
		cartlineitemrepository.save(cartlineitem);
	}
	
	public List<CartLineItem> findAll() {
		return (List<CartLineItem>) cartlineitemrepository.findAll();
	}
	
	/*@Query("SELECT code FROM invoice where join invoice ON cartlineitem.cart_id=invoice.cartid where cartid=cart_id")
	public String search(@Param("cart_id") int cart_id); /*{
		return (String) cartlineitemrepository.searchInvoicenumber();
		 
	}
*/
}
