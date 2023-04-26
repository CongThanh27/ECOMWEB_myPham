package vn.iotstar.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StyleValueModel {
	Integer id;
	String name;
	Integer styleid;
	Boolean isdeleted;
	private Date createat;
	private Date updateat;
	private Boolean isEdit = false;
}
