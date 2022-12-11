package vn.iotstar.controller.seller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import vn.iotstar.entity.Order;
import vn.iotstar.entity.Product;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.IDeliveryService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/seller")
public class SellerController {

	@Autowired
	IUserService userService;
	
	@Autowired
	IOrderService orderService;
	
	@Autowired
	IDeliveryService deliveryService;
	
	@Autowired
	IProductService productService;
	
	@Autowired
	IStoreService storeService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext application;
	
	@RequestMapping("")
	public String sellerPage(ModelMap model) {
		User user = (User)session.getAttribute("user");
		model.addAttribute("user", user);
		//Lay don cho xac nhan va tinh doanh thu
		Store store = storeService.findByUser(user);
		List<Order> allOrder = orderService.findAllByStore(store);
		Integer orderCount = allOrder.size();
		Integer deliveryCount = 0;
		double salesFigure = 0;
		for (Order order : allOrder) {
			if (order.getDelivery() == null) {
				deliveryCount++;
			} else {
				salesFigure += order.getPrice();
			}
		}
		model.addAttribute("choxacnhan", orderCount - deliveryCount);
		
		//Lay don da xu ly
		model.addAttribute("daxuly", deliveryCount);
		
		//Lay so san pham da het hang
		List<Product> allProduct = productService.findByStore(store);
		Integer productOOS = 0;
		for (Product product : allProduct) {
			if (product.getQuantity().equals(product.getSold())) {
				productOOS++;
			}
		}
		model.addAttribute("sanphamhethang", productOOS);
		
		//Tinh doanh thu
		model.addAttribute("doanhthu", salesFigure);
		return "/seller/home";
	}
}
