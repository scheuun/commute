package com.my.commute.dao.map;

import com.my.commute.model.Commute;
import com.my.commute.model.Vacation;

import java.util.List;

public interface VacationMap {
    List<Vacation> listVac(String id);
    int regVac(Vacation vacation);
    void cancelVac(int vacNum);
    Double cntVac(String id);
    List<Vacation> admVac(String agree);
    void agree(int vacNum);
}
