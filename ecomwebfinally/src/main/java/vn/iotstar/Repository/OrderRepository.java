package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Order;
import vn.iotstar.entity.Store;
@Repository
public interface OrderRepository extends JpaRepository< Order, Integer >{

	List<Order> findAllByStore(Store store);
	
	
}
