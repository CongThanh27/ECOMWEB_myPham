package vn.iotstar.controller.Common;

import java.io.IOException;
import java.nio.file.Path;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
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

import vn.iotstar.entity.*;
import vn.iotstar.model.*;
import vn.iotstar.service.IStoreService;

@Controller
@RequestMapping("/admin/store")
public class StoreController {

	@Autowired
	IStoreService storeservice;
	
	@Autowired
	ServletContext application;

	@GetMapping("")
	public ModelAndView list(ModelMap model) {
		List<Store> page = storeservice.findAll();
		model.addAttribute("stores", page);
		return new ModelAndView("admin/store/listStore", model);
	}

	@GetMapping("addOrEdit")
	public String add(ModelMap model) {
		StoreModel store = new StoreModel();
		store.setIsEdit(false);// thêm
		model.addAttribute("store", store);
		return "admin/store/addOrEdit";

	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) throws IOException {
		Optional<Store> opt = storeservice.findById(id);
		StoreModel store = new StoreModel();
		if (opt.isPresent()) {
			Store entity = opt.get();
			BeanUtils.copyProperties(entity, store);
			store.setIsEdit(true);
			model.addAttribute("store", store);
			return new ModelAndView("admin/store/addOrEdit", model);
		}
		model.addAttribute("message", "cửa hàng không tồn tại");
		return new ModelAndView("forward:/admin/store", model);

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("store") StoreModel store,
			BindingResult result) {
		Store entity = new Store();
		if (result.hasErrors()) {
			model.addAttribute("message", "Có lỗi");
			return new ModelAndView("admin/addOrEdit");
		}
		
		if (!(store.getAvatarFile().isEmpty()  || store.getFeaturedimagesFile().isEmpty()) ) {
			String path = application.getRealPath("/");

			try {
				
				store.setAvatar(store.getAvatarFile().getOriginalFilename());
				String filePath = path + "/resources/images/user/" + store.getAvatar();
				store.getAvatarFile().transferTo(Path.of(filePath));
				store.setAvatarFile(null);
				
				store.setFeaturedimages(store.getFeaturedimagesFile().getOriginalFilename());
				String filePath2=path + "/resources/images/user/"+ store.getFeaturedimages();
				store.getFeaturedimagesFile().transferTo(Path.of(filePath2));
				store.setFeaturedimagesFile(null);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Date date= new Date();
		if(store.getIsEdit()== false)
			store.setCreateAt(date);
		else
			store.setUpdaeAt(date);

		BeanUtils.copyProperties(store, entity);
		storeservice.save(entity);
		String message = "";
		if (store.getIsEdit() == true) {
			message = "Store Update succesfull !";
		} else {
			message = "Store Create Successfull !";
		}

		model.addAttribute("message", message);
		return new ModelAndView("redirect:/admin/store", model);

	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") int id) {
		storeservice.deleteById(id);
		model.addAttribute("message", "store Delete Succesfull !!!");
		return new ModelAndView("redirect:/admin/store", model);

	}
}
