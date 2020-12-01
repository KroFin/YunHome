package com.hopu.domain;


public class History {

  private long hId;
  private Integer roomId;
  private java.sql.Date hDate;
  private Integer hUserId;


  public long getHId() {
    return hId;
  }

  public void setHId(long hId) {
    this.hId = hId;
  }


  public Integer getRoomId() {
    return roomId;
  }

  public void setRoomId(Integer roomId) {
    this.roomId = roomId;
  }


  public java.sql.Date getHDate() {
    return hDate;
  }

  public void setHDate(java.sql.Date hDate) {
    this.hDate = hDate;
  }


  public Integer getHUserId() {
    return hUserId;
  }

  public void setHUserId(Integer hUserId) {
    this.hUserId = hUserId;
  }

}
