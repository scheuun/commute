package com.my.commute.service;

import com.my.commute.dao.map.VacationMap;
import com.my.commute.model.Commute;
import com.my.commute.model.Vacation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VacationServiceImpl implements VacationService {
    @Autowired
    VacationMap vacationMap;

    @Override
    public List<Vacation> listVac(String id) {
        return vacationMap.listVac(id);
    }

    @Override
    public int regVac(Vacation vacation) {
        return vacationMap.regVac(vacation);
    }

    @Override
    public void cancelVac(int vacNum) {
        vacationMap.cancelVac(vacNum);
    }

    @Override
    public Double cntVac(String id) {
        return vacationMap.cntVac(id);
    }

    @Override
    public List<Vacation> admVac(String agree) {
        return vacationMap.admVac(agree);
    }

    @Override
    public void agree(int vacNum) {
        vacationMap.agree(vacNum);
    }


}
