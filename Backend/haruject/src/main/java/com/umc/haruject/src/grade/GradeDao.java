package com.umc.haruject.src.grade;

import com.umc.haruject.src.home.model.GetHomeRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;


@Repository
public class GradeDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);}

    /*
    유저 평점 등록
     */
    public int createGrade(int graderIdx, int gradeeIdx, int grade, String time, String communication, String skill) {
        String createGradeQuery = "INSERT INTO Grade(graderIdx, gradeeIdx, grade, time, communication, skill) VALUES (?, ?, ?, ?, ?, ?);";
        Object[] createGradeParams = new Object[]{graderIdx, gradeeIdx, grade, time, communication, skill};
        this.jdbcTemplate.update(createGradeQuery, createGradeParams);

        String lastInsertIdxQuery = "select last_insert_id()";
        return this.jdbcTemplate.queryForObject(lastInsertIdxQuery, int.class);
    }



}
