package vn.iotstar.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "store")
public class Store {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(columnDefinition = "nvarchar(200)")
	private String name;
	@Column(columnDefinition = "nvarchar(MAX)")
	private String bio;// mô tả
	// private Integer ownerId;// từ user nào id user
	@ManyToOne
	@JoinColumn(name = "ownerid")
	private User user;

	@OneToMany(mappedBy = "store")
	List<Order> order;

	private Boolean isactive;// được duyệt đưa vào bán

	private String avatar;// ảnh của shop

	private String featuredimages;

	private Integer rating;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date createat;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date updaeat;

	@OneToMany(mappedBy = "store")
	List<Cart> carts;

	@OneToMany(mappedBy = "store")
	List<Product> products;

	@OneToMany(mappedBy = "store")
	List<Transaction> transactions;

}
