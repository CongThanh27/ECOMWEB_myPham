package vn.iotstar.Repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Category;
import vn.iotstar.entity.User;
@Repository
public interface UserRepository extends JpaRepository< User, Integer >{
	
	User findByEmail(String email);
	
	User findByPhone(String phone);
	
}
