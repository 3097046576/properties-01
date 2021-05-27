package com.my.controller;

import com.my.dao.ImgAllMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class SourceController {

    @Autowired
    private ImgAllMapper imgAllMapper;

    @GetMapping("/main.html")
    public ModelAndView goIndexMain(ModelAndView modelAndView){

        List<Integer> list = new ArrayList<Integer>();

        Integer num = imgAllMapper.countImgAll();

        list.add(num);

        modelAndView.addObject("allSource",list);

        modelAndView.setViewName("indexPage/main");
        return modelAndView;
    }

}
