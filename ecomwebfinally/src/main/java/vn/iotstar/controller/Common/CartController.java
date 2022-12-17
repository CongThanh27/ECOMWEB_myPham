package vn.iotstar.controller.Common;

import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils; //co the lay sai thu vien
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vn.iotstar.entity.Cart;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Store;
import vn.iotstar.entity.User;
import vn.iotstar.model.CartModel;
import org.springframework.beans.BeanUtils;
import vn.iotstar.service.ICartService;
import vn.iotstar.service.IStoreService;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("admin/carts")
public class CartController {

	@Autowired
	ICartService cartService;

	@Autowired
	IUserService userService;

	@Autowired
	IStoreService storeService;

	@GetMapping("")
	public String list(ModelMap model) {
		List<Cart> list = cartService.findAll();

		model.addAttribute("carts", list);

		return "admin/carts/list";
	}
	@GetMapping("list")
	public String list1(ModelMap model) {
		return "carts/list";
	}

	@GetMapping("add")
	public String add(ModelMap model) {
		CartModel cart = new CartModel();
		cart.setIsEdit(false);
		model.addAttribute("cart", cart);

		return "admin/carts/add";
	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("cart") CartModel cart,
			BindingResult result) {
		if (result.hasErrors()) {
			return new ModelAndView("admin/carts/add");
		}
		Cart entity = new Cart();

		BeanUtils.copyProperties(cart, entity);

		// Xử lý User
		User uEntity = userService.getById(cart.getUserid());
		entity.setUser(uEntity);

		// Xử lý Store
		Store stoEntity = storeService.getById(cart.getStoreid());
		entity.setStore(stoEntity);

		long millis = System.currentTimeMillis();
		Date datet = new Date(millis);
		if (cart.getIsEdit().equals(true)) {
			entity.setUpdateat(datet);

		} else {
			entity.setCreateat(datet);
			entity.setUpdateat(datet);
		}

		cartService.save(entity);

		String message = "";
		if (cart.getIsEdit() == true) {
			message = "Cart Update Succesfull !";
		} else {
			message = "Cart Update Unsuccessfull !";
		}

		model.addAttribute("message", message);
		return new ModelAndView("redirect:/admin/carts", model);
	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer cartId) {
		Optional<Cart> opt = cartService.findById(cartId);
		CartModel cart = new CartModel();
		if (opt.isPresent()) {
			Cart entity = opt.get();
			BeanUtils.copyProperties(entity, cart);
			cart.setIsEdit(true);
			cart.setUserid(entity.getUser().getId());
			cart.setStoreid(entity.getStore().getId());
			model.addAttribute("cart", cart);
			return new ModelAndView("/admin/carts/edit", model);
		}
		model.addAttribute("message", "Cart is not valid !!!");
		return new ModelAndView("redirect:/admin/carts", model);
	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		cartService.deleteById(id);
		model.addAttribute("message", "Cart Delete Succesfull !!!");

		return new ModelAndView("redirect:/admin/carts", model);

	}

	@GetMapping("search")
	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name) // lay len tat ca
	{
		List<Cart> list = null;
		list = cartService.findAll();
		model.addAttribute("carts", list);
		return "admin/carts/search";

	}

	@GetMapping("searchpagenated")
	public String search(ModelMap model, @RequestParam(name = "name1", required = false) String name,
			@RequestParam("page") Optional<Integer> page, @RequestParam("size") Optional<Integer> size) {

		// Tong mau tin trong category services

		int count = (int) cartService.count();
		int currentpage = page.orElse(1);
		int pageSize = size.orElse(3); // load len 3 mau tin
		Pageable pageable = PageRequest.of(currentpage - 1, pageSize, Sort.by("id"));
		Page<Cart> resultPage = null;
		/*
		 * if (StringUtils.hasText(name)) { resultPage =
		 * categoryService.findByNameContaining(name, pageable);
		 * 
		 * model.addAttribute("name1", name); } else {
		 */
		resultPage = cartService.findAll(pageable);
		/* } */

		int totalPages = resultPage.getTotalPages();
		if (totalPages > 0) {
			int start = Math.max(1, currentpage - 2);
			int end = Math.min(currentpage + 2, totalPages);
			if (totalPages > count) {
				if (end == totalPages) {
					start = end - count;
				} else if (start == 1)
					end = start + count;
			}
			List<Integer> pageNumbers = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
			model.addAttribute("pageNumbers", pageNumbers);

		}

		model.addAttribute("cartPage", resultPage);
		return "admin/carts/list";

	}
}
