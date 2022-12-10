package vn.iotstar.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;
import vn.iotstar.entity.Cart;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Integer> {
	//Optional<Cart> findByStore(Store store);
	Optional<Cart> findByUser(User user);
	//Optional<Cart> findByStore(Optional<Store> store);
	Optional<Cart> findByStore(Store store);
	
}
