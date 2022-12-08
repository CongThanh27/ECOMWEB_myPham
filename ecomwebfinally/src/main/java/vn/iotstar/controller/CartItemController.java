package vn.iotstar.controller;

import java.io.IOException;
import java.util.Date;
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

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.CartItem;
import vn.iotstar.entity.Product;
import vn.iotstar.model.CartItemModel;
import vn.iotstar.service.ICartItemService;
//import vn.iotstar.service.ICartService;
import vn.iotstar.service.IProductService;

@Controller
@RequestMapping("/user/cart/item")
public class CartItemController {

	@Autowired
	ICartItemService cartItemService;

	@Autowired
	IProductService productService;

	/*
	 * @Autowired ICartService cartService;
	 */
	@Autowired
	ServletContext application;

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

	/*
	 * @PostMapping("saveOrUpdate") public ModelAndView saveOrUpdate(ModelMap
	 * model, @Valid @ModelAttribute("CartItem") CartItemModel CartItem,
	 * BindingResult result) { CartItem entity = new CartItem();
	 * 
	 * 
	 * if (result.hasErrors()) { model.addAttribute("message", "Có lỗi"); return new
	 * ModelAndView("redirect:/CartItem", model); }
	 * 
	 * Product product = productService.getById(CartItem.getProductid()); Cart cart
	 * = cartService.getById(CartItem.getCartid());
	 * 
	 * BeanUtils.copyProperties(CartItem, entity); entity.setProduct(product);
	 * entity.setCart(cart); Date date = new Date(); if (CartItem.getIsEdit()) {
	 * entity.setUpdateat(date); } else { entity.setCreateat(date); }
	 * 
	 * cartItemService.save(entity); return new
	 * ModelAndView("redirect:/user/cart/item", model);
	 * 
	 * }
	 * 
	 * @GetMapping("delete/{id}") public ModelAndView delete(ModelMap
	 * model, @PathVariable("id") Integer id) { cartItemService.deleteById(id);
	 * model.addAttribute("message", "Xóa thành công"); return new
	 * ModelAndView("redirect:/user/cart/item", model); }
	 */
}
