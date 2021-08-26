package com.jhta.neocom.admin.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.jhta.neocom.model.CategoryVo;
import com.jhta.neocom.model.Category_relVo;
import com.jhta.neocom.model.ProductVo;
import com.jhta.neocom.model.Product_ImgVo;
import com.jhta.neocom.service.CategoryService;
import com.jhta.neocom.service.Category_relService;
import com.jhta.neocom.service.ImgFileService;
import com.jhta.neocom.service.ProductService;

@Controller
public class AdminProductController {

	@Autowired
	private ProductService service;
	@Autowired
	private ImgFileService service1;
	@Autowired
	private CategoryService cateService;
	@Autowired
	private Category_relService cate_relService;

	@GetMapping("/admin/product/productinsert")
	public String insertForm() {
		return "/admin/menu/product/productinsert";

	}

	@PostMapping("/admin/product/productInsert")
	public String insert(ProductVo vo, Model model, @RequestParam(value = "category_ids") List<String> category_ids) {

		service.insert(vo);
		Product_ImgVo img_vo = new Product_ImgVo(0, vo.getProduct_id(), "no_img_main.jpg", "no_img_main.jpg", 22314,
				"main");
		service1.insert(img_vo);
		for (String category_id : category_ids) {
			Category_relVo cate_relVo = new Category_relVo(0, vo.getProduct_id(), Integer.parseInt(category_id));
			cate_relService.insert(cate_relVo);
		}

		return "/admin/menu/product/addimg";
	}

	@GetMapping("/admin/product/productlist")
	public String adminProductList(Model model) {
		model.addAttribute("img_list", service1.list());
		model.addAttribute("product_list", service.selectAll());
		return "/admin/menu/product/productlist";

	}

	@GetMapping("/admin/product/addimg")
	public String addImg(Model model) {
		model.addAttribute("img_list", service1.list());
		model.addAttribute("product_list", service.selectAll());
		return "/admin/menu/product/addimg";

	}

	@RequestMapping(value = "/admin/product/addimg", method = { RequestMethod.POST })
	public @ResponseBody HashMap<String, Object> insertImg(Model model, MultipartFile main_img,
			MultipartFile description_img, int product_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(main_img.getOriginalFilename());
		System.out.println(description_img.getOriginalFilename());
		System.out.println(product_id);

		return map;
	}

	@RequestMapping(value = "/admin/product/findCategories")
	public @ResponseBody HashMap<String, Object> findChildCategories(int category_parent) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		List<CategoryVo> list = cateService.findChild(category_parent);

		map.put("upperCategoryList", list);

		for (CategoryVo vo : list) {
			map.put(vo.getCategory_id() + "_list", cateService.findChild(vo.getCategory_id()));
		}

		return map;
	}

}
