package trg.talentsprint.starterkit.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import trg.talentsprint.starterkit.model.Customer;
import trg.talentsprint.starterkit.model.MyCartOrder;



@Repository
public interface MyCartOrderRepository extends JpaRepository<MyCartOrder, Integer> {

	//MyCart findByProductid(Product p);

	List<MyCartOrder> findByCust(Customer cust);
	
	//Customer findByCust(int cid);
	
	@Query("SELECT c FROM MyCartOrder c where c.totalAmount between :min and :max")
	public List<MyCartOrder> search(@Param("min") int min, @Param("max") int max);

	@Query("SELECT c FROM MyCartOrder c where c.orderdate between :mindate and :maxdate")
	public List<MyCartOrder> searchOrdersBetweenDates(@Param("mindate") Date mindate, @Param("maxdate") Date maxdate);

}

