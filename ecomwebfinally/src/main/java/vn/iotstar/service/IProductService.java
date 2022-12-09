package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import vn.iotstar.entity.Product;

public interface IProductService {

	
	
	List<Product> findBynameContaining(String name);

	void deleteAll();

	void delete(Product entity);

	void deleteById(Integer id);

	long count();

	Optional<Product> findById(Integer id);

	<S extends Product> Page<S> findAll(Example<S> example, Pageable pageable);

	Page<Product> findAll(Pageable pageable);

	List<Product> findAll();

	<S extends Product> S save(S entity);

	Product getById(Integer id);
	List<Product> findBytrademarkContaining(String trademark);
	List<Product> findByratingContaining(Integer rating);
	
	Integer avgRating(Product product);
}
