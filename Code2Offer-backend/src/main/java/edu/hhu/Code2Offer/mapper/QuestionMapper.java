package edu.hhu.Code2Offer.mapper;

import edu.hhu.Code2Offer.model.entity.Question;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

/**
* @author 13706
* @description 针对表【question(题目)】的数据库操作Mapper
* @createDate 2025-12-20 21:20:08
* @Entity edu.hhu.Code2Offer.model.entity.Question
*/
public interface QuestionMapper extends BaseMapper<Question> {
    /**
     * 查询题目列表（包括已被删除的数据）
     * mysql中是逻辑删除，同步时候也要判断是否生效
     */
    @Select("select * from question where updateTime >= #{minUpdateTime}")
    List<Question> listQuestionWithDelete(Date minUpdateTime);
}




