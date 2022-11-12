package com.umc.haruject.src.portfolio;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.portfolio.model.PostPortReq;
import com.umc.haruject.src.portfolio.model.PostPortRes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.umc.haruject.config.BaseResponseStatus.DATABASE_ERROR;

@Service
public class PortfolioService {

    private final PortfolioDao portfolioDao;
    private final PortfolioProvider portfolioProvider;

    @Autowired
    public PortfolioService(PortfolioDao portfolioDao, PortfolioProvider portfolioProvider) {
        this.portfolioDao = portfolioDao;
        this.portfolioProvider = portfolioProvider;
    }

    public PostPortRes createPortfolio(PostPortReq postPortReq) throws BaseException {
        try {
            int portfolioIdx = portfolioDao.createPortfolio(postPortReq);
            return new PostPortRes(portfolioIdx);
        } catch (Exception e) {
            System.out.println(e);
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
