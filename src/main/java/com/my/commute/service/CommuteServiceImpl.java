package com.my.commute.service;

import com.my.commute.dao.map.CommuteMap;
import com.my.commute.model.Commute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommuteServiceImpl implements CommuteService{
    @Autowired
    CommuteMap commuteMap;

    @Override
    public int startWork(Commute commute) {
        return commuteMap.startWork(commute);
    }
}
