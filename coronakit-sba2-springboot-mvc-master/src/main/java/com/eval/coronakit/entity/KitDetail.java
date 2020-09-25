package com.eval.coronakit.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "KIT_DETAIL")
public class KitDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "CORONA_KIT_ID")
	private int coronaKitId;
	
	@Column(name = "PRODUCT_ID")
	private int productId;
	private int quantity;
	private int amount;
	
	public KitDetail() {
		// TODO Auto-generated constructor stub
	}
	
	public KitDetail(int id, int coronaKitId, int productId, int quantity, int amount) {
		this.id = id;
		this.coronaKitId = coronaKitId;
		this.productId = productId;
		this.quantity = quantity;
		this.amount = amount;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCoronaKitId() {
		return coronaKitId;
	}
	public void setCoronaKitId(int coronaKitId) {
		this.coronaKitId = coronaKitId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}
