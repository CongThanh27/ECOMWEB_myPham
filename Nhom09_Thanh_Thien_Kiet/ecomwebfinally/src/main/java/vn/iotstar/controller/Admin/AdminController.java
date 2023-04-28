package vn.iotstar.controller.Admin;

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

	
	@Autowired
	OrderAdminController orderController;
	@Autowired
	ProductAdminController productController;
	@Autowired
	OrderItemAdminController orderItemController;
	@Autowired
	StoreAdminController storeController;
	@Autowired
	UserAdminCotroller userAdminCotroller;
	int cos=1;
	@GetMapping("mess")
	public String mess(ModelMap model) {
		
		return "admin/mess";
	}
	@GetMapping("tmess")
	public String taotin (ModelMap model) {
		
		return "admin/createmess";
	}
	// trong ngày=1,tháng=2,năm=3
	// Lấy ngày tháng, năm hiện tại

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

	// Số user đăng ký mới
	@SuppressWarnings("deprecation")
	public int NewUser(int co) {
		int newuser = 0;
		List<User> listuser = userService.findAll();
		if (co == 1)
			for (User item : listuser) {
				if (item.getCreateat().getDay() == Day() && item.getCreateat().getYear() == Year()
						&& item.getCreateat().getMonth() == Month())
					newuser++;
			}
		else if (co == 2)
			for (User item : listuser) {
				if (item.getCreateat().getMonth() == Month() && item.getCreateat().getYear() == Year())
					newuser++;
			}
		else
			for (User item : listuser) {
				if (item.getCreateat().getYear() == Year())
					newuser++;
			}
		System.out.print(newuser);
		return newuser;

	}

	// Số hóa đơn mới là hóa đơn đã đc giao thành công
	@SuppressWarnings("deprecation")
	public int NewOrder(int co) {
		int newOrder = 0;
		List<Order> listorder = orderService.findAll();
		if (co == 1)
			for (Order item : listorder) {
				if (item.getCreateat().getDay() == Day() && item.getCreateat().getYear() == Year()
						&& item.getCreateat().getMonth() == Month()&& item.getGiaohang() == 4)
					newOrder++;
			}
		else if (co == 2)
			for (Order item : listorder) {
				if (item.getCreateat().getMonth() == Month() && item.getCreateat().getYear() == Year()&& item.getGiaohang() == 4)
					newOrder++;
			}
		else
			for (Order item : listorder) {
				if (item.getCreateat().getYear() == Year()&& item.getGiaohang() == 4)
					newOrder++;
			}
		System.out.print(newOrder);
		return newOrder;
	}

	// Số cửa hàng mới và được xác nhận
	@SuppressWarnings("deprecation")
	public int NewStore(int co) {
		//&& item.getIsactive() == true
		int newStore = 0;
		List<Store> liststore = storeService.findAll();
		if (co == 1)
			for (Store item : liststore) {
				if (item.getCreateat().getDay() == Day() && item.getCreateat().getYear() == Year()
						&& item.getCreateat().getMonth() == Month() )
					newStore++;
			}
		else if (co == 2)
			for (Store item : liststore) {
				if (item.getCreateat().getMonth() == Month() && item.getCreateat().getYear() == Year())
					newStore++;
			}
		else
			for (Store item : liststore) {
				if (item.getCreateat().getYear() == Year())
					newStore++;
			}
		System.out.print(newStore);
		return newStore;
	}

	// Doanh thu nếu đã giao hàng thành công
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

	// Chỉ tiêu thêm sản phẩm vào giỏ hàng

	@SuppressWarnings("deprecation")
	public List<CartItem> ThemSanPhamVaoGioHang1(int co) {

		List<CartItem> listkq = new ArrayList<CartItem>();
		List<CartItem> listcartitem = cartItemService.findAll();
		if (co == 1)
			for (CartItem itemcartitem : listcartitem) {
				if (itemcartitem.getCreateat().getDay() == Day() && itemcartitem.getCreateat().getMonth() == Month()
						&& itemcartitem.getCreateat().getYear() == Year())
					listkq.add(itemcartitem);
			}
		else if (co == 2)
			for (CartItem itemcartitem : listcartitem) {
				if (itemcartitem.getCreateat().getMonth() == Month() && itemcartitem.getCreateat().getYear() == Year())
					listkq.add(itemcartitem);
			}
		else
			for (CartItem itemcartitem : listcartitem) {
				if (itemcartitem.getCreateat().getYear() == Year())
					listkq.add(itemcartitem);
			}

		return listkq;
	}
	
	@SuppressWarnings("deprecation")
	@GetMapping("ThongKe/{co}")
	public ModelAndView ThongKe(ModelMap model,@PathVariable("co") int co, HttpSession sesson) {	
			cos=co;
			userAdminCotroller.cos=co;
			storeController.cos=co;
			//userController.cos=co;
			orderController.cos=co;
			productController.cos=co;
			orderItemController.cos=co;
			
			User usersession= (User)session.getAttribute("user");
			model.addAttribute("usersession", usersession); 
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

	

}
