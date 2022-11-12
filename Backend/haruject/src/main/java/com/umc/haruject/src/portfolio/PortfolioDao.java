package com.umc.haruject.src.portfolio;

import com.umc.haruject.src.portfolio.model.GetPortRes;
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
}