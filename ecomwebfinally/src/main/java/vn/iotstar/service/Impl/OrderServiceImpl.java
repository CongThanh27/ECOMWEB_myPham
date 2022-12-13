package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;

import javax.persistence.EntityManagerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;



import vn.iotstar.Repository.OrderRepository;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.service.IOrderService;
@Service
public class OrderServiceImpl implements IOrderService {
	@Autowired
	OrderRepository orderRepository;
	

	@Override
	public <S extends Order> S save(S entity) {
		return orderRepository.save(entity);
	}

	@Override
	public <S extends Order> Optional<S> findOne(Example<S> example) {
		return orderRepository.findOne(example);
	}

	@Override
	public List<Order> findAll() {
		return orderRepository.findAll();
	}

	@Override
	public Page<Order> findAll(Pageable pageable) {
		return orderRepository.findAll(pageable);
	}

	@Override
	public List<Order> findAll(Sort sort) {
		return orderRepository.findAll(sort);
	}

	@Override
	public List<Order> findAllById(Iterable<Integer> ids) {
		return orderRepository.findAllById(ids);
	}

	@Override
	public <S extends Order> Page<S> findAll(Example<S> example, Pageable pageable) {
		return orderRepository.findAll(example, pageable);
	}

	@Override
	public Optional<Order> findById(Integer id) {
		return orderRepository.findById(id);
	}

	@Override
	public boolean existsById(Integer id) {
		return orderRepository.existsById(id);
	}

	@Override
	public long count() {
		return orderRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		orderRepository.deleteById(id);
	}

	@Override
	public void delete(Order entity) {
		orderRepository.delete(entity);
	}

	@Override
	public Order getById(Integer id) {
		return orderRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		orderRepository.deleteAll();
	}
	
	@Override
	public List<Order> findAllByStore(Store store) {
		return orderRepository.findAllByStore(store);
	}

	@Override
	public int countByUser(User user) {
		// TODO Auto-generated method stub
		return orderRepository.countByUser(user);
	}

	@Override
	public List<Order> findTop10ByOrderByCreateatDesc() {
		// TODO Auto-generated method stub
		return orderRepository.findTop10ByOrderByCreateatDesc();
	}
	
}
