package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;

@Repository
public interface StoreRepository  extends JpaRepository<Store, Integer> {
	
	Store findByUser(User user);

}
