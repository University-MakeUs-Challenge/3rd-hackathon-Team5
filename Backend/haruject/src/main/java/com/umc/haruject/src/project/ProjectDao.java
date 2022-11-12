package com.umc.haruject.src.project;

import com.umc.haruject.src.post.model.PostPostReq;
import com.umc.haruject.src.project.model.PostProjectReq;
import com.umc.haruject.src.project.model.test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Timestamp;

@Repository
public class ProjectDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}

    public int insertProject(PostProjectReq postProjectReq) {
        String time = postProjectReq.getTime();
        String location = postProjectReq.getLocation();
        String matchType = postProjectReq.getMatchType();
        String isOffline = postProjectReq.getIsOffline();
        String projectStatus = postProjectReq.getProjectStatus();

        String insertProjectQuery = "INSERT INTO Project(time, location, matchType, isOffline, projectStatus) VALUES (?, ?, ?, ?, ?)";
        Object[] insertProjectParams = new Object[] {time, location, matchType, isOffline, projectStatus};
        this.jdbcTemplate.update(insertProjectQuery,
                insertProjectParams);

        //자동으로 가장 마지막에 들어간 idx 값을 리턴해줌
        String lastInsertIdxQuery= "SELECT last_insert_id()";
        return this.jdbcTemplate.queryForObject(lastInsertIdxQuery, int.class);
    }


    public int insertTest(test test1) {
        String nick = test1.getNick();
        String name = test1.getName();

        String insertQuery = "INSERT INTO Test(nick, name) VALUES (?, ?)";
        Object[] insertParams = new Object[] {nick, name};
        this.jdbcTemplate.update(insertQuery, insertParams);

        String lastInsertIdxQuery= "SELECT last_insert_id()";
        return this.jdbcTemplate.queryForObject(lastInsertIdxQuery, int.class);
    }
}
