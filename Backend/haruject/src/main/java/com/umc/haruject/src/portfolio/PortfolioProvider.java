package com.umc.haruject.src.portfolio;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.portfolio.model.GetPortRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.umc.haruject.config.BaseResponseStatus.DATABASE_ERROR;

@Service
public class PortfolioProvider {
    private final PortfolioDao portfolioDao;

    @Autowired
    public PortfolioProvider(PortfolioDao portfolioDao) {
        this.portfolioDao = portfolioDao;
    }

    public GetPortRes getPortfolio(int idx) throws BaseException {
        try {
            GetPortRes getPortRes = portfolioDao.getPortfolio(idx);
            return getPortRes;
        } catch (Exception e) {
            throw new BaseException(DATABASE_ERROR);
        }

    }
}
