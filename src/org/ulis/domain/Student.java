package org.ulis.domain;

import java.io.Serializable;

public class Student implements Serializable {
    private String studentNo;
    private int subjectNo;
    private int grade;
    private String studentName;
    private String password;
    private String fcmToken;

    private int itemStart;
    private int itemSizePerPage;

    public Student() {
    }
    
    public Student(String studentNo, int subjectNo, int grade, String studentName, String password, String fcmToken, int itemStart, int itemSizePerPage) {
        this.studentNo = studentNo;
        this.subjectNo = subjectNo;
        this.grade = grade;
        this.studentName = studentName;
        this.password = password;
        this.fcmToken = fcmToken;
        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getStudentNo() {
        return this.studentNo;
    }

    public void setSubjectNo(int subjectNo) {
        this.subjectNo = subjectNo;
    }

    public int getSubjectNo() {
        return this.subjectNo;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getGrade() {
        return this.grade;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentName() {
        return this.studentName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return this.password;
    }

    public void setFcmToken(String fcmToken) {
        this.fcmToken = fcmToken;
    }

    public String getFcmToken() {
        return this.fcmToken;
    }

    public void setItemStart(int itemStart) {
        this.itemStart = itemStart;
    }

    public int getItemStart() {
        return this.itemStart;
    }

    public void setItemSizePerPage(int itemSizePerPage) {
        this.itemSizePerPage = itemSizePerPage;
    }

    public int getItemSizePerPage() {
        return this.itemSizePerPage;
    }
}