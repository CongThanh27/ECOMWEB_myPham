package vn.iotstar.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.iotstar.entity.Order;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderModel {
	private Integer id;
	private Integer userid;
	private Integer storeid;
	private Integer delivereid;
	private String address;
	private Integer phone;
	private String status; // Trang thai don hang
	private float price;
	private Date createat;
	private Date updateat;
	private Boolean isEdit = false;
}
