package com.my.commute.service;

import com.my.commute.dao.map.CommuteMap;
import com.my.commute.model.Commute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommuteServiceImpl implements CommuteService{
    @Autowired
    CommuteMap commuteMap;

    @Override
    public int startWork(Commute commute) {
        return commuteMap.startWork(commute);
    }

    @Override
    public List<Commute> listWork(String id, String startDate, String endDate) {
        return commuteMap.listWork(id, startDate, endDate);
    }

    @Override
    public void endWork(Commute commute) {
        commuteMap.endWork(commute);
    }

    @Override
    public int chkWork(String id) {
        return commuteMap.chkWork(id);
    }
}
