package vn.iotstar.controller;

import java.io.IOException;
import java.nio.file.Path;
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

import vn.iotstar.entity.User;
import vn.iotstar.model.UserModel;
import vn.iotstar.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	IUserService userService;

	@Autowired
	ServletContext application;

	@GetMapping("")
	public ModelAndView List(ModelMap model, HttpSession sesson) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);
		return new ModelAndView("user/user/list", model);
	}

	@GetMapping("/add")
	public String seachnotify(ModelMap model, HttpSession sesson) {
		UserModel user = new UserModel();
		user.setIsEdit(false);
		model.addAttribute("user", user);
		return "user/user/addOrEdit";

	}

	@GetMapping("edit/{id}")
	public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) throws IOException {
		Optional<User> opt = userService.findById(id);
		UserModel user = new UserModel();
		if (opt.isPresent()) {
			User entity = opt.get();
			BeanUtils.copyProperties(entity, user);
			user.setIsEdit(true);
			model.addAttribute("user", user);
			return new ModelAndView("user/user/addOrEdit", model);
		}
		model.addAttribute("message", "User không tồn tại");
		return new ModelAndView("redirect:/user", model);

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @Valid @ModelAttribute("user") UserModel user,
			BindingResult result) {
		User entity = new User();

		/*
		 * if (result.hasErrors()) { model.addAttribute("message", "Có lỗi"); return new
		 * ModelAndView("redirect:/user", model); }
		 */

		if (!user.getAvatarFile().isEmpty()) {
			String path = application.getRealPath("/");

			try {
				user.setAvatar(user.getAvatarFile().getOriginalFilename());
				String filePath = path + "/resources/images/user/" + user.getAvatar();
				user.getAvatarFile().transferTo(Path.of(filePath));
				user.setAvatarFile(null);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		BeanUtils.copyProperties(user, entity);
		userService.save(entity);
		return new ModelAndView("redirect:/user", model);

	}

	@GetMapping("delete/{id}")
	public ModelAndView delete(ModelMap model, @PathVariable("id") Integer id) {
		userService.deleteById(id);
		return new ModelAndView("redirect:/user", model);
	}
}
