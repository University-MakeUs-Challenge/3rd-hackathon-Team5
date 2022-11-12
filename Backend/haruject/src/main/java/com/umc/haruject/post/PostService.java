package com.umc.haruject.post;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostService {
    private final PostDao postDao;

    private final PostProvider postProvider;

    @Autowired
    public PostService(PostDao postDao, PostProvider postProvider){
        this.postDao=postDao;
        this.postProvider=postProvider;
    }
}
