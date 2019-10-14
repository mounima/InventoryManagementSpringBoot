package trg.talentsprint.starterkit.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import trg.talentsprint.starterkit.model.Customer;
import trg.talentsprint.starterkit.model.MyCartOrder;
import trg.talentsprint.starterkit.repository.MyCartOrderRepository;

@Service
@Transactional
public class MyCartOrderService {

	@Autowired
	MyCartOrderRepository myCartRepo;

	public void save(MyCartOrder myOrder) {
		

		myCartRepo.save(myOrder);
	}

	public List<MyCartOrder> findall() {

		return (List<MyCartOrder>) myCartRepo.findAll();
	}

	/*public MyCart findByProductid(Product p) {

		return myCartRepo.findByProductid(p);
	}*/
	
	/*public Customer findByCustomerid(Customer customer) {

		return myProductRepo.findByCust(customer);
	}*/
	
	public List<MyCartOrder> findListByCustomerId(Customer cust) {
		List<MyCartOrder> Myproductlist = new ArrayList<>();
		for (MyCartOrder fav : myCartRepo.findByCust(cust)) {
			Myproductlist.add(fav);
		}
		return Myproductlist;

	} 

	public void deleteMyProd(int productid) {
		myCartRepo.deleteById(productid);

	}

	public List<MyCartOrder> findList() {
		List<MyCartOrder> Myproductlist = new ArrayList<>();
		for (MyCartOrder fav : myCartRepo.findAll()) {
			Myproductlist.add(fav);
		}
		return Myproductlist;

	}
	
	public List<MyCartOrder> search(int min,int max){
		System.out.println(min);
		System.out.println(max);
		return myCartRepo.search(min, max);
	}

	public List<MyCartOrder> searchOrdersBetweenDates(Date mindate, Date maxdate) {
		// TODO Auto-generated method stub
		return myCartRepo.searchOrdersBetweenDates(mindate, maxdate);
	}


}
