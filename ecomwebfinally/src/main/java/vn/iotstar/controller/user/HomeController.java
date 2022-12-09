package vn.iotstar.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Product;
import vn.iotstar.service.ICategoryService;
import vn.iotstar.service.IProductService;

@Controller
@RequestMapping("")
public class HomeController {
	@Autowired
	ICategoryService categoryService;
	
	@Autowired
	IProductService productService;
	
	@GetMapping("")
	public String list(ModelMap model) {
		List<Category> cate = categoryService.findTop3ByOrderByIdAsc();		
		model.addAttribute("category", cate);
		
		List<Product> list = productService.findTop10ByOrderByCreateatDesc();
		model.addAttribute("product", list);
		
		List<Product> listBest = productService.findTop13ByOrderBySoldDesc();
		model.addAttribute("productb", listBest);
		return "index";
	}
}
