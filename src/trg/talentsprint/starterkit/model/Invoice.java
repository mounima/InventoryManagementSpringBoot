package trg.talentsprint.starterkit.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "invoice")
public class Invoice extends Model implements Serializable
{
  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Column(name = "code", unique = true, updatable = false)
  @NotNull
  private final String code;
  
  @Temporal(TemporalType.DATE)
	@Column(name="created_at")
	private Date createdAt;
  
  
  @OneToOne(cascade = CascadeType.ALL)
  @JoinColumn(name = "cartid", referencedColumnName = "cart_id")
	private MyCartOrder cart;
	

  public MyCartOrder getCart() {
	return cart;
}

public void setCart(MyCartOrder cart) {
	this.cart = cart;
}

/**
   * Deliberately hidden to prevent direct instantiation.
   */
  @PrePersist
	public void prePersist() {
		createdAt = new Date();
	}

  Invoice()
  {
    this(null);
  }

  /**
   * Creates an invoice with a specified unique code.
   *
   * @param code The unique invoice code.
   */
  public Invoice(final String code)
  {
	 
    this.code = "INV"+code;
  }

  /**
   * Gets the unique invoice code.
   *
   * @return The unique invoice code.
   */
  public String getCode()
  {
    return code;
  }
  
  public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "Invoice [code=" + code + ", createdAt=" + createdAt + ", cart=" + cart + "]";
	}
	
	
	

	

	
	
	
}
