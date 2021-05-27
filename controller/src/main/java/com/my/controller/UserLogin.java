package com.my.controller;

import com.my.bean.ImgAll;
import com.my.bean.User;
import com.my.bean.UserData;
import com.my.font.FontAll;
import com.my.service.serviceinterface.UserService;
import com.my.util.ResultPage;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("/user/")
public class UserLogin {

    @Autowired
    private UserService userService;

    @PostMapping("*/logout.json")
    @ResponseBody
    public ResultPage<String> logout(HttpServletRequest request){
        request.getSession(false).setAttribute("user",null);
        return new ResultPage<String>(FontAll.LOGIN_OUT,"true");
    }

    @PostMapping("proxyLogin.html")
    public void proxyLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Cookie[] cookies = request.getCookies();
        String acc = null;
        String password = null;

        for (Cookie c : cookies) {
            if (c.getName().equals("userAcc")) {
                acc = c.getValue();
            }
            if (c.getName().equals("userPassword")) {
                password = c.getValue();
            }
        }
        PrintWriter out = response.getWriter();
        if (acc != null && password != null) {
            out.write(acc + "#" + password);
        }
    }

    @PostMapping("*/main.html")
    public String UserLogin(@RequestParam("userAcc") String acc,
                            @RequestParam("userPassword") String paswd,
                            @RequestParam("proxyLogin") String proxyLogin,
                            HttpServletRequest request,
                            HttpServletResponse response) {
        User user = userService.selectUser(acc,paswd,proxyLogin);
        request.getSession().setAttribute("user", user);
        addCookie(user,response);
        return "redirect:/index.html";

    }

    @PostMapping("*/register.json")
    @ResponseBody
    public ResultPage<String> insertUser(@RequestParam("acc") String acc,
                                 @RequestParam("paswd") String paswd) {

        User user = new User(acc, paswd);

        userService.insertUser(user);

        return new ResultPage<String>(FontAll.REGISTER_SUCCESS,"true");
    }

    @GetMapping("*/modify.json")
    public String modifyUser(UserData userData , HttpSession session){
        userService.updateUser(userData);
        session.setAttribute("news",FontAll.REGISTER_SUCCESS);
        User user = (User) session.getAttribute("user");
        user.setUserData(userData);
        session.setAttribute("user",user);
        return "modifyPage/modify";
    }

    @GetMapping("*/{id}/mySource.html")
    public ModelAndView getAllSource(@PathVariable("id") Integer id, ModelAndView modelAndView){

        List<Integer> list = userService.selectUserSource(id);

        modelAndView.addObject("mySource",list);

        modelAndView.setViewName("indexPage/source/mySource");
        return modelAndView;
    }
    @GetMapping("*/{id}/imgSource.html")
    public ModelAndView getAllImg(@PathVariable("id") Integer id, ModelAndView modelAndView){

        List<ImgAll> list = userService.selectUserImg(id);

        modelAndView.addObject("imgList",list);

        modelAndView.setViewName("indexPage/source/imgSource");
        return modelAndView;
    }

    @PostMapping("*/{id}/upSource.html")
    public ModelAndView upSource(@PathVariable("id") Integer id,
                                 @RequestParam("userFile") MultipartFile[] multipartFile,ModelAndView modelAndView)
            throws IOException {

        if ( multipartFile != null && multipartFile.length >= 1 ){
            for( MultipartFile m : multipartFile ){

                String name = m.getOriginalFilename();

                String fileBckName = name.substring(name.lastIndexOf("."));

                String url = "C:\\Users\\Administrator\\IdeaProjects\\parent\\controller\\src\\main\\resources\\DATA";

                String fName = System.currentTimeMillis()+fileBckName;

                File file = new File(url,fName);
                if( file.exists() ){
                    file.delete();
                }
                file.createNewFile();
                m.transferTo(file);
             }
        }
        modelAndView.setViewName("indexPage/source/upSource");
        return modelAndView;
    }

    private void addCookie(User user,HttpServletResponse response) {
        Cookie userAcc = new Cookie("userAcc", user.getAccount());
        Cookie userPassword = new Cookie("userPassword", user.getPassword());
        userAcc.setMaxAge(60 * 60 * 24 * 15);
        userPassword.setMaxAge(60 * 60 * 24 * 15);
        userAcc.setPath("/");
        userPassword.setPath("/");
        response.addCookie(userAcc);
        response.addCookie(userPassword);
    }

}
