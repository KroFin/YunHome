package com.hopu.domain;


import java.sql.Date;

public class History {

  private long hhId;
  private Integer roomId;
  private java.sql.Date hhDate;
  private Integer hUserId;


  public long getHhId() {
    return hhId;
  }

  public void setHhId(long hhId) {
    this.hhId = hhId;
  }

  public Integer getRoomId() {
    return roomId;
  }

  public void setRoomId(Integer roomId) {
    this.roomId = roomId;
  }


  public Date getHhDate() {
    return hhDate;
  }

  public void setHhDate(Date hhDate) {
    this.hhDate = hhDate;
  }

  public Integer getHUserId() {
    return hUserId;
  }

  public void setHUserId(Integer hUserId) {
    this.hUserId = hUserId;
  }

}
