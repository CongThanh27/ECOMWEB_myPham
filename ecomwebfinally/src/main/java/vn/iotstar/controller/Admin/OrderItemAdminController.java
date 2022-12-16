package vn.iotstar.controller.Admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.OrderItem;
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
public class OrderItemAdminController {
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
	//list những sản phẩm
	@SuppressWarnings("deprecation")
	@GetMapping("ListOrderIteam/{co}")
	public ModelAndView ListOrderIteam(ModelMap model,@PathVariable("co") int co, HttpSession sesson) {		
		List<OrderItem> listorderitem = orderItemService.findAll();
		List<OrderItem> orderitem = new ArrayList<OrderItem>();
		if(co==1)
			 for(OrderItem item : listorderitem) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()&& item.getCreateat().getYear()==Year()&& item.getCreateat().getMonth()==Month()) orderitem.add(item);			 
			 }
			else if(co==2)
			 for(OrderItem item : listorderitem) 
			 { 
				 if (item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year()) orderitem.add(item);		
			 }
			else
			 for(OrderItem item : listorderitem) 
			 { 
				if (item.getCreateat().getYear()==Year()) orderitem.add(item);		
			 }
		User usersession= (User)session.getAttribute("user");
		model.addAttribute("usersession", usersession); 
		model.addAttribute("orderitem", orderitem); 
		return new ModelAndView("admin/orderitem/list", model);
	}
}
