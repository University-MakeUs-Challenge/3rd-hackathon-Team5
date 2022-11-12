package com.umc.haruject.src.post;

import com.umc.haruject.src.post.model.PostPostReq;
import com.umc.haruject.src.post.model.PostPostRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Timestamp;
import java.util.List;


@Repository
public class PostDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}


    public int insertPost(PostPostReq postPostReq){
        int userIdx = postPostReq.getUserIdx();
        int projectIdx = postPostReq.getProjectIdx();
        String title = postPostReq.getTitle();
        String content = postPostReq.getContent();
        int headCount = postPostReq.getHeadCount();
        String position = postPostReq.getPosition();
        String framework = postPostReq.getFramework();
        String matchStatus = postPostReq.getMatchStatus();

        String insertPostQuery = "INSERT INTO Post(title, content, headCount, position, framework, matchStatus,userIdx, projectIdx) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        Object[] insertPostParams = new Object[] {title, content, headCount, position, framework, matchStatus,userIdx, projectIdx};
        this.jdbcTemplate.update(insertPostQuery,
                insertPostParams);

        //자동으로 가장 마지막에 들어간 idx 값을 리턴해줌
        String lastInsertIdxQuery= "SELECT last_insert_id()";
        return this.jdbcTemplate.queryForObject(lastInsertIdxQuery, int.class);
    }
}
