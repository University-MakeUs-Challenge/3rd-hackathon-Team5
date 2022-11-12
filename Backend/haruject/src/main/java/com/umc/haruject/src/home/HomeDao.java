package com.umc.haruject.src.home;

import com.umc.haruject.src.home.model.GetHomeRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.util.List;


@Repository
public class HomeDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {this.jdbcTemplate = new JdbcTemplate(dataSource);}

    /*
    홈 화면 (게시글 목록 조회)
     */
    public List<GetHomeRes> selectPost(){
        String selectPostQuery = "SELECT P.postIdx, P.userIdx, P.projectIdx, P.title, P.HeadCount, P.position, P.framework,\n" +
                "      P.content, P.matchStatus, P2.time, P2.location, P2.matchType, P2.isOffline FROM Post P\n" +
                "          JOIN Project P2 on P.projectIdx = P2.idx order by P.createdAt DESC\n";

        return this.jdbcTemplate.query(selectPostQuery,
                (rs, rowNum) -> new GetHomeRes(
                        rs.getInt("postIdx"),
                        rs.getInt("userIdx"),
                        rs.getInt("projectIdx"),
                        rs.getString("title"),
                        rs.getInt("headCount"),
                        rs.getString("position"),
                        rs.getString("framework"),
                        rs.getString("matchStatus"),
                        rs.getString("time"),
                        rs.getString("location"),
                        rs.getString("matchType"),
                        rs.getString("isOffLine")
                ));
    }


}
