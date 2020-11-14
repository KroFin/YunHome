package com.hopu.domain;

import java.io.Serializable;

public class RoomImg implements Serializable {
    private Integer id;
    private Integer roomId; // 对应房屋编号
    private String img; // 房屋图片地址

    private Room room;

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "RoomImg{" +
                "id=" + id +
                ", roomId=" + roomId +
                ", img='" + img + '\'' +
                '}';
    }
}
