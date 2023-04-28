package vn.iotstar.model;

import java.util.Date;

import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class UserModel {

	private Integer id=1;
	private String firstName;
	private String lastName;
	private String email;
	private String phone;
	private String hashedpassword;// mật khẩu mã hóa
	private Boolean role = false;// mặt định là user, là admin hoặc user của 1 shop tạo ra
	private String address;
	private String avatar;
	private Boolean isSeller = false;
	private MultipartFile avatarFile;
	private Date createat;
	private Date updateat;
	private Boolean isActive = false;
	private Boolean isEdit = false;
	private String confirmPassword;
	private String newPassword;
	private float sum=0;
	

}
