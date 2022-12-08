package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Service;

import vn.iotstar.entity.User;
import vn.iotstar.Repository.UserRepository;
import vn.iotstar.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	UserRepository UserRepository;

	@Override
	public <S extends User> S save(S entity) {
		return UserRepository.save(entity);
	}

	@Override
	public <S extends User> Optional<S> findOne(Example<S> example) {
		return UserRepository.findOne(example);
	}

	@Override
	public Optional<User> findByEmail(String name) {
		return UserRepository.findByEmail(name);
	}

	@Override
	public List<User> findAll() {
		return UserRepository.findAll();
	}

	@Override
	public Page<User> findAll(Pageable pageable) {
		return UserRepository.findAll(pageable);
	}

	public <S extends User, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction) {
		return UserRepository.findBy(example, queryFunction);
	}

	@Override
	public List<User> findAll(Sort sort) {
		return UserRepository.findAll(sort);
	}

	@Override
	public List<User> findAllById(Iterable<Integer> ids) {
		return UserRepository.findAllById(ids);
	}

	@Override
	public <S extends User> Page<S> findAll(Example<S> example, Pageable pageable) {
		return UserRepository.findAll(example, pageable);
	}

	@Override
	public Optional<User> findById(Integer id) {
		return UserRepository.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return UserRepository.existsById(id);
	}

	@Override
	public long count() {
		return UserRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		UserRepository.deleteById(id);
	}

	@Override
	public void delete(User entity) {
		UserRepository.delete(entity);
	}

	@SuppressWarnings("deprecation")
	@Override
	public User getById(Integer id) {
		return UserRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		UserRepository.deleteAll();
	}
	
	@Override
	public Boolean checkLogin(String email, String hashedpassword) {
		Optional<User> optUser = findByEmail(email);
		if (optUser.isPresent() && optUser.get().getHashedpassword().equals(hashedpassword)) {
			return true;
		}
		return false;
	}

}
