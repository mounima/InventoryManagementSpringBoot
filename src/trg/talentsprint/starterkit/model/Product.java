package trg.talentsprint.starterkit.model;



import javax.persistence.*;


@Entity
@Table(name = "product")
public class Product {
	@Id
	@Column(name="prod_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productid;

	private String productname;

	private String productserialnumber;

	private int quantitesreceived;

	private int priceperunit;

	private String vendorname;
	
	private int quantityavailable;
	

public int getQuantityavailable() {
		return quantityavailable;
	}




	public void setQuantityavailable(int quantityavailable) {
		this.quantityavailable = quantityavailable;
	}



	
	public Product() {
		super();
	}





	public Product(int productid, String productname, String productserialnumber, int quantitesreceived,
			int priceperunit, String vendorname, int quantityavailable) {
		super();
		this.productid = productid;
		this.productname = productname;
		this.productserialnumber = productserialnumber;
		this.quantitesreceived = quantitesreceived;
		this.priceperunit = priceperunit;
		this.vendorname = vendorname;
		this.quantityavailable = quantityavailable;
	}




	



	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getProductserialnumber() {
		return productserialnumber;
	}

	public void setProductserialnumber(String productserialnumber) {
		this.productserialnumber = productserialnumber;
	}

	public int getQuantitesreceived() {
		return quantitesreceived;
	}

	public void setQuantitesreceived(int quantitesreceived) {
		this.quantitesreceived = quantitesreceived;
	}

	public int getPriceperunit() {
		return priceperunit;
	}

	public void setPriceperunit(int priceperunit) {
		this.priceperunit = priceperunit;
	}

	public String getVendorname() {
		return vendorname;
	}

	public void setVendorname(String vendorname) {
		this.vendorname = vendorname;
	}







	@Override
	public String toString() {
		return "Product [productid=" + productid + ", productname=" + productname + ", productserialnumber="
				+ productserialnumber + ", quantitesreceived=" + quantitesreceived + ", priceperunit=" + priceperunit
				+ ", vendorname=" + vendorname + ", quantityavailable=" + quantityavailable  + "]";
	}








	



	




	




	
 
	/*@ManyToOne
    @JoinColumn(name = "products")
	private Order orderp;

	public Order getOrderp() {
		return orderp;
	}

	public void setOrderp(Order orderp) {
		this.orderp = orderp;
	}
*/
		

}
