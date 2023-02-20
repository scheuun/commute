package com.my.commute.service;

import com.my.commute.model.Commute;

import java.util.List;

public interface CommuteService {
    int startWork(Commute commute);
    List<Commute> listWork(String id, String startDate, String endDate);
    void endWork(Commute commute);
    int chkWork(String id);
}
