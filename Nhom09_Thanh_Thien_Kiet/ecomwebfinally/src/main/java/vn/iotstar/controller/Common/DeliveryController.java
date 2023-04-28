package vn.iotstar.controller.Common;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

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

import vn.iotstar.entity.Delivery;
import vn.iotstar.model.DeliveryModel;
import vn.iotstar.service.IDeliveryService;

@Controller
@RequestMapping("admin/deliveries")
public class DeliveryController {

	@Autowired
	IDeliveryService deliveryService;

	@RequestMapping("")
	public String list(ModelMap model) {

		// gọi hàm findAll() trong service

		List<Delivery> list = deliveryService.findAll();

		// chuyển dữ liệu từ list lên biến categories

		model.addAttribute("deliveries", list);

		return "admin/deliveries/list";

	}

	@GetMapping("add")
	public String add(ModelMap model) {
		DeliveryModel cate = new DeliveryModel();
		cate.setIsEdit(false);
		model.addAttribute("deliveries", cate);

		return "admin/deliveries/addOrEdit";

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("delivery") DeliveryModel cate,
			BindingResult result) // Tra ve chuoi result
	{
		if (result.hasErrors()) {
			return new ModelAndView("admin/deliveries/addOrEdit");
		}
		Delivery entity = new Delivery();

		BeanUtils.copyProperties(cate, entity); // do du lieu tu model sang entity

		deliveryService.save(entity);

		String message = "Error";
		if (cate.getIsEdit() == true) {
			message = "Delivery Update succesfull !";
		} else {
			message = "Delivery Create Successfull !";
		}

		model.addAttribute("message", message);
		return new ModelAndView("forward:/admin/deliveries", model);

	}
	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) throws IOException {
		Optional<Delivery> opt = deliveryService.findById(id);
		DeliveryModel delivery = new DeliveryModel();
		if (opt.isPresent()) {
			Delivery entity = opt.get();
			BeanUtils.copyProperties(entity, delivery);
			delivery.setIsEdit(true);
			model.addAttribute("delivery", delivery);
			return new ModelAndView("admin/deliveries/addOrEdit", model);
		}
		model.addAttribute("message", "Không tồn tại");
		return new ModelAndView("forward:/admin/deliveries", model);

	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		deliveryService.deleteById(id);
		model.addAttribute("message", "Delivery Delete Succesfull !!!");
		return new ModelAndView("redirect:/admin/deliveries", model);

	}

}
