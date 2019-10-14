package trg.talentsprint.starterkit.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "customer")
public class Customer {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="cust_id")
	private int custid;  //findById(
	
	@Column(name = "custname")
	private String customername;  //findByCustomername
	
	@Column(name = "custaddress")
	private String customeraddress;
	
	@Column(name = "custstreet")
	private String customerstreet;
	
	@Column(name = "custcity")
	private String customercity;
	
	@Column(name = "custpincode")
	private long customerpincode;
	
	@Column(name = "currdate")
	@CreationTimestamp
	private LocalDateTime currentdate;
	
	
	//@OneToOne(cascade = CascadeType.ALL)
	//@JoinColumn(name = "cust")
	//private Order orderc;

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public Customer(int custid, String customername, String customeraddress, String customerstreet, String customercity,
			long customerpincode, LocalDateTime currentdate) {
		super();
		this.custid = custid;
		this.customername = customername;
		this.customeraddress = customeraddress;
		this.customerstreet = customerstreet;
		this.customercity = customercity;
		this.customerpincode = customerpincode;
		this.currentdate = currentdate;
		//this.orderc = orderc;
	}



	public int getCustid() {
		return custid;
	}


	public void setCustid(int custid) {
		this.custid = custid;
	}


	public String getCustomername() {
		return customername;
	}


	public void setCustomername(String customername) {
		this.customername = customername;
	}


	public String getCustomeraddress() {
		return customeraddress;
	}


	public void setCustomeraddress(String customeraddress) {
		this.customeraddress = customeraddress;
	}


	public String getCustomerstreet() {
		return customerstreet;
	}


	public void setCustomerstreet(String customerstreet) {
		this.customerstreet = customerstreet;
	}


	public String getCustomercity() {
		return customercity;
	}


	public void setCustomercity(String customercity) {
		this.customercity = customercity;
	}


	public long getCustomerpincode() {
		return customerpincode;
	}


	public void setCustomerpincode(long customerpincode) {
		this.customerpincode = customerpincode;
	}


	public LocalDateTime getCurrentdate() {
		return currentdate;
	}


	public void setCurrentdate(LocalDateTime currentdate) {
		this.currentdate = currentdate;
	}


	@Override
	public String toString() {
		return "Customer [custid=" + custid + ", customername=" + customername + ", customeraddress=" + customeraddress
				+ ", customerstreet=" + customerstreet + ", customercity=" + customercity + ", customerpincode="
				+ customerpincode + ", currentdate=" + currentdate + "]";
	}


	


	/*public Order getOrderc() {
		return orderc;
	}


	public void setOrderc(Order orderc) {
		this.orderc = orderc;
	}*/


	

	
}

