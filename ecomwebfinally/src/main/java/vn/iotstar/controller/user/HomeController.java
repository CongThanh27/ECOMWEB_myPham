package vn.iotstar.controller.user;


import java.nio.file.Path;
import java.sql.Date;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/user")
public class HomeController {
	@Autowired
	ICategoryService categoryService;
	
	@Autowired
	IProductService productService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	IUserService userService;
	
	@Autowired
	ServletContext application;
	
	
	
	@GetMapping("/profile/{id}")
	public String showProfile(ModelMap model, @PathVariable("id")Integer id) {
		Optional<User> user = userService.findById(id);
		
		UserModel userModel = new UserModel();
		BeanUtils.copyProperties(user.get(), userModel);
		model.addAttribute("user", userModel);
		return "/user/profile";
	}
	@GetMapping("")
	public String list(ModelMap model) {
		List<Category> cate = categoryService.findTop3ByOrderByIdAsc();		
		model.addAttribute("category", cate);
		
		List<Product> list = productService.findTop10ByOrderByCreateatDesc();
		model.addAttribute("product", list);
		
		List<Product> listBest = productService.findTop13ByOrderBySoldDesc();
		model.addAttribute("productb", listBest);
		return "index";
	}
	
	@GetMapping("/logout")
	public String logout() {
		session.removeAttribute("user");
		return "redirect:/";
	}
	
	@PostMapping("/saveProfile")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("user") UserModel user,
			BindingResult result) {
		User entity = new User();

		/*
		 * if (result.hasErrors()) { model.addAttribute("message", "Có lỗi"); return new
		 * ModelAndView("redirect:/user", model); }
		 */

		if (!user.getAvatarFile().isEmpty()) {
			String path = application.getRealPath("/");

			try {
				user.setAvatar(user.getAvatarFile().getOriginalFilename());
				String filePath = path + "/resources/images/user/" + user.getAvatar();
				user.getAvatarFile().transferTo(Path.of(filePath));
				user.setAvatarFile(null);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		BeanUtils.copyProperties(user, entity);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (user.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setCreateat(date);
			entity.setUpdateat(date);
		}

		userService.save(entity);
		session.setAttribute("message", "Cập nhật tài khoản thành công");
		return new ModelAndView("redirect:/user/profile/" + user.getId(), model);

	}
	
	@PostMapping("/changePassword")
	public ModelAndView changePasswordProcess(ModelMap model, @RequestParam String hashedpassword,
		@RequestParam String newPassword,
		@RequestParam String confirmPassword,
		@Valid @ModelAttribute("user") UserModel user,
		BindingResult result) {
		User entity = new User();
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);
		BeanUtils.copyProperties(user, entity);
		if(hashedpassword.equals(user.getHashedpassword())) {
			if (newPassword.equals(confirmPassword)) {
				entity.setHashedpassword(newPassword);
				entity.setUpdateat(date);
				userService.save(entity);
				System.out.println("Update complete");
				return new ModelAndView("redirect:/user/profile/" + user.getId(), model);
			}else {
				System.out.print("New pass does match with Retype new pass");
			}
		}else {
			System.out.println("Current pass is not correct");
		}
		return new ModelAndView("redirect:/user/profile/" + user.getId(), model);
	}
	
}
