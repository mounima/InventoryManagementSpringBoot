package trg.talentsprint.starterkit.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "cartlineitem")
public class CartLineItem {
	
@Id
@Column(name="cart_lineitem_id")
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id;
	
@ManyToOne(cascade=CascadeType.ALL)
@JoinColumn(name="cart_id")
private MyCartOrder mycart;

@OneToOne
@JoinColumn(name="prod_id")
private Product product;

/*@OneToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "product_id", referencedColumnName = "prod_id")
private Product product;*/
	
private int quantitysold;
	
private int itemprice;

public CartLineItem() {
	super();
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public MyCartOrder getMycart() {
	return mycart;
}

public void setMycart(MyCartOrder mycart) {
	this.mycart = mycart;
}

public Product getProduct() {
	return product;
}

public void setProduct(Product product) {
	this.product = product;
}

public int getQuantitysold() {
	return quantitysold;
}

public void setQuantitysold(int quantitysold) {
	this.quantitysold = quantitysold;
}

public int getItemprice() {
	return itemprice;
}

public void setItemprice(int itemprice) {
	this.itemprice = itemprice;
}

@Override
public String toString() {
	return "CartLineItem [id=" + id + ", mycart=" + mycart + ", product=" + product + ", quantitysold=" + quantitysold
			+ ", itemprice=" + itemprice + "]";
}









}
