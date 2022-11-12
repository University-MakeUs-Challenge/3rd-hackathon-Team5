package com.umc.haruject.src.post;

import com.umc.haruject.src.post.model.GetPostDetailRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;


@Repository
public class PostDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}


    public GetPostDetailRes getPostDetail(int postIdx){
        String getPostDetailQuery ="select title, content, headCount, position, framework, matchStatus, nickName, time, location, matchType, isOffline from Post, Project, User where User.idx=Post.userIdx and Post.postIdx=Project.idx and postIdx=?";
        int getPostDetailParam = postIdx;
        return this.jdbcTemplate.queryForObject(getPostDetailQuery,
                (rs, rowNum) -> new GetPostDetailRes(
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getInt("headCount"),
                        rs.getString("position"),
                        rs.getString("framework"),
                        rs.getString("matchStatus"),
                        rs.getString("nickName"),
                        rs.getTimestamp("time"),
                        rs.getString("location"),
                        rs.getString("matchType"),
                        rs.getString("isOffline")
                ),
                getPostDetailParam);
    }
}
