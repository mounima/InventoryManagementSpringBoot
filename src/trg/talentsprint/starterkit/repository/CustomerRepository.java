package trg.talentsprint.starterkit.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer,Integer>{

	public Customer findByCustomername(String customername);
	
	public Customer findByCustid(int custid);


}
