package vn.iotstar.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import vn.iotstar.entity.CartItem;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItemModel {
	private Integer id;
	private Integer cartid;
	private Integer productid;
	private Integer count;
	private Date createat;
	private Date updaeat;
	private Boolean isEdit = false;
}
