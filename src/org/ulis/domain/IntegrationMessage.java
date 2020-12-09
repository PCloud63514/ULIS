package org.ulis.domain;

import java.io.Serializable;

public class IntegrationMessage implements Serializable {
    private int integrationMessageNo;
    private String title;
    private String content;

    private int itemStart;
    private int itemSizePerPage;

    public IntegrationMessage() {
    }
    
    public IntegrationMessage(int integrationMessageNo, String title, String content, int itemStart, int itemSizePerPage) {
        this.integrationMessageNo = integrationMessageNo;
        this.title = title;
        this.content = content;
        this.itemStart = itemStart;
        this.itemSizePerPage = itemSizePerPage;
    }

    public void setIntegrationMessageNo(int integrationMessageNo) {
        this.integrationMessageNo = integrationMessageNo;
    }

    public int getIntegrationMessageNo() {
        return this.integrationMessageNo;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return this.title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return this.content;
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