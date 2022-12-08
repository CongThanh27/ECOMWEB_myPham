package vn.iotstar.service;

import java.util.List;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import vn.iotstar.entity.Review;

public interface IReviewService {

	void deleteAll();

	void delete(Review entity);

	void deleteById(Integer id);

	long count();

	Optional<Review> findById(Integer id);

	List<Review> findAllById(Iterable<Integer> ids);

	List<Review> findAll(Sort sort);

	Page<Review> findAll(Pageable pageable);

	List<Review> findAll();

	<S extends Review> S save(S entity);

}
