package vn.iotstar.controller.Common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Delivery;
import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.CartItemModel;
import vn.iotstar.model.OrderModel;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderItemService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/user/cart")
public class CartItemController {

	@Autowired
	ICartItemService cartItemService;
	@Autowired
	IUserService userService;
	@Autowired
	IProductService productService;
	@Autowired
	ICartService cartService;
	@Autowired
	IOrderService orderService;
	@Autowired
	IOrderItemService orderItemService;
	@Autowired
	IDeliveryService deliveryService;
	@Autowired
	ServletContext application;
	@Autowired
	HttpSession session;
	// User User= (User)session.getAttribute("user");
	/* int userid = 1; */

	List<Integer> listInt = new ArrayList<>();

	@GetMapping("hi")
	public String list(ModelMap model) {

		return "deliveries/list";
	}

	@GetMapping("Order")
	public ModelAndView ListOrder(ModelMap model, HttpSession sesson) {
		// users.getId()
		User User = (User) session.getAttribute("user");
		Optional<User> user = userService.findById(User.getId());
		User users = user.get();
		List<Order> listorder = users.getOrders();
		model.addAttribute("order", listorder);

		User userss = (User) session.getAttribute("user");
		long soSanPhamTrongGio = 0;
		if (user != null) {
			for (Cart cart : userss.getCarts()) {
				Cart cartn = cart;
				soSanPhamTrongGio += cartItemService.countByCart(cartn);
			}
		}
		model.addAttribute("count", soSanPhamTrongGio);

		return new ModelAndView("deliveries/list", model);
	}

	@GetMapping("List")
	public ModelAndView ListC(ModelMap model, HttpSession sesson) {
		float sum = 0;
		User User = (User) session.getAttribute("user");
		Optional<User> user = userService.findById(User.getId());
		User users = user.get();
		List<Cart> listcart = users.getCarts();
		List<CartItem> listcartitem = new ArrayList<CartItem>();

		for (Cart item : listcart) {
			listcartitem.addAll(item.getCartItems());

		}

		for (CartItem item : listcartitem) {
			sum = (float) (sum + (item.getProduct().getPromotionaprice()) * item.getCount());

		}
		

		model.addAttribute("sum", sum);
		model.addAttribute("cartitem", listcartitem);

		long soSanPhamTrongGio = 0;
		if (User != null) {
			for (Cart cart : User.getCarts()) {
				Cart cartn = cart;
				soSanPhamTrongGio += cartItemService.countByCart(cartn);
			}
		}

		model.addAttribute("count", soSanPhamTrongGio);

		return new ModelAndView("carts/list", model);
	}

	@GetMapping("AddThongTin")
	public ModelAndView test(ModelMap model) {
		User User = (User) session.getAttribute("user");
		Optional<User> opt = userService.findById(User.getId());
		List<Delivery> deli = deliveryService.findAll();
		UserModel user = new UserModel();
		long soSanPhamTrongGio = 0;
		if (User != null) {
			for (Cart cart : User.getCarts()) {
				Cart cartn = cart;
				soSanPhamTrongGio += cartItemService.countByCart(cartn);
			}
		}

		model.addAttribute("count", soSanPhamTrongGio);

		float sum = 0;
		if (opt.isPresent()) {
			User entity = opt.get();
			User users = opt.get();
			BeanUtils.copyProperties(entity, user);
			List<Cart> listcart = users.getCarts();
			List<CartItem> listcartitem = new ArrayList<CartItem>();

			for (Cart item : listcart) {
				listcartitem.addAll(item.getCartItems());

			}

			if (listcartitem.isEmpty()) {
				String message = " ";
				message = "Chưa có mặt hàng nào";
				model.addAttribute("message", message);
				return new ModelAndView("redirect:/user/cart/List", model);
			}
			for (CartItem item : listcartitem) {
				sum = (float) (sum + (item.getProduct().getPromotionaprice()) * item.getCount());

			}
			model.addAttribute("sum", sum);
			model.addAttribute("user", user);
			model.addAttribute("delivery", deli);

			return new ModelAndView("user/common/common", model);
		}
		model.addAttribute("error", "Product không tồn tại");
		return new ModelAndView("redirect:/user/cart/List", model);
	}

	@PostMapping("SaveOrder")
	public ModelAndView addOrder(ModelMap model, @Valid @ModelAttribute("order") OrderModel order) {
		// Luw nhan dang
		User user = (User) session.getAttribute("user");
		// Lay gio hang cua user, moi cua hang 1 gio hang
		User usersd = userService.findById(user.getId()).get();
		List<Cart> userCart = new ArrayList<>();
		for (Cart cart : usersd.getCarts()) {
			if (cart.getCartItems().size() != 0) {
				userCart.add(cart);
			}
		}
		// So cua hang user mua
		List<Store> userStore = new ArrayList<>();
		for (Cart cart : userCart) {
			userStore.add(cart.getStore());
		}
		// Ung voi moi cua hang tao ra 1 order rieng
		for (Store store : userStore) {
			Order entity = new Order();
			BeanUtils.copyProperties(order, entity);
			Date getDate = new Date();
			entity.setCreateat(getDate);
			entity.setStore(store);
			entity.setUser(userService.findById(user.getId()).get());
			entity.setStatus("Chờ xác nhận và giao hàng");
			Random generator = new Random();
			int nhandang = generator.nextInt(100000000);
			entity.setTrangthai(nhandang);
			//listInt.add(nhandang);
			entity.setDelivery(deliveryService.getById(order.getDelivereid()));
			entity.setGiaohang(1);
			// Tính tổng tiền cho 1 hóa đơn của store
			// Tìm giỏ hàng của user đó
			Optional<Cart> cartInUse = cartService.findByUserAndStore(userService.findById(user.getId()).get(), store);
			Cart gh = cartInUse.get();
			// lấy sản phẩm chứa trong cart ra tính tiền
			List<CartItem> listcartitem = gh.getCartItems();
			float sum = 0;
			for (CartItem item1 : listcartitem) {
				sum = (float) (sum + (item1.getProduct().getPromotionaprice()) * item1.getCount());
			}
			entity.setPrice(sum);

			// Hoàn tất tạo 1 order
			orderService.save(entity);
			  // Những đơn hàng của user đó vừa tạo bên trên
			  User nguoidung = userService.findById(user.getId()).get();
			  List<Order> listorder =(nguoidung.getOrders());
			  // Chạy vòng for để tìm đơn hàng vừa tạo, rồi thêm sản phẩm cho đơn hàng đó
			  Order ordernew = orderService.findByTrangthai(nhandang);
			//sát định  giỏ hàng của user đó
			  Cart cartInUser = cartService.findByUserAndStore(user, store).get();							  
			//Lấy nhưng sản phẩm bên trong những giỏ hàng của user đó		 
				// với từng sản phẩm tạo orderitem cho hóa đơn đã tạo
						  for(CartItem item2 : cartInUser.getCartItems()) 
							 { 
								 OrderItem itemorder = new OrderItem();
								 itemorder.setOrder(ordernew);
								 Date getDate1 = new Date();
								 itemorder.setCreateat(getDate1);
								 itemorder.setUpdateat(getDate1);
								 itemorder.setCount(item2.getCount());
								 itemorder.setProduct(item2.getProduct());
								 orderItemService.save(itemorder);	
								 //xóa cái sản phẩm trong giỏ hàng đi
								 cartItemService.deleteById(item2.getId());
							 }					  			
			 
	  }
	  	  
	String message="";
	message ="Thành công";
	model.addAttribute("message", message); 
	String a ="redirect:/user/cart/Order";
	return new ModelAndView(a, model);
	}

	/*@PostMapping("SaveOrder")
	public ModelAndView addOrder(ModelMap model, @Valid @ModelAttribute("order") OrderModel order) {
		// Luw nhan dang

		User user = (User) session.getAttribute("user");
		// Lay gio hang cua user, moi cua hang 1 gio hang
		List<Cart> userCart = new ArrayList<>();
		for (Cart cart : user.getCarts()) {
			if (cart.getCartItems().size() != 0) {
				userCart.add(cart);
			}
		}
		// So cua hang user mua
		List<Store> userStore = new ArrayList<>();
		for (Cart cart : userCart) {
			userStore.add(cart.getStore());
		}
		// Ung voi moi cua hang tao ra 1 order rieng
		for (Store store : userStore) {
			Order entity = new Order();
			BeanUtils.copyProperties(order, entity);
			Date getDate = new Date();
			entity.setCreateat(getDate);
			entity.setStore(store);
			entity.setUser(user);
			entity.setStatus("Chờ xác nhận và giao hàng");
			Random generator = new Random();
			int nhandang = generator.nextInt(100000000);

			entity.setTrangthai(nhandang);
			listInt.add(nhandang);
			entity.setDelivery(deliveryService.getById(order.getDelivereid()));
			entity.setGiaohang(1);

			// Tính tổng tiền cho 1 hóa đơn của store
			// Tìm giỏ hàng của user đó
			Optional<Cart> cartInUse = cartService.findByUserAndStore(user, store);
			Cart gh = cartInUse.get();
			// lấy sản phẩm chứa trong cart ra tính tiền
			List<CartItem> listcartitem = gh.getCartItems();
			float sum = 0;
			for (CartItem item1 : listcartitem) {
				sum = (float) (sum + (item1.getProduct().getPromotionaprice()) * item1.getCount());
			}
			entity.setPrice(sum);

			// Hoàn tất tạo 1 order
			orderService.save(entity);
		}
		model.addAttribute("nhandang", listInt);

		for (Integer item : listInt) {
			System.out.println("Alala : " + item);
		}
		return new ModelAndView("redirect:/user/cart/addOrderItem", model);

	}*/

	@GetMapping("addOrderItem")
	public String addOrderItem(ModelMap model/* , @Valid @ModelAttribute("nhandang") List<Integer> listInt */) {

		session.removeAttribute("listInt");
		for (Integer item : listInt) {
			System.out.println("Alola : " + item);
		}

		User user = (User) session.getAttribute("user");
		// Lay gio hang cua user, moi cua hang 1 gio hang
		List<Cart> userCart = new ArrayList<>();
		for (Cart cart : user.getCarts()) {
			if (cart.getCartItems().size() != 0) {
				userCart.add(cart);
			}
		}
		// So cua hang user mua
		List<Store> userStore = new ArrayList<>();
		for (Cart cart : userCart) {
			userStore.add(cart.getStore());
		}
		Integer i = 0;
		for (Store store : userStore) {
			Integer nhandang = listInt.get(i++);
			Cart userStoreCart = cartService.findByUserAndStore(user, store).get();
			List<CartItem> cartItems = userStoreCart.getCartItems();
			for (CartItem cartItem : cartItems) {
				OrderItem entity = new OrderItem();
				entity.setOrder(orderService.findByTrangthai(nhandang));
				Date getDate = new Date();
				entity.setCreateat(getDate);
				entity.setCount(cartItem.getCount());
				entity.setProduct(cartItem.getProduct());
				orderItemService.save(entity);
			}
		}
		
		//Xoa item trong cartitem
		for (Cart cart : userCart) {
			cartItemService.deleteByCart(cart);
		}
		
		listInt.clear();
		return "redirect:/user/cart/Order";
	}

	

	@GetMapping("")
	public ModelAndView List(ModelMap model, HttpSession sesson) {

		List<CartItem> CartItems = cartItemService.findAll();
		model.addAttribute("CartItems", CartItems);
		return new ModelAndView("user/cartItem/list", model);
	}

	@GetMapping("/add")
	public String seachnotify(ModelMap model, HttpSession sesson) {
		CartItemModel CartItem = new CartItemModel();
		CartItem.setIsEdit(false);
		model.addAttribute("cartItem", CartItem);
		return "user/cartItem/add";

	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) throws IOException {
		Optional<CartItem> opt = cartItemService.findById(id);
		CartItemModel CartItem = new CartItemModel();
		if (opt.isPresent()) {
			CartItem entity = opt.get();
			BeanUtils.copyProperties(entity, CartItem);
			CartItem.setIsEdit(true);
			CartItem.setProductid(entity.getProduct().getId());
			CartItem.setCartid(entity.getCart().getId());
			model.addAttribute("cartItem", CartItem);
			return new ModelAndView("user/cartItem/edit", model);
		}
		model.addAttribute("message", "CartItem không tồn tại");
		return new ModelAndView("redirect:/user/cart/item", model);

	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") int id) {
		cartItemService.deleteById(id);
		model.addAttribute("message", "Delete Succesfull !!!");
		return new ModelAndView("redirect:/user/cart/List", model);

	}

	@GetMapping("/process/{id}")
	public String process(ModelMap model, @PathVariable("id") int id) {
		Order order = orderService.findById(id).get();
		if (order.getGiaohang() == 1) {
			order.setGiaohang(0);
		} else if (order.getGiaohang() == 3) {
			order.setGiaohang(4);
		} /*
			 * else if (order.getGiaohang() == 4) { return "redirect:/user/lists/" + id; }
			 */
		orderService.save(order);

		return "redirect:/user/cart/Order";
	}

	@GetMapping("/reviewAndRating/{id}")
	public String reviewAndRating(ModelMap model, @PathVariable("id") int id) {
		return "redirect:/product/user/lists/" + id;
	}
}
