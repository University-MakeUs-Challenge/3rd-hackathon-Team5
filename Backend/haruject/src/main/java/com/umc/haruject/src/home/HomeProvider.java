package com.umc.haruject.src.home;

import com.umc.haruject.config.BaseException;
import com.umc.haruject.src.home.model.GetHomeRes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.umc.haruject.config.BaseResponseStatus.*;

@Service
public class HomeProvider {
    private final HomeDao homeDao;

    final Logger logger = LoggerFactory.getLogger(this.getClass());
    public HomeProvider(HomeDao homeDao){
        this.homeDao = homeDao;
    }


    public List<GetHomeRes> getHome() throws BaseException {
        try{
            List<GetHomeRes> getHomeRes = homeDao.selectPost();
            return getHomeRes;
        }
        catch (Exception exception) {
            //System.out.println(exception);
            throw new BaseException(DATABASE_ERROR);
        }
    }
}
