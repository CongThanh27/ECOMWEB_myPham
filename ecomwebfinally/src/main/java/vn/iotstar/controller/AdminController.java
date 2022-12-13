package vn.iotstar.controller;

import java.nio.file.Path;
import java.time.Month;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.junit.jupiter.api.Test;
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

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Product;
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

	@Autowired
	HttpSession session;
	
	int cos=1;
	int userid=1;
	@GetMapping("hi")
	public String list(ModelMap model) {
		
		return "admin/orderdetail";
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
	
	@SuppressWarnings("deprecation")
	@GetMapping("ListNewUser")
	public ModelAndView ListNewUser(ModelMap model) {
		
		List<User> listuser = userService.findAll();
		List<User> user = new ArrayList<User>();
		List<UserModel> usermodel = new ArrayList<UserModel>();
		if(cos==1)
			 for(User item : listuser) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) user.add(item);	
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
	
		model.addAttribute("usermodel", usermodel); 
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
				 if (item.getCreateat().getDay()==Day()
						 &&item.getCreateat().getYear()==Year()
						 &&item.getCreateat().getMonth()==Month()&& item.getIsactive()==true ) newStore++;			 
			 }
			else if(co==2)
			 for(Store item : liststore) 
			 { 
				 if(item.getCreateat().getMonth()==Month()&&item.getCreateat().getYear()==Year()&& item.getIsactive()==true)newStore++;
			 }
			else
			 for(Store item : liststore) 
			 { 
				if (item.getCreateat().getYear()==Year()&&item.getIsactive()==true) newStore++;	
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
		User usersession= (User)session.getAttribute("user");
		model.addAttribute("usersession", usersession); 
		model.addAttribute("store", store); 
		return new ModelAndView("admin/store/list", model);
	}
	//Doanh thu
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
	//Chỉ tiêu thêm sản phẩm vào giỏ hàng
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
		 
			model.addAttribute("order", order);
			return new ModelAndView("admin/orderitem", model);
	  }
	//đơn hàng
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
		
			model.addAttribute("order", order);
			return new ModelAndView("admin/order", model);
	  }
	// ci tiết của đơn hàng
	@GetMapping("orderdetail/{id}")
	public ModelAndView Orderdetail(ModelMap model,@PathVariable("id")Integer id ) {
		Optional<Order> order = orderService.findById(id);
		Order entity = order.get();
		Date date = new Date();
		Random generator = new Random();
		model.addAttribute("random", generator.nextInt());
		model.addAttribute("date", date);
		model.addAttribute("order", entity);
	
			return new ModelAndView("admin/orderdetail", model);
	  }
	//Sửa thông tin nhân viên
	@GetMapping("/profile/{id}")
	public String edit(ModelMap model, @PathVariable("id")Integer id) {
		Optional<User> user = userService.findById(id);
		
		UserModel userModel = new UserModel();
		BeanUtils.copyProperties(user.get(), userModel);
		model.addAttribute("user", userModel);
	
		return "admin/user/profile";
	}
	//xem thông tin nhân viên
	@GetMapping("/profileuser/{id}")
	public String showProfileuser(ModelMap model, @PathVariable("id")Integer id) {
		Optional<User> user = userService.findById(id);	
		User entity = user.get();
		model.addAttribute("user", entity);
		model.addAttribute("sumdonhang", entity.getOrders().size());
		model.addAttribute("sumdanhgia", entity.getReviews().size());

		return "admin/user/info";
	}
	//top sản phẩm bán chạy
	@GetMapping("/spbanchay")
	public String Spbanchay(ModelMap model) {
		List<Product> listproduct = productService.findTop13ByOrderBySoldDesc();
	
		model.addAttribute("product", listproduct);
		return "admin/viewsp";
	}
	//top sản phẩm bán chậm
	@GetMapping("/spbancham")
	public String Spbancham(ModelMap model) {
		List<Product> listproduct = productService.findTop10ByOrderBySoldAsc();
		model.addAttribute("product", listproduct);
	
		return "admin/viewsp";
	}
	//tất cả sản phẩm
	@GetMapping("/allsp")
	public String allsp(ModelMap model) {
		List<Product> listproduct = productService.findAll();
		model.addAttribute("product", listproduct);
	
		return "admin/viewsp";
	}
	//tất cả sản phẩm
	@GetMapping("/allorder")
	public String allorder(ModelMap model) {
		List<Order> Order = orderService.findAll();
		model.addAttribute("orderall", Order);
	; 
		return "admin/allorder";
	}
	//tất cả user
	@GetMapping("/alluser")
	public String alluser(ModelMap model) {
		List<User> users = userService.findAll();
		model.addAttribute("user", users);
	
		return "admin/user/list";
	}
	@SuppressWarnings("deprecation")
	@GetMapping("ThongKe/{co}")
	public ModelAndView ThongKe(ModelMap model,@PathVariable("co") int co, HttpSession sesson) {	
			cos=co;
	 
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
		//chỉ tiêu đặt hàng
			int hoangtatmuahang=0;
			int hoangtatthanhtoan=0;
			List<Order> list = orderService.findAll();
			for(Order i : list) 
			{ 
				if (i.getGiaohang()==4)hoangtatthanhtoan++;
				if (i.getGiaohang()==1)hoangtatmuahang++;
			}
			model.addAttribute("hoangtatthanhtoan", hoangtatthanhtoan); 
			model.addAttribute("hoangtatmuahang", hoangtatmuahang); 
		// Hàng trong kho
			List<Product> listproduct = productService.findAll();
			model.addAttribute("slproduct", listproduct.size()); 
		//Top 1 bán chạy
			List<Product> listprotop1 = productService.findTop1ByOrderBySoldDesc();
			Product top1= new Product();
			for(Product i : listprotop1) 
			{ 
				top1 = i;
			}
			model.addAttribute("top1", top1);
			//Top 1 bán ế
			List<Product> listprotop1e = productService.findTop1ByOrderBySoldAsc();
			Product tope= new Product();
			for(Product i : listprotop1e) 
			{ 
				tope = i;
			}
			model.addAttribute("tope", tope);
			//sản phẩm được quan tâm nhiều nhất
			for (int j = 5; j>=1 ; j--) 	
				for(Product i : productService.findTop13ByOrderBySoldDesc()) 
				{ 
					if(i.getRating()==j){
					model.addAttribute("toptotnhat", i); 
					break;}
					
				}
			//Khách hàng nổi bật 
			int count = 0;
			int count1 = 0;
			int count2 = 0;
			for(User i : userService.findAll()) 
			{ 
				if(orderService.countByUser(i)>count) 
				{
					count2=count1;
					count1=count;
					count = orderService.countByUser(i);
				}			
			}
	
			List<User> listuser = new ArrayList<User>();
			for(User i : userService.findAll()) 
			{ 
				
				if(orderService.countByUser(i)==count ||orderService.countByUser(i)==count1||orderService.countByUser(i)==count2 ) 
				{
					listuser.add(i);
				}
			}
			model.addAttribute("listusernoibat", listuser); 
			model.addAttribute("sllistusernoibat", listuser.size()); 
			//Những đơn hàng gần đây
			model.addAttribute("orderganday", orderService.findTop10ByOrderByCreateatDesc()); 
			//Những sản phẩm được thêm vào giỏ hàng gần đây
			model.addAttribute("spduocthemganday", cartItemService.findTop10ByOrderByCreateatDesc()); 
		return new ModelAndView("admin/home", model);
	}
	//sửa, xóa nhân viên
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
	
		return new ModelAndView("redirect:/admin/profile/" + user.getId(), model);

	}
	//thay dổi mật khẩu nhân viên
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
				
				
				return new ModelAndView("redirect:/admin/profile/" + user.getId(), model);
			}else {
				System.out.print("New pass does match with Retype new pass");
			}
		}else {
			System.out.println("Current pass is not correct");
		}
	
		return new ModelAndView("redirect:/admin/profile/" + user.getId(), model);
	}
	
	

}
