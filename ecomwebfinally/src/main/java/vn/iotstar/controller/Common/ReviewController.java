package vn.iotstar.controller.Common;

import java.util.Date;
import java.util.List;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.model.ProductModel;
import vn.iotstar.model.ReviewModel;
import vn.iotstar.model.UserModel;
import vn.iotstar.entity.User;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Review;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IReviewService;
import vn.iotstar.service.IUserService;

@Controller

@RequestMapping("user/reviews")
public class ReviewController {
	@Autowired
	IReviewService reviewService;

	@Autowired
	IUserService userService;

	@Autowired
	IProductService productService;

	// Lấy danh sách user trong bảng user
	@ModelAttribute("users")
	public List<UserModel> getUsers() {
		return userService.findAll().stream().map(item -> {
			UserModel review = new UserModel();
			BeanUtils.copyProperties(item, review);
			return review;
		}).toList();
	}

	// Lấy danh sách user trong bảng product
	@ModelAttribute("products")
	public List<ProductModel> getProducts() {
		return productService.findAll().stream().map(item -> {
			ProductModel review = new ProductModel();
			BeanUtils.copyProperties(item, review);
			return review;
		}).toList();
	}

	@RequestMapping("")
	public String list(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Review> list = reviewService.findAll();

		// chuyển dữ liệu từ list lên biến views

		model.addAttribute("reviews", list);

		return "user/reviews/list";

	}

	@GetMapping("add")
	public String Add(ModelMap model) {
		ReviewModel review = new ReviewModel();
		review.setIsEdit(false);
		model.addAttribute("review", review);
		return "user/reviews/add";
	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("review") ReviewModel review,
			BindingResult result) {
		/*
		 * if (result.hasErrors()) { return new ModelAndView("user/reviews/add");
		 * }
		 */
		Review entity = new Review();
		// copy từ Model sang entity
		BeanUtils.copyProperties(review, entity);

		// Xử lý User
		User uEntity = userService.getById(review.getUserid());
		entity.setUser(uEntity);
		// Xử lý Product
		Product proEntity = productService.getById(review.getProductid());
		
		entity.setProduct(proEntity);
		
		Date date = new Date();
		
		if (review.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
		}
		
		reviewService.save(entity);

		String message = "";
		if (review.getIsEdit() == true) {
			message = "Review đã được cập nhật";
		} else {
			message = "Review đã được thêm thành công";
		}
		model.addAttribute("message", message);
		return new ModelAndView("forward:/user/reviews", model);
	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) {

		Optional<Review> opt = reviewService.findById(id);

		ReviewModel review = new ReviewModel();
		if (opt.isPresent()) {
			Review entity = opt.get();
			BeanUtils.copyProperties(entity, review); // copy từ entity sang model
			review.setIsEdit(true);
			review.setUserid(entity.getUser().getId());
			review.setProductid(entity.getProduct().getId());
			model.addAttribute("review", review);
			return new ModelAndView("user/reviews/edit", model);
		}
		// Trả về thông báo
		model.addAttribute("message", "Review không tồn tại");
		return new ModelAndView("forward:/user/reviews", model);
	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		reviewService.deleteById(id);

		model.addAttribute("message", "Review đã được xóa thành công");

		// redirect: chuyển nội dung vào trang mới
		// forward: nhúng nội dung vào một trang nào đó
		return new ModelAndView("redirect:/user/reviews", model);
	}

	// "name" từ phần views truyền xuống
	// required=false: không nhập hiện ra list ban đầu
}
