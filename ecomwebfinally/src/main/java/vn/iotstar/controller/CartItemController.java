package vn.iotstar.controller;

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
import org.springframework.validation.BindingResult;
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
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.CartItemModel;
import vn.iotstar.model.CartModel;
import vn.iotstar.model.OrderModel;
import vn.iotstar.model.ProductModel;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.ICartItemService;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderItemService;
import vn.iotstar.service.IOrderService;
//import vn.iotstar.service.ICartService;
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
	//User User= (User)session.getAttribute("user");
	int userid=1;
	@GetMapping("hi")
	public String list(ModelMap model) {
		
		return "deliveries/list";
	}
	@GetMapping("Order")
	public ModelAndView ListOrder(ModelMap model, HttpSession sesson) {
		//users.getId()
		User User= (User)session.getAttribute("user");
		Optional<User> user = userService.findById(User.getId());
		User users = user.get();
		List<Order> listorder = users.getOrders();		
		model.addAttribute("order", listorder);
		return new ModelAndView("deliveries/list", model);
	}
	@GetMapping("List")
	public ModelAndView ListC(ModelMap model, HttpSession sesson) {
		float sum=0;
		User User= (User)session.getAttribute("user");
		Optional<User> user = userService.findById(User.getId());
		User users = user.get();
		List<Cart> listcart = users.getCarts();
		List<CartItem> listcartitem = new ArrayList<CartItem>();
		
		  for(Cart item : listcart) 
		  { 
			  listcartitem.addAll(item.getCartItems());
			  
		  }

		  for(CartItem item : listcartitem) 
		  { 
			  sum= (float) (sum + (item.getProduct().getPromotionaprice())*item.getCount());
			  
		  }
		model.addAttribute("userid", User.getId()); 
		
		model.addAttribute("sum", sum);
		model.addAttribute("cartitem", listcartitem);
		return new ModelAndView("carts/list", model);
	}

	
	@GetMapping("AddThongTin")
	public ModelAndView test(ModelMap model) {
		User User= (User)session.getAttribute("user");
		Optional<User> opt = userService.findById(User.getId());
		List<Delivery> deli = deliveryService.findAll();
		UserModel user = new UserModel();	
		float sum=0;
		if (opt.isPresent() ) {
			User entity = opt.get();
			User users = opt.get();
			BeanUtils.copyProperties(entity, user);
			List<Cart> listcart = users.getCarts();
			List<CartItem> listcartitem = new ArrayList<CartItem>();
			
			  for(Cart item : listcart) 
			  { 
				  listcartitem.addAll(item.getCartItems());
				  
			  }
			
			  if (listcartitem.isEmpty()) {
				  String message=" ";
				  message ="Chưa có mặt hàng nào";
				  model.addAttribute("message", message);  return new ModelAndView("redirect:/user/cart/List", model);}
			  for(CartItem item : listcartitem) 
			  { 
				  sum= (float) (sum + (item.getProduct().getPromotionaprice())*item.getCount());
				  
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
	public ModelAndView AddCart(ModelMap model, @Valid @ModelAttribute("order") OrderModel order,
			@Valid @ModelAttribute("cartit") CartItemModel cartit, BindingResult result) {
			User User= (User)session.getAttribute("user");
			Optional<User> user = userService.findById(User.getId());
			User users = user.get();
			List<Cart> listcart = users.getCarts();
			//số store người đó mua
			List<Store> liststore= new ArrayList<Store>();
			  for(Cart item : listcart) 
			  {  
				  liststore.add(item.getStore());
			  }
			  //ứng mỗi cửa hàng tạo 1 orther riêng
			  for(Store item : liststore) 
			  {  
				  Order entity = new Order();
				  BeanUtils.copyProperties(order, entity);
				  Date getDate = new Date();
					entity.setCreateat(getDate);
					entity.setUpdateat(getDate);
					entity.setStore(item);
					entity.setUser(users);
					entity.setStatus("Chờ xác nhận và giao hàng");
					Random generator = new Random(); 
					int nhandang =generator.nextInt();					
					entity.setTrangthai(nhandang);
					entity.setDelivery(deliveryService.getById(order.getDelivereid()));
					entity.setGiaohang(1);
					//Tính tổng tiền cho 1 hóa đơn của store
					Optional<Cart> cart = cartService.findByStore(item);
					Cart gh = cart.get();
					List<CartItem> listcartitem = gh.getCartItems();
					float sum=0;
					 for(CartItem item1 : listcartitem) 
					 { 
						  sum= (float) (sum + (item1.getProduct().getPromotionaprice())*item1.getCount());						  
					 } 
					 entity.setPrice(sum);
					 orderService.save(entity);		
					 
					 Optional<User> user1 = userService.findById(User.getId());
					 User user2 = user1.get();
					  // nhưng giỏ hàng của user
					  List<Order> listorder =user2.getOrders();
					  for(Order item3 : listorder) 
					  {  
						  if (item3.getTrangthai()==nhandang) {
							  Optional<Cart> cart1 = cartService.findByStore(item3.getStore());
							  Cart gh2 = cart1.get();
							  List<CartItem> CartItem1 = gh2.getCartItems();
							 
							  for(CartItem item2 : CartItem1) 
								 { 
									 OrderItem itemorder = new OrderItem();
									 itemorder.setOrder(item3);
									 Date getDate1 = new Date();
									 itemorder.setCreateat(getDate1);
									 itemorder.setUpdateat(getDate1);
									 itemorder.setCount(item2.getCount());
									 itemorder.setProduct(item2.getProduct());
									 orderItemService.save(itemorder);	
									 cartItemService.deleteById(item2.getId());
								 } 	
						  }  
						  
					  }
					 
			  }

			  	  
			String message="";
			message ="Thành công";
			model.addAttribute("message", message); 
			String a ="redirect:/user/cart/Order";
		return new ModelAndView(a, model);
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
	
}
