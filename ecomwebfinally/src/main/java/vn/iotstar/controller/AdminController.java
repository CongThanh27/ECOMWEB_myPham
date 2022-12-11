package vn.iotstar.controller;

import java.time.Month;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.junit.jupiter.api.Test;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.OrderModel;
import vn.iotstar.model.StoreModel;
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
public class AdminController {
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
	
	
	int userid=1;
	@GetMapping("hi")
	public String list(ModelMap model) {
		
		return "admin/home";
	}
	//trong ngày=1,tháng=2,năm=3
	//lấy ngày tháng, năm hiện tại
	@Test
	@SuppressWarnings("deprecation")
	public int Month() {
		Date getDate = new Date();
		return getDate.getMonth();
	}
	@Test
	@SuppressWarnings("deprecation")
	public int Day() {
		Date getDate = new Date();
		return getDate.getDay();
	}
	@Test
	@SuppressWarnings("deprecation")
	public int Year() {
		Date getDate = new Date();
		return getDate.getYear();
	}
	
	//Số user đăng ký mới 
	@SuppressWarnings("deprecation")
	public int NewUser(int co) {
		int newuser=0;
		List<User> listuser = userService.findAll();
		if(co==1)
		 for(User item : listuser) 
		 { 			 	
			 if (item.getCreateat().getDay()==Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) newuser++;				 
		 }
		else if(co==2)
		 for(User item : listuser) 
		 { 
			 if (item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year()) newuser++;	
		 }
		else
		 for(User item : listuser) 
		 { 
			if (item.getCreateat().getYear()==Year()) newuser++;	
		 }
		 System.out.print(newuser);
		 return newuser;
		
	}
	//Danh sách user đăng ký mới
	@Test
	@SuppressWarnings("deprecation")
	@GetMapping("ListNewUser/{co}")
	public ModelAndView ListNewUser(ModelMap model,  @PathVariable("co") int co ,HttpSession sesson) {
		List<User> listuser = userService.findAll();
		List<User> user = new ArrayList<User>();
		if(co==1)
			 for(User item : listuser) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) user.add(item);			 
			 }
			else if(co==2)
			 for(User item : listuser) 
			 { 
				 if (item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year())user.add(item);
			 }
			else
			 for(User item : listuser) 
			 { 
				if (item.getCreateat().getYear()==Year()) user.add(item);	
			 }
	
		model.addAttribute("user", user); 
		return new ModelAndView("admin/user/list", model);
	}
	
	//Số hóa đơn mới
	@SuppressWarnings("deprecation")
	public int NewOrder(int co) {
		int newOrder=0;
		List<Order> listorder = orderService.findAll();
		if(co==1)
			 for(Order item : listorder) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) newOrder++;				 
			 }
			else if(co==2)
			 for(Order item : listorder) 
			 { 
				 if (item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year()) newOrder++;	
			 }
			else
			 for(Order item : listorder) 
			 { 
				if (item.getCreateat().getYear()==Year()) newOrder++;	
			 }
		System.out.print(newOrder);
		 return newOrder;
	}
	//List hóa dơn
	@SuppressWarnings("deprecation")
	@GetMapping("ListNewOrder/{co}")
	public ModelAndView ListNewOrder(ModelMap model,@PathVariable("co") int co, HttpSession sesson) {		
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
		return new ModelAndView("admin/order/list", model);
	}
	//Số cửa hàng mới
	@SuppressWarnings("deprecation")
	public int NewStore(int co) {
		int newStore=0;
		List<Store> liststore = storeService.findAll();
		if(co==1)
			 for(Store item : liststore) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) newStore++;			 
			 }
			else if(co==2)
			 for(Store item : liststore) 
			 { 
				 if(item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year())newStore++;
			 }
			else
			 for(Store item : liststore) 
			 { 
				if (item.getCreateat().getYear()==Year()) newStore++;	
			 }
		System.out.print(newStore);
		 return newStore;
	}
	//List cửa hàng mới
	@SuppressWarnings("deprecation")
	@GetMapping("ListNewStore")
	public ModelAndView ListNewStore(ModelMap model,@PathVariable("co") int co, HttpSession sesson) {		
		List<Store> liststore = storeService.findAll();
		List<Store> store = new ArrayList<Store>();
		if(co==1)
			 for(Store item : liststore) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) store.add(item);			 
			 }
			else if(co==2)
			 for(Store item : liststore) 
			 { 
				 if (item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year())store.add(item);
			 }
			else
			 for(Store item : liststore) 
			 { 
				if (item.getCreateat().getYear()==Year()) store.add(item);	
			 }	
		model.addAttribute("store", store); 
		return new ModelAndView("admin/store/list", model);
	}
	@SuppressWarnings("deprecation")
	public float Doanhthu(int co) {
		List<Order> listorder = orderService.findAll();
		float danhthu=0;
		if(co==1)
			 for(Order item : listorder) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()
						 &&item.getCreateat().getYear()==Year()
						 &&item.getCreateat().getMonth()==Month()
						 &&item.getGiaohang()==4
						 ) danhthu+=item.getPrice();	
				 System.out.print("$"+danhthu+"$");;
			 }
			else if(co==2)
			 for(Order item : listorder) 
			 { 
				 if (item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year() 
						 &&item.getGiaohang()==4)danhthu+=item.getPrice();
				 System.out.print("$"+danhthu+"$");
			 }
			else
			 for(Order item : listorder) 
			 { 
				if (item.getCreateat().getYear()==Year() &&item.getGiaohang()==4) danhthu+=item.getPrice();	
				System.out.print("$"+danhthu+"$");
			 }
		System.out.print("$last"+danhthu+"$");
		 return danhthu;
	}
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
		model.addAttribute("orderitem", orderitem); 
		return new ModelAndView("admin/orderitem/list", model);
	}
	@SuppressWarnings("deprecation")
	public List<CartItem> ThemSanPhamVaoGioHang(int co) {
		List<User> listuser = userService.findAll();
		List<CartItem> listkq = new ArrayList<CartItem>();
		
		for(User item : listuser) 
		 { 			 	
			 	List<Cart> listcart = item.getCarts();
			 	
			 	for(Cart itemcart : listcart) 
				 { 	
			 			List<CartItem> listcartitem = itemcart.getCartItems();			 	
			 			if(co==1)
						 for(CartItem itemcartitem : listcartitem) 
						 { 			 	
							 if (itemcartitem.getCreateat().getDay()==Day()) listkq.add(itemcartitem);		 
						 }
						else if(co==2)
						 for(CartItem itemcartitem : listcartitem) 
						 { 
							 if (item.getCreateat().getMonth()==Month())listkq.add(itemcartitem);	
						 }
						else
						 for(CartItem itemcartitem : listcartitem) 
						 { 
							if (item.getCreateat().getYear()==Year()) listkq.add(itemcartitem);	
						 }		 			
			 		
				 }
		 }		
		 return listkq;
	}
	@SuppressWarnings("deprecation")
	public List<CartItem> ThemSanPhamVaoGioHang1(int co) {
		
		List<CartItem> listkq = new ArrayList<CartItem>();
		List<CartItem> listcartitem = cartItemService.findAll()	;	 	
		    if(co==1)
			for(CartItem itemcartitem : listcartitem) 
			{ 			 	
				if (itemcartitem.getCreateat().getDay()==Day()&& itemcartitem.getCreateat().getMonth()==Month()&&itemcartitem.getCreateat().getYear()==Year()) listkq.add(itemcartitem);		 
			}
			else if(co==2)
			for(CartItem itemcartitem : listcartitem) 
			{ 
				if (itemcartitem.getCreateat().getMonth()==Month()&& itemcartitem.getCreateat().getYear()==Year())listkq.add(itemcartitem);	
			}
			else
			for(CartItem itemcartitem : listcartitem) 
			{ 
				if (itemcartitem.getCreateat().getYear()==Year()) listkq.add(itemcartitem);	
			}		 			
			 		
		
		 return listkq;
	}
	
	public List<CartItem> ListOrder(int co) {
		List<Order> listorder = orderService.findAll();	
		
		return listorder;
	}
	@GetMapping("ThongKe/{co}")
	public ModelAndView ThongKe(ModelMap model,@PathVariable("co") int co, HttpSession sesson) {	
		//số lượng đăng ký mới
			model.addAttribute("DKMUser", NewUser(co));
			model.addAttribute("DKMUStore", NewStore(co)); 
			model.addAttribute("DKMOrder", NewOrder(co)); 
		//Danh thu
			model.addAttribute("Doanhthu", Doanhthu(co)); 
		//Thêm vào giỏ hàng
			model.addAttribute("tsp", ThemSanPhamVaoGioHang1(co).size()); 
		//set tiêu chí thêm vào giỏ hàng
			if(co==1) model.addAttribute("chitieu", 50); 
			else if(co==2) model.addAttribute("chitieu", 500); 
			else model.addAttribute("chitieu", 3600); 
			
			
		return new ModelAndView("admin/home", model);
	}
	

}
