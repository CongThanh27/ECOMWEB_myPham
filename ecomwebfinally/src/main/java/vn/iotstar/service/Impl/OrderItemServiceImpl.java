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

import vn.iotstar.Repository.OrderItemRepository;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.service.IOrderItemService;

@Service
public class OrderItemServiceImpl implements IOrderItemService {

	@Autowired
	OrderItemRepository orderItemRepository;

	@Override
	public <S extends OrderItem> S save(S entity) {
		return orderItemRepository.save(entity);
	}

	@Override
	public <S extends OrderItem> Optional<S> findOne(Example<S> example) {
		return orderItemRepository.findOne(example);
	}

	@Override
	public List<OrderItem> findAll() {
		return orderItemRepository.findAll();
	}

	@Override
	public Page<OrderItem> findAll(Pageable pageable) {
		return orderItemRepository.findAll(pageable);
	}

	@Override
	public List<OrderItem> findAll(Sort sort) {
		return orderItemRepository.findAll(sort);
	}

	@Override
	public List<OrderItem> findAllById(Iterable<Integer> ids) {
		return orderItemRepository.findAllById(ids);
	}

	@Override
	public Optional<OrderItem> findById(Integer id) {
		return orderItemRepository.findById(id);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void deleteInBatch(Iterable<OrderItem> entities) {
		orderItemRepository.deleteInBatch(entities);
	}

	@Override
	public void deleteAllInBatch(Iterable<OrderItem> entities) {
		orderItemRepository.deleteAllInBatch(entities);
	}

	@Override
	public <S extends OrderItem, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction) {
		return orderItemRepository.findBy(example, queryFunction);
	}

	@Override
	public long count() {
		return orderItemRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		orderItemRepository.deleteById(id);
	}

	@SuppressWarnings("deprecation")
	@Override
	public OrderItem getOne(Integer id) {
		return orderItemRepository.getOne(id);
	}

	@SuppressWarnings("deprecation")
	@Override
	public OrderItem getById(Integer id) {
		return orderItemRepository.getById(id);
	}

	@Override
	public void deleteAll() {
		orderItemRepository.deleteAll();
	}

}
