package com.my.dao;

import com.my.bean.ImgAll;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Value;

import java.util.List;

@Mapper
public interface ImgAllMapper {

    Integer countImgAll();

    Integer countImgAll(@Param("id") Integer id);

    List<ImgAll> selectImgAll(@Param("id") Integer id);
}
