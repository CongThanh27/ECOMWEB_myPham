package vn.iotstar.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;

public interface IStoreService {

	<S extends Store> List<S> findAll(Example<S> example, Sort sort);

	void deleteAll();

	void delete(Store entity);

	void deleteById(Integer id);

	long count();

	Optional<Store> findById(Integer id);

	<S extends Store> Page<S> findAll(Example<S> example, Pageable pageable);

	Page<Store> findAll(Pageable pageable);

	List<Store> findAll();

	<S extends Store> S save(S entity);

	Store getById(Integer id);
	
	Optional<Store> findByUser(User user);

}
