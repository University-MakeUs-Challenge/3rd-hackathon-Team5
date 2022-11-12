package com.umc.haruject.post;

import com.umc.haruject.post.model.GetPostDetailRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;

@Repository
public class PostDao {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    public List<GetPostDetailRes> getPostDetail(int postIdx){
        String getPostDetailQuery ="select title, content, headCount, position, framework, matchStatus, userIdx from Post";
        int getPostDetailParam = postIdx;
        return this.jdbcTemplate.query(getPostDetailQuery,
                (rs, rowNum) -> new GetPostDetailRes(
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("headCount"),
                        rs.getString("position"),
                        rs.getString("framework"),
                        rs.getString("matchStatus"),
                        rs.getInt("userIdx")
                ), // RowMapper(위의 링크 참조): 원하는 결과값 형태로 받기
                getPostDetailParam); // 한 개의 회원정보를 얻기 위한 jdbcTemplate 함수(Query, 객체 매핑 정보, Params)의 결과 반환
    }
}
