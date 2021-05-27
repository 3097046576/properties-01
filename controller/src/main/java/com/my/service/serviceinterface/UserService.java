package com.my.service.serviceinterface;

import com.my.bean.ImgAll;
import com.my.bean.User;
import com.my.bean.UserData;

import java.util.List;

public interface UserService {

    User selectUser(String acc, String password,String proxyLogin);

    void insertUser(User user);

    void updateUser(UserData userData);

    UserData selectUserData(Integer id);

    List<ImgAll> selectUserImg(Integer id);

    List<Integer> selectUserSource(Integer id);
}
