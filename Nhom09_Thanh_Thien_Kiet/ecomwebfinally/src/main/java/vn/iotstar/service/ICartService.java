package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;

public interface ICartService {

	void deleteAll();

	Cart getById(Integer id);

	void delete(Cart entity);

	void deleteById(Integer id);

	long count();

	boolean existsById(Integer id);

	Optional<Cart> findById(Integer id);

	<S extends Cart> Page<S> findAll(Example<S> example, Pageable pageable);

	List<Cart> findAllById(Iterable<Integer> ids);

	List<Cart> findAll(Sort sort);

	Page<Cart> findAll(Pageable pageable);

	List<Cart> findAll();

	<S extends Cart> Optional<S> findOne(Example<S> example);

	<S extends Cart> S save(S entity);
	Optional<Cart> findByStore(Store store);
	Optional<Cart> findByUser(User user);
	List<Cart> findByStore(Integer Storeid);
	List<Cart> findByUser(Integer id);
	Optional<Cart> findByUserAndStore(User user, Store store);

}
