package com.my.service.impl;

import com.my.bean.*;
import com.my.dao.ImgAllMapper;
import com.my.dao.UserDataMapper;
import com.my.dao.UserMapper;
import com.my.excption.AccExistenceException;
import com.my.excption.AccNoFindException;
import com.my.font.FontAll;
import com.my.service.serviceinterface.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserDataMapper userDataMapper;

    @Autowired
    private ImgAllMapper imgAllMapper;

    public User selectUser(String acc, String password, String proxyLogin) {

        if( "0".equals(proxyLogin) ){
            password = DigestUtils.md5DigestAsHex(password.getBytes());
        }

        User user = userMapper.selectByData(acc,password);

        if( user == null || user.getAccount() == null || user.getPassword() == null ){
            throw new AccNoFindException(FontAll.LOGIN_NO_FAIL);
        }

        UserDataExample userExample = new UserDataExample();
        UserDataExample.Criteria criteria = userExample.createCriteria();
        criteria.andAccDataEqualTo(user.getId());

        List<UserData> userDatas = userDataMapper.selectByExample(userExample);

        if( userDatas.size() == 1 ){
            user.setUserData(userDatas.get(0));
        }

        if( user == null ){
            String news = null;
            if( "0".equals(proxyLogin) ){
                news = FontAll.LOGIN_NO_FIND;
            }else{
                news = FontAll.PROXY_ERROR;
            }
            throw new AccNoFindException(news);
        }

        return user;
    }


    public void insertUser(User user) {

        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();

        String account = user.getAccount();
        criteria.andAccountEqualTo(account);

        List<User> users = userMapper.selectByExample(userExample);

        if( users.isEmpty() ){
            String paswd = user.getPassword();
            paswd = DigestUtils.md5DigestAsHex(paswd.getBytes());
            user.setPassword(paswd);
            userMapper.insertSelective(user);
            user = userMapper.selectByData(user.getAccount(),user.getPassword());
            UserData userData = new UserData();
            userData.setAccData(user.getId());
            userDataMapper.insertSelective(userData);
        }else {
            throw new AccExistenceException(FontAll.REGISTER_FAIL);
        }


    }


    public List<ImgAll> selectUserImg(Integer id){
        List<ImgAll> list = imgAllMapper.selectImgAll(id);
        return list;
    }

    @Override
    public List<Integer> selectUserSource(Integer id) {
        List<Integer> list = new ArrayList<>();
        Integer imgNum = imgAllMapper.countImgAll(id);
        list.add(imgNum);
        return list;
    }

    @Override
    public void updateUser(UserData userData) {

        userDataMapper.updateByPrimaryKeySelective(userData);

    }

    @Override
    public UserData selectUserData(Integer id) {
        UserData userData = userDataMapper.selectByPrimaryKey(id);
        return userData;
    }
}
