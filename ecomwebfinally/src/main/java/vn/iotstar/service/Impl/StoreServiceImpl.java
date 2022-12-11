package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.Repository.StoreRepository;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.service.IStoreService;

@Service
public class StoreServiceImpl  implements IStoreService{
	@Autowired
	StoreRepository storerepository;

	@Override
	public <S extends Store> S save(S entity) {
		return storerepository.save(entity);
	}

	@Override
	public Store getById(Integer id) {
		return storerepository.getById(id);
	}

	@Override
	public List<Store> findAll() {
		return storerepository.findAll();
	}

	@Override
	public Page<Store> findAll(Pageable pageable) {
		return storerepository.findAll(pageable);
	}

	@Override
	public <S extends Store> Page<S> findAll(Example<S> example, Pageable pageable) {
		return storerepository.findAll(example, pageable);
	}

	@Override
	public Optional<Store> findById(Integer id) {
		return storerepository.findById(id);
	}

	@Override
	public long count() {
		return storerepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		storerepository.deleteById(id);
	}

	@Override
	public void delete(Store entity) {
		storerepository.delete(entity);
	}

	@Override
	public void deleteAll() {
		storerepository.deleteAll();
	}

	@Override
	public <S extends Store> List<S> findAll(Example<S> example, Sort sort) {
		return storerepository.findAll(example, sort);
	}
	
	@Override
	public Store findByUser(User user) {
		return storerepository.findByUser(user);
	}
	
	
	

}
