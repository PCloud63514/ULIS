package org.ulis.domain;

import java.io.Serializable;

public class Send implements Serializable {
    private int sendNo;
    private String administratorNo;
    private int integrationMessageNo;
    private String studentNo;
    private String sendDate;
    private String sendStatus;

    private int itemStart;
    private int itemSizePerPage;

    public Send() {
    }
    
    public Send(int sendNo, String administratorNo, int integrationMessageNo, String studentNo, String sendDate, String sendStatus, int itemStart, int itemSizePerPage) {
        this.sendNo = sendNo;
        this.administratorNo = administratorNo;
        this.integrationMessageNo = integrationMessageNo;
        this.studentNo = studentNo;
        this.sendDate = sendDate;
        this.sendStatus = sendStatus;
        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setSendNo(int sendNo) {
        this.sendNo = sendNo;
    }

    public int getSendNo() {
        return this.sendNo;
    }

    public void setAdministratorNo(String administratorNo) {
        this.administratorNo = administratorNo;
    }

    public String getAdministratorNo() {
        return this.administratorNo;
    }

    public void setIntegrationMessageNo(int integrationMessageNo) {
        this.integrationMessageNo = integrationMessageNo;
    }

    public int getIntegrationMessageNo() {
        return this.integrationMessageNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getStudentNo() {
        return this.studentNo;
    }

    public void setSendDate(String sendDate) {
        this.sendDate = sendDate;
    }

    public String getSendDate() {
        return this.sendDate;
    }

    public void setSendStatus(String sendStatus) {
        this.sendStatus = sendStatus;
    }

    public String getSendStatus() {
        return this.sendStatus;
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