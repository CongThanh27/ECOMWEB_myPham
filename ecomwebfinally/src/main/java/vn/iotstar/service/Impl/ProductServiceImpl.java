package vn.iotstar.service.Impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.iotstar.Repository.ProductRepository;
import vn.iotstar.entity.Product;
import vn.iotstar.service.IProductService;
import org.springframework.util.StringUtils;
@Service
public class ProductServiceImpl implements IProductService{

	@Autowired
	ProductRepository productRepository;

	
	
	@Override
	public <S extends Product> S save(S entity) {
		if (entity.getId() == null) {

			return productRepository.save(entity);

		} else {

			Optional<Product> opt = findById(entity.getId());

				if (opt.isPresent()) {

				if (StringUtils.isEmpty(entity.getListimage())) {
					entity.setListimage(opt.get().getListimage());
				}
				else 
				{
					entity.setListimage(entity.getListimage());
				}
				
				if (StringUtils.isEmpty(entity.getListimage1())) {
					entity.setListimage1(opt.get().getListimage1());
				}
				else 
				{
					entity.setListimage1(entity.getListimage1());
				}
				
				if (StringUtils.isEmpty(entity.getListimage2())) {
					entity.setListimage2(opt.get().getListimage2());
				}
				else 
				{
					entity.setListimage2(entity.getListimage2());
				}
			}
			return productRepository.save(entity);
		}
	}



	@Override
	public List<Product> findAll() {
		return productRepository.findAll();
	}



	@Override
	public Page<Product> findAll(Pageable pageable) {
		return productRepository.findAll(pageable);
	}



	@Override
	public Product getById(Integer id) {
		return productRepository.getById(id);
	}



	@Override
	public <S extends Product> Page<S> findAll(Example<S> example, Pageable pageable) {
		return productRepository.findAll(example, pageable);
	}



	@Override
	public Optional<Product> findById(Integer id) {
		return productRepository.findById(id);
	}



	@Override
	public long count() {
		return productRepository.count();
	}



	@Override
	public void deleteById(Integer id) {
		productRepository.deleteById(id);
	}



	@Override
	public void delete(Product entity) {
		productRepository.delete(entity);
	}



	@Override
	public void deleteAll() {
		productRepository.deleteAll();
	}



	public List<Product> findBynameContaining(String name) {
		return productRepository.findBynameContaining(name);
	}



	@Override
	public List<Product> findBytrademarkContaining(String trademark) {
		// TODO Auto-generated method stub
		return productRepository.findBytrademarkContaining(trademark);
	}



	@Override
	public List<Product> findByratingContaining(Integer rating) {
		// TODO Auto-generated method stub
		return productRepository.findByratingContaining(rating);
	}
	
	
	
}
