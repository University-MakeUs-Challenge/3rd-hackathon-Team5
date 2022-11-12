package com.umc.haruject.src.home;

import org.springframework.stereotype.Service;



@Service
public class HomeService {
    private final HomeDao homeDao;
    private final HomeProvider homeProvider;

    public HomeService(HomeDao homeDao, HomeProvider homeProvider) {
        this.homeDao = homeDao;
        this.homeProvider = homeProvider;
    }



}
