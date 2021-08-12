package com.jhta.neocom.controller;

import com.jhta.neocom.model.CategoryVo;
import com.jhta.neocom.service.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * CategoryController
 */

@Controller
public class CategoryController {
    @Autowired
    private CategoryService service;

    // INSERT
    @GetMapping("/admin/cate/cateinsert")
    public String insertForm() {
        return "admin/menu/cate/cateinsert";

    }

    @PostMapping("/admin/cate/cateinsert")
    public String insert(CategoryVo vo, Model model) {
        try {
            service.insert(vo);
            model.addAttribute("code", "successs");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("code", "fail");
        }
        return "/admin/menu/cate/result";
    }

    // DELETE
    @RequestMapping("/admin/cate/delete")
    public String delete(int category_id) {
        service.delete(category_id);
        return "redirect:/admin/menu/cate/catelist";
    }

    // UPDATE
    @GetMapping("/admin/cate/update")
    public ModelAndView updateFrom(int category_id) {
        CategoryVo vo = service.find(category_id);
        ModelAndView mv = new ModelAndView("/admin/menu/cate/cateupdate");
        mv.addObject("vo", vo);
        // mv.setViewName("/admin/menu/cate/cateupdate");
        return mv;
    }

    @PostMapping("/admin/cate/cateupdate")
    public String update(CategoryVo vo, Model model) {
        service.update(vo);
        return "redirect:/admin/menu/cate/catelist";

    }

    // LIST
    @RequestMapping("/admin/cate/catelist")
    public ModelAndView list_admin() {
        ModelAndView mv = new ModelAndView("/admin/menu/cate/catelist");
        mv.addObject("list", service.list());

        return mv;
    }
}