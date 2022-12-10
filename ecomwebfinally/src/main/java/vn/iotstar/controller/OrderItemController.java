package vn.iotstar.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Optional;

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

import vn.iotstar.entity.Order;
import vn.iotstar.entity.OrderItem;
import vn.iotstar.entity.Product;
import vn.iotstar.model.OrderItemModel;
import vn.iotstar.service.IOrderItemService;
import vn.iotstar.service.IOrderService;
import vn.iotstar.service.IProductService;

@Controller
@RequestMapping("/user/order/item")
public class OrderItemController {

	@Autowired
	IOrderItemService orderItemService;

	@Autowired
	IProductService productService;

	@Autowired
	IOrderService orderService;

	@Autowired
	ServletContext application;

	@GetMapping("")
	public ModelAndView List(ModelMap model, HttpSession sesson) {

		List<OrderItem> orderItems = orderItemService.findAll();
		model.addAttribute("orderItems", orderItems);
		return new ModelAndView("user/orderItem/list", model);
	}

	@GetMapping("/add")
	public String seachnotify(ModelMap model, HttpSession sesson) {
		OrderItemModel orderItem = new OrderItemModel();
		orderItem.setIsEdit(false);
		model.addAttribute("orderItem", orderItem);
		return "user/orderItem/add";

	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) throws IOException {
		Optional<OrderItem> opt = orderItemService.findById(id);
		OrderItemModel orderItem = new OrderItemModel();
		if (opt.isPresent()) {
			OrderItem entity = opt.get();
			BeanUtils.copyProperties(entity, orderItem);
			orderItem.setIsEdit(true);
			orderItem.setProductid(entity.getProduct().getId());
			orderItem.setOrderid(entity.getOrder().getId());
			model.addAttribute("orderItem", orderItem);
			return new ModelAndView("user/orderItem/edit", model);
		}
		model.addAttribute("message", "orderItem không tồn tại");
		return new ModelAndView("redirect:/user/order/item", model);

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("orderItem") OrderItemModel orderItem,
			BindingResult result) {
		OrderItem entity = new OrderItem();

		/*
		 * if (result.hasErrors()) { model.addAttribute("message", "Có lỗi"); return new
		 * ModelAndView("redirect:/orderItem", model); }
		 */
		Product product = productService.getById(orderItem.getProductid());
		Order order = orderService.getById(orderItem.getOrderid());

		BeanUtils.copyProperties(orderItem, entity);
		entity.setProduct(product);
		entity.setOrder(order);
		long millis = System.currentTimeMillis();
		Date date = new Date(millis);

		if (orderItem.getIsEdit()) {
			entity.setUpdateat(date);
		} else {
			entity.setUpdateat(date);
			entity.setCreateat(date);
		}

		orderItemService.save(entity);
		return new ModelAndView("redirect:/user/order/item", model);

	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		orderItemService.deleteById(id);
		model.addAttribute("message", "Xóa thành công");
		return new ModelAndView("redirect:/user/order/item", model);
	}
}
