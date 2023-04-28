package vn.iotstar.controller.Admin;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Order;
import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderItemService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IReviewService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/admin")

public class UserAdminCotroller {
	@Autowired
	IProductService productService;
	@Autowired
	ServletContext application;
	@Autowired
	ICategoryService categoryService;
	@Autowired
	IStoreService storeService;
	@Autowired
	IUserService userService;
	@Autowired
	IReviewService reviewService;
	@Autowired
	ICartService cartService;
	@Autowired
	IOrderService orderService;
	@Autowired
	IOrderItemService orderItemService;
	@Autowired
	IDeliveryService deliveryService;
	@Autowired
	ICartItemService cartItemService;
	@Autowired
	HttpSession session;

	int cos=1;
	@SuppressWarnings("deprecation")
	public int Month() {
		Date getDate = new Date();
		return getDate.getMonth();
	}

	@SuppressWarnings("deprecation")
	public int Day() {
		Date getDate = new Date();
		return getDate.getDay();
	}

	@SuppressWarnings("deprecation")
	public int Year() {
		Date getDate = new Date();
		return getDate.getYear();
	}
	// Doanh thu
	@SuppressWarnings("deprecation")
	public float Doanhthu(int co) {
		List<Order> listorder = orderService.findAll();
		float danhthu = 0;
		if (co == 1)
			for (Order item : listorder) {
				if (item.getCreateat().getDay() == Day() && item.getCreateat().getYear() == Year()
						&& item.getCreateat().getMonth() == Month() && item.getGiaohang() == 4)
					danhthu += item.getPrice();
				System.out.print("$" + danhthu + "$");
				;
			}
		else if (co == 2)
			for (Order item : listorder) {
				if (item.getCreateat().getMonth() == Month() && item.getCreateat().getYear() == Year()
						&& item.getGiaohang() == 4)
					danhthu += item.getPrice();
				System.out.print("$" + danhthu + "$");
			}
		else
			for (Order item : listorder) {
				if (item.getCreateat().getYear() == Year() && item.getGiaohang() == 4)
					danhthu += item.getPrice();
				System.out.print("$" + danhthu + "$");
			}
		System.out.print("$last" + danhthu + "$");
		return danhthu;
	}

	//Danh sách user đăng ký mới
		@SuppressWarnings("deprecation")
		@GetMapping("ListNewUser")
		public ModelAndView ListNewUser(ModelMap model) {
			User usersession= (User)session.getAttribute("user");
			List<User> listuser = userService.findAll();
			List<User> user = new ArrayList<User>();
			List<UserModel> usermodel = new ArrayList<UserModel>();
			if(cos==1)
				 for(User item : listuser) 
				 { 			 	
					 if (item.getCreateat().getDay()== Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) user.add(item);	
					 UserModel modeluser = new UserModel();
					 BeanUtils.copyProperties(item, modeluser);
					 modeluser.setId(item.getId());
					 float sum=0;
					 List<Order> ListOrder = item.getOrders();
					 for(Order itemorder : ListOrder) 
					 {
						 sum+=itemorder.getPrice();
					 }
					 modeluser.setSum(sum);
					 usermodel.add(modeluser);
				 }
				else if(cos==2)
				 for(User item : listuser) 
				 { 
					 if (item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year())user.add(item);
					 UserModel modeluser = new UserModel();
					 modeluser.setId(item.getId());
					 float sum=0;
					 List<Order> ListOrder = item.getOrders();
					 for(Order itemorder : ListOrder) 
					 {
						 if(itemorder.getGiaohang()==4)
							 sum+=itemorder.getPrice();
					 }
					 modeluser.setSum(sum);
					 usermodel.add(modeluser);
				 }
				else
				 for(User item : listuser) 
				 { 
					if (item.getCreateat().getYear()==Year()) user.add(item);
					 UserModel modeluser = new UserModel();
					 modeluser.setId(item.getId());
					 float sum=0;
					 List<Order> ListOrder = item.getOrders();
					 for(Order itemorder : ListOrder) 
					 {
						 sum+=itemorder.getPrice();
					 }
					 modeluser.setSum(sum);
					 usermodel.add(modeluser);
					
				 }
			
			model.addAttribute("danhthutoong", Doanhthu(cos)); 
			model.addAttribute("user", user);
			model.addAttribute("usersession", usersession); 
			model.addAttribute("usermodel", usermodel); 
			return new ModelAndView("admin/user/list", model);
		}
		//Sửa thông tin nhân viên
		@GetMapping("/profile/{id}")
		public String edit(ModelMap model, @PathVariable("id")Integer id) {
			Optional<User> user = userService.findById(id);
			
			UserModel userModel = new UserModel();
			BeanUtils.copyProperties(user.get(), userModel);
			model.addAttribute("user", userModel);
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
			return "admin/user/profile";
		}
		//Xem thông tin nhân viên
		@GetMapping("/profileuser/{id}")
		public String showProfileuser(ModelMap model, @PathVariable("id")Integer id) {
			Optional<User> user = userService.findById(id);	
			User entity = user.get();
			model.addAttribute("user", entity);
			model.addAttribute("sumdonhang", entity.getOrders().size());
			model.addAttribute("sumdanhgia", entity.getReviews().size());
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
			return "admin/user/info";
		}
		//Tất cả user
		@GetMapping("/alluser")
		public String alluser(ModelMap model) {
			List<User> users = userService.findAll();
			model.addAttribute("user", users);
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
			return "admin/user/list";
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
			//long millis = System.currentTimeMillis();
			Date date = new Date();

			if (user.getIsEdit()) {
				entity.setUpdateat(date);
			} 
			else {
				entity.setCreateat(date);
				entity.setUpdateat(date);
			}

			userService.save(entity);
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
			return new ModelAndView("redirect:/admin/profile/" + user.getId(), model);

		}
		//thay dổi mật khẩu nhân viên
		@PostMapping("/changePassword")
		public ModelAndView changePasswordProcess(ModelMap model, @RequestParam String hashedpassword,
			@RequestParam String newPassword,
			@RequestParam String confirmPassword,
			@Valid @ModelAttribute("user") UserModel user,
			BindingResult result) {
			User usersession= (User)session.getAttribute("user");
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
					
					model.addAttribute("usersession", usersession); 
					return new ModelAndView("redirect:/admin/profile/" + user.getId(), model);
				}else {
					System.out.print("New pass does match with Retype new pass");
				}
			}else {
				System.out.println("Current pass is not correct");
			}
			model.addAttribute("usersession", usersession); 
			return new ModelAndView("redirect:/admin/profile/" + user.getId(), model);
		}
		
}
