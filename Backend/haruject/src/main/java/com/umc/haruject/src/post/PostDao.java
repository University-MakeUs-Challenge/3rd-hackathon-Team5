package com.umc.haruject.src.post;

import com.umc.haruject.src.post.model.GetPostDetailRes;
import com.umc.haruject.src.post.model.PostPostApplyReq;
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
    public int checkApplicantUser(int userIdx) {
        String checkApplicantQuery = "select exists(select userIdx from applicant where userIdx = ?)";
        int checkApplicantParams = userIdx;
        return this.jdbcTemplate.queryForObject(checkApplicantQuery,
                int.class,
                checkApplicantParams);
    }

    public int checkApplicantPost(int postIdx) {
        String checkApplicantQuery = "select exists(select postIdx from applicant where postIdx = ?)";
        int checkApplicantParams = postIdx;
        return this.jdbcTemplate.queryForObject(checkApplicantQuery,
                int.class,
                checkApplicantParams);
    }

    public int createApplicant(PostPostApplyReq postPostApplyReq) {
        String createApplicantQuery = "insert into Applicant (matchStatus, userIdx, postIdx) VALUES (?,?,?)";
        Object[]createApplicantQueryParams = new Object[]{postPostApplyReq.getMatchStatus(), postPostApplyReq.getPostIdx(), postPostApplyReq.getUserIdx()};
        this.jdbcTemplate.update(createApplicantQuery, createApplicantQueryParams);

        String lastInserIdQuery = "select last_insert_id()";
        return this.jdbcTemplate.queryForObject(lastInserIdQuery, int.class);
    }
}
