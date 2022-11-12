package com.umc.haruject.src.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostProvider {

    private final PostDao postDao;


    @Autowired
    public PostProvider(PostDao postDao){
        this.postDao = postDao;
    }

}
