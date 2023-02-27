package com.my.commute.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

public class Vacation {
    private int vacNum;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
    private LocalDate reqDate;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd", timezone="Asia/Seoul")
    private LocalDate vacDate;
    private String reason;
    private String agree;
    private float day;
    private float totalVac;
    private String id;

    public int getVacNum() {
        return vacNum;
    }

    public void setVacNum(int vacNum) {
        this.vacNum = vacNum;
    }

    public LocalDate getReqDate() {
        return reqDate;
    }

    public void setReqDate(LocalDate reqDate) {
        this.reqDate = reqDate;
    }

    public LocalDate getVacDate() {
        return vacDate;
    }

    public void setVacDate(LocalDate vacDate) {
        this.vacDate = vacDate;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getAgree() {
        return agree;
    }

    public void setAgree(String agree) {
        this.agree = agree;
    }

    public float getDay() {
        return day;
    }

    public void setDay(float day) {
        this.day = day;
    }

    public float getTotalVac() {
        return totalVac;
    }

    public void setTotalVac(float totalVac) {
        this.totalVac = totalVac;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
