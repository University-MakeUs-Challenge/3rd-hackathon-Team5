package com.umc.haruject.src.post;

import org.springframework.stereotype.Service;


@Service
public class PostService {
    private final PostDao postDao;
    private final PostProvider postProvider;

    public PostService(PostDao postDao, PostProvider postProvider) {
        this.postDao = postDao;
        this.postProvider = postProvider;
    }
}
