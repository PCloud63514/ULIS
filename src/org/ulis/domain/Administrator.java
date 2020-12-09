package org.ulis.domain;

import java.io.Serializable;

public class Administrator implements Serializable {
    private String administratorNo;
    private int subjectNo;
    private String administratorName;
    private String password;

    private int itemStart;
    private int itemSizePerPage;

    public Administrator() {
    }
    
    public Administrator(String administratorNo, int subjectNo, String administratorName, String password, int itemStart, int itemSizePerPage) {
        this.administratorNo = administratorNo;
        this.subjectNo = subjectNo;
        this.administratorName = administratorName;
        this.password = password;
        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setAdministratorNo(String administratorNo) {
        this.administratorNo = administratorNo;
    }

    public String getAdministratorNo() {
        return this.administratorNo;
    }

    public void setSubjectNo(int subjectNo) {
        this.subjectNo = subjectNo;
    }

    public int getSubjectNo() {
        return this.subjectNo;
    }

    public void setAdministratorName(String administratorName) {
        this.administratorName = administratorName;
    }

    public String getAdministratorName() {
        return this.administratorName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return this.password;
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