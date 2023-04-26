package vn.iotstar.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommissionModel {
	private Integer id;
	private String name;
	private Double cost;
	private String desciption;
	private Boolean isdeleted;
	
	private Date createat;
	private Date updateat;
	
	private Boolean isEdit = false;
}
