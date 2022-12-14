package vn.iotstar.controller.Admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Order;
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
public class OrderAdminController {
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
	//List hóa dơn
	@SuppressWarnings("deprecation")
	@GetMapping("ListNewOrder/{co}")
	public ModelAndView ListNewOrder(ModelMap model,@PathVariable("co") int co, HttpSession sesson) {	
		User usersession= (User)session.getAttribute("user");
		List<Order> listorder = orderService.findAll();
		List<Order> order = new ArrayList<Order>();
		if(co==1)
			 for(Order item : listorder) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) order.add(item);			 
			 }
			else if(co==2)
			 for(Order item : listorder) 
			 { 
				 if (item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year()) order.add(item);		
			 }
			else
			 for(Order item : listorder) 
			 { 
				if (item.getCreateat().getYear()==Year()) order.add(item);		
			 }
		model.addAttribute("order", order); 
		model.addAttribute("usersession", usersession); 
		return new ModelAndView("admin/order/list", model);
	}
	// List những đơn hàng đã giao thành công
		@SuppressWarnings("deprecation")
		@GetMapping("orderitem")
		public ModelAndView ListOrderitem(ModelMap model, HttpSession sesson) {
			
			  List<Order> listorder = orderService.findAll();
			  List<Order> order =new ArrayList<Order>();
			    if(cos==1)
				for(Order itemcartitem : listorder) 
				{ 			 	
					if (itemcartitem.getCreateat().getDay()==Day()
							&& itemcartitem.getCreateat().getMonth()==Month()
							&&itemcartitem.getCreateat().getYear()==Year()
							&&itemcartitem.getGiaohang()==4) order.add(itemcartitem);		 
				}
				else if(cos==2)
				for(Order itemcartitem : listorder) 
				{ 
					if (itemcartitem.getCreateat().getMonth()==Month()&& itemcartitem.getCreateat().getYear()==Year()&&itemcartitem.getGiaohang()==4)order.add(itemcartitem);	
				}
				else
				for(Order itemcartitem : listorder) 
				{ 
					if (itemcartitem.getCreateat().getYear()==Year()&&itemcartitem.getGiaohang()==4) order.add(itemcartitem);	
					
				}	
			    User usersession= (User)session.getAttribute("user");
			    model.addAttribute("usersession", usersession); 
				model.addAttribute("order", order);
				return new ModelAndView("admin/orderitem", model);
		  }
		//đơn hàng
		@SuppressWarnings("deprecation")
		@GetMapping("order")
		public ModelAndView ListOrder(ModelMap model, HttpSession sesson) {
			
			  List<Order> listorder = orderService.findAll();
			  List<Order> order =new ArrayList<Order>();
			    if(cos==1)
				for(Order itemcartitem : listorder) 
				{ 			 	
					if (itemcartitem.getCreateat().getDay()==Day()
							&& itemcartitem.getCreateat().getMonth()==Month()
							&&itemcartitem.getCreateat().getYear()==Year()
							&&itemcartitem.getGiaohang()==4) order.add(itemcartitem);		 
				}
				else if(cos==2)
				for(Order itemcartitem : listorder) 
				{ 
					if (itemcartitem.getCreateat().getMonth()==Month()&& itemcartitem.getCreateat().getYear()==Year()&&itemcartitem.getGiaohang()==4)order.add(itemcartitem);	
				}
				else
				for(Order itemcartitem : listorder) 
				{ 
					if (itemcartitem.getCreateat().getYear()==Year()&&itemcartitem.getGiaohang()==4) order.add(itemcartitem);	
					
				}	
			    User usersession= (User)session.getAttribute("user");
			    model.addAttribute("usersession", usersession); 
				model.addAttribute("order", order);
				return new ModelAndView("admin/order", model);
		  }
		// IN chi tiết của đơn hàng
		@GetMapping("orderdetail/{id}")
		public ModelAndView Orderdetail(ModelMap model,@PathVariable("id")Integer id ) {
			Optional<Order> order = orderService.findById(id);
			Order entity = order.get();
			Date date = new Date();
			Random generator = new Random();
			model.addAttribute("random", generator.nextInt());
			model.addAttribute("date", date);
			model.addAttribute("order", entity);
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
				return new ModelAndView("admin/orderdetail", model);
		  }
		//tất cả đơn hàng
		@GetMapping("/allorder")
		public String allorder(ModelMap model) {
			List<Order> Order = orderService.findAll();
			model.addAttribute("orderall", Order);
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
			return "admin/allorder";
		}
}
