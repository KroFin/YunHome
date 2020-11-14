package com.hopu.domain;

import java.io.Serializable;
import java.util.List;

public class Room implements Serializable {
    private Integer id;
    private String title; // 房屋发布标题
    private Integer rent; // 房屋发布租金
    private String roomType; // 房型（ 一室 二室 三室 四室 五室及以上）
    private Integer userId;  // 所属房东编号
    private Integer regionId;  // 对应所在区域
    private String address;   // 房源地址
    private String detailAddress;   // 房源详细地址
    private String rentType;  // 出租方式：整租、合租
    private Double area;  // 房屋面积
    private String trafficCondition; // 交通情况
    private String facilitiesCondition; // 房屋设备情况
    private String roomDesc;  // 房屋描述
    private Integer rentStatus;  // 房屋出租状态。0：待出租；1：已出租；-1：未审核
    private Integer rentUserId;  // 房屋租户id，null表示还未出租

    private User user;
    private User rentUser;
    private Region region;
    private List<RoomImg> roomImgList;


    public User getRentUser() {
        return rentUser;
    }

    public void setRentUser(User rentUser) {
        this.rentUser = rentUser;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getRent() {
        return rent;
    }

    public void setRent(Integer rent) {
        this.rent = rent;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getRegionId() {
        return regionId;
    }

    public void setRegionId(Integer regionId) {
        this.regionId = regionId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getRentType() {
        return rentType;
    }

    public void setRentType(String rentType) {
        this.rentType = rentType;
    }

    public String getTrafficCondition() {
        return trafficCondition;
    }

    public void setTrafficCondition(String trafficCondition) {
        this.trafficCondition = trafficCondition;
    }

    public String getFacilitiesCondition() {
        return facilitiesCondition;
    }

    public void setFacilitiesCondition(String facilitiesCondition) {
        this.facilitiesCondition = facilitiesCondition;
    }

    public String getRoomDesc() {
        return roomDesc;
    }

    public void setRoomDesc(String roomDesc) {
        this.roomDesc = roomDesc;
    }

    public Integer getRentStatus() {
        return rentStatus;
    }

    public void setRentStatus(Integer rentStatus) {
        this.rentStatus = rentStatus;
    }

    public Integer getRentUserId() {
        return rentUserId;
    }

    public void setRentUserId(Integer rentUserId) {
        this.rentUserId = rentUserId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Region getRegion() {
        return region;
    }

    public void setRegion(Region region) {
        this.region = region;
    }

    public List<RoomImg> getRoomImgList() {
        return roomImgList;
    }

    public void setRoomImgList(List<RoomImg> roomImgList) {
        this.roomImgList = roomImgList;
    }

    @Override
    public String toString() {
        return "Room{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", rent=" + rent +
                ", roomType='" + roomType + '\'' +
                ", userId=" + userId +
                ", regionId=" + regionId +
                ", address='" + address + '\'' +
                ", detailAddress='" + detailAddress + '\'' +
                ", rentType='" + rentType + '\'' +
                ", trafficCondition='" + trafficCondition + '\'' +
                ", facilitiesCondition='" + facilitiesCondition + '\'' +
                ", roomDesc='" + roomDesc + '\'' +
                ", rentStatus='" + rentStatus + '\'' +
                ", user=" + user +
                ", region=" + region +
                ", roomImgList=" + roomImgList +
                '}';
    }
}
