package vn.iotstar.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class UserModel {

	private Integer id;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String hashedpassword;// mật khẩu mã hóa
	private Boolean role;// mặt định là user, là admin hoặc user của 1 shop tạo ra
	private String address;
	private String avatar;
	private Boolean isSeller;
	private MultipartFile avatarFile;
	private Date createat;
	private Date updateat;
	private Boolean isActive;
	private Boolean isEdit = false;

}
