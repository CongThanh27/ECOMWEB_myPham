package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import vn.iotstar.Repository.ReviewRepository;
import vn.iotstar.entity.Review;
import vn.iotstar.service.IReviewService;

@Service
public class ReviewServiceImpl implements IReviewService{
	@Autowired
	ReviewRepository reviewRepository;

	public ReviewServiceImpl(ReviewRepository reviewRepository) {
		this.reviewRepository = reviewRepository;
	}

	@Override
	public <S extends Review> S save(S entity) {
		return reviewRepository.save(entity);
	}

	@Override
	public List<Review> findAll() {
		return reviewRepository.findAll();
	}

	@Override
	public Page<Review> findAll(Pageable pageable) {
		return reviewRepository.findAll(pageable);
	}

	@Override
	public List<Review> findAll(Sort sort) {
		return reviewRepository.findAll(sort);
	}

	@Override
	public List<Review> findAllById(Iterable<Integer> ids) {
		return reviewRepository.findAllById(ids);
	}

	@Override
	public Optional<Review> findById(Integer id) {
		return reviewRepository.findById(id);
	}

	@Override
	public long count() {
		return reviewRepository.count();
	}

	@Override
	public void deleteById(Integer id) {
		reviewRepository.deleteById(id);
	}

	@Override
	public void delete(Review entity) {
		reviewRepository.delete(entity);
	}

	@Override
	public void deleteAll() {
		reviewRepository.deleteAll();
	}

	
	
	
}
