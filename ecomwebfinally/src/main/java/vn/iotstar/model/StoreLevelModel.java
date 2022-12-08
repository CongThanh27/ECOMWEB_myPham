package vn.iotstar.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreLevelModel {
	private Integer id;
	private String name;
	private Integer minPoint;
	private Double discount;
	private Boolean isDeleted;
	private Date createAt;
	private Date updaeAt;
	
	private Boolean isEdit = false;
}
