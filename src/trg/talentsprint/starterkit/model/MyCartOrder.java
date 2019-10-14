package trg.talentsprint.starterkit.model;


import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "cart")
public class MyCartOrder{
	
	//private static final long serialVersionUID = 1L;

	@Id
	@Column(name="cart_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "code", referencedColumnName = "code")
    private Invoice invoice;
    
	public Invoice getInvoice() {
		return invoice;
	}

	public void setInvoice(Invoice invoice) {
		this.invoice = invoice;
	}


	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "customer_id", referencedColumnName = "cust_id")
	private Customer cust;
	
	
	/*@OneToMany(mappedBy = "mycart")
	List<Product> myprodidlist;*/
	
	@OneToMany
	@JoinColumn(name="cart_id")
	List<CartLineItem> cartlineitemslist;
	
	/*@OneToMany(cascade=CascadeType.ALL,mappedBy = "mycart")
	List<CartLineItem> cartlineitemslist;*/
	
    private int totalAmount;
	
	/*@Temporal(TemporalType.DATE)
	private Date orderdate;*/
    
    @Temporal(TemporalType.DATE)
	@Column(name="orderdate")
	private Date orderdate;
	
	
	/*@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "invoice", referencedColumnName = "code")
	private Invoice invoice;*/
	
	/*@ManyToOne
	@JoinColumn(name="prod_id")
	private Product productid;*/
	
    @PrePersist
	public void prePersist() {
    	orderdate = new Date();
	}
	
	public MyCartOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public List<CartLineItem> getCartlineitemslist() {
		return cartlineitemslist;
	}


	public void setCartlineitemslist(List<CartLineItem> cartlineitemslist) {
		this.cartlineitemslist = cartlineitemslist;
	}


	public int getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}


	public Date getOrderdate() {
		return orderdate;
	}


	public void setOrderdate(Date orderdate) {
		this.orderdate = orderdate;
	}


	public int getId() {
		return id;
	}

	

	public void setId(int id) {
		this.id = id;
	}

	public Customer getCust() {
		return cust;
	}

	public void setCust(Customer cust) {
		this.cust = cust;
	}

	@Override
	public String toString() {
		return "MyCartOrder [id=" + id + ", invoice=" + invoice + ", cust=" + cust + ", cartlineitemslist="
				+ cartlineitemslist + ", totalAmount=" + totalAmount + ", orderdate=" + orderdate + "]";
	}


	



	


	


	
	


	

}

