package vn.iotstar.model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryModel {
	private Integer id;
	private String name;
	private String image;
	private Date createat;
	private Date updateat;
	private Boolean isdeleted;
	private Boolean isEdit = false;
}
