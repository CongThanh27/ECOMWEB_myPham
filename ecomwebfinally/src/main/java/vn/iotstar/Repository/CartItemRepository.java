package vn.iotstar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.User;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
	long countByCart(Cart cart);
	List<CartItem> findTop10ByOrderByCreateatDesc();
}
