package vn.iotstar.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(columnDefinition = "nvarchar(50)")
	private String firstName;
	@Column(columnDefinition = "nvarchar(50)")
	private String lastName;

	private String email;
	private String phone;

	private String hashedpassword;// mật khẩu mã hóa
	private Boolean role;// mặt định là user, là admin hoặc user của 1 shop tạo ra
	@Column(columnDefinition = "nvarchar(255)")
	private String address;
	private String avatar;
	private Boolean isSeller;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date createat;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date updateat;

	@OneToMany(mappedBy = "user")
	List<Order> orders;
	@OneToMany(mappedBy = "user")
	List<Store> stores;
	
	/*
	 * @OneToOne(mappedBy = "user") private Store stores;
	 */

	@OneToMany(mappedBy = "user")
	List<Cart> carts;

	@OneToMany(mappedBy = "user")
	List<Review> reviews;

	@OneToMany(mappedBy = "user")
	List<Transaction> transactions;
}
