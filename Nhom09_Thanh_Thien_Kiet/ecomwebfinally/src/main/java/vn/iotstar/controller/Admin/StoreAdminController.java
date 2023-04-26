package vn.iotstar.controller.Admin;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Store;
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
public class StoreAdminController {
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
	//List cửa hàng mới
	@SuppressWarnings("deprecation")
	@GetMapping("ListNewStore")
	public ModelAndView ListNewStore(ModelMap model) {		
		List<Store> liststore = storeService.findAll();
		List<Store> store = new ArrayList<Store>();
		if(cos==1)
			 for(Store item : liststore) 
			 { 			 	
				 if (item.getCreateat().getDay()==Day()&&item.getCreateat().getYear()==Year()&&item.getCreateat().getMonth()==Month()) store.add(item);			 
			 }
			else if(cos==2)
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
		return new ModelAndView("admin/store/listStore", model);
	}
	@GetMapping("AllStore")
	public ModelAndView ALL(ModelMap model) {		
		List<Store> liststore = storeService.findAll();	
		model.addAttribute("store", liststore); 
		return new ModelAndView("admin/store/listStore", model);
	}
	@GetMapping("KhoaMo/{id}")
	public ModelAndView KhoaMo(ModelMap model, @PathVariable("id")Integer id ) {	
		Store store = storeService.findById(id).get();
		if(store.getIsactive()==true)
			store.setIsactive(false);
		else store.setIsactive(true);
		storeService.save(store);
		List<Store> liststore = storeService.findAll();
		model.addAttribute("store", liststore); 
		return new ModelAndView("admin/store/listStore", model);
	}
	//Xem thông tin nhân viên
	@GetMapping("/profistore/{id}")
	public String profistore(ModelMap model, @PathVariable("id")Integer id) {
		Optional<Store> store = storeService.findById(id);	
		Store entity = store.get();
		model.addAttribute("store", entity);
		model.addAttribute("sumdonhang", entity.getOrder().size());
		model.addAttribute("sumdanhgia", entity.getRating());
 
		return "admin/store/info";
	}
}
