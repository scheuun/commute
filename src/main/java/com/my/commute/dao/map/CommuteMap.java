package com.my.commute.dao.map;

import com.my.commute.model.Commute;

import java.util.List;

public interface CommuteMap {
    int startWork(Commute commute);
    List<Commute> listWork(String id);
    void endWork(Commute commute);
    int chkWork(String id);
}
