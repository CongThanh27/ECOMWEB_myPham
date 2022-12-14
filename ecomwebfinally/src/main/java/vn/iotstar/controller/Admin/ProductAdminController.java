package vn.iotstar.controller.Admin;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iotstar.entity.Product;
import vn.iotstar.entity.User;
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
public class ProductAdminController {
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

	int cos=1;
	//top sản phẩm bán chạy
		@GetMapping("/spbanchay")
		public String Spbanchay(ModelMap model) {
			List<Product> listproduct = productService.findTop13ByOrderBySoldDesc();
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
			model.addAttribute("product", listproduct);
			return "admin/viewsp";
		}
		//top sản phẩm bán chậm
		@GetMapping("/spbancham")
		public String Spbancham(ModelMap model) {
			List<Product> listproduct = productService.findTop10ByOrderBySoldAsc();
			model.addAttribute("product", listproduct);
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
			return "admin/viewsp";
		}
		//tất cả sản phẩm
		@GetMapping("/allsp")
		public String allsp(ModelMap model) {
			List<Product> listproduct = productService.findAll();
			model.addAttribute("product", listproduct);
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
			return "admin/viewsp";
		}
}
