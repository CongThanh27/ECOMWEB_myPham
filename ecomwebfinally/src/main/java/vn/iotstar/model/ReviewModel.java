package vn.iotstar.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewModel {
	private Integer id;
	private Integer userid;
	private String lastname;
	private String fistname;
	private String imgages;
	private Integer productid;
	private String content;
	private Integer rating;
	private Date createat;
	private Date updateat;
	private Boolean isEdit = false;
	
}
