package com.umc.haruject.src.portfolio;

import com.umc.haruject.src.portfolio.model.GetPortRes;
import com.umc.haruject.src.portfolio.model.PostPortReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;

@Repository
public class PortfolioDao {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public GetPortRes getPortfolio(int idx) {
        String getPortQuery = "select * from Portfolio where idx = ?";
        return this.jdbcTemplate.queryForObject(getPortQuery,
                (rs, rowNum) -> new GetPortRes(
                        rs.getInt("idx"),
                        rs.getInt("userIdx"),
                        rs.getString("position"),
                        rs.getString("framework"),
                        rs.getString("info"),
                        rs.getDate("createdAt"),
                        rs.getDate("updatedAt")
                ), idx);
    }

    public int createPortfolio(PostPortReq postPortReq) {
        String createPortQuery = "insert into Portfolio (userIdx, position, framework, info) values (?, ?, ?, ?)";
        Object[] createPortParams = new Object[]{postPortReq.getUserIdx(), postPortReq.getPosition(), postPortReq.getFramework(), postPortReq.getInfo()}; // 동적 쿼리의 ?부분에 주입될 값
        this.jdbcTemplate.update(createPortQuery, createPortParams);
        String lastInsertIdQuery = "select last_insert_id()";
        return this.jdbcTemplate.queryForObject(lastInsertIdQuery, int.class);
    }
}