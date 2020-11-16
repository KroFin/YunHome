package com.hopu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hopu.domain.FtpConfig;
import com.hopu.domain.RoomImg;
import com.hopu.mapper.RoomImgMapper;
import com.hopu.service.RoomImgService;
import com.hopu.utils.FTPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class RoomImgServiceImpl implements RoomImgService {

    @Autowired
    private FtpConfig ftpConfig;

    @Autowired
    private RoomImgMapper roomImgMapper;
    @Override
    public PageInfo<RoomImg> findPage(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<RoomImg> list = roomImgMapper.findAll();
        return new PageInfo(list);
    }

    @Override
    public void add(RoomImg roomImg, MultipartFile roomImgs , HttpServletRequest request) {
        SimpleDateFormat sd = new SimpleDateFormat("yyyy/MM/dd");
        String realPath = request.getSession().getServletContext().getRealPath(File.separator);
        String format = sd.format(new Date(1));
        File file = new File(realPath + format);
        if (!file.isDirectory()){
            file.mkdirs();
        }
        String oldName = roomImgs.getOriginalFilename();
        MessageDigest messageDigest;
        try{
            messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(oldName.substring(0, oldName.indexOf(".")).getBytes());
            String newFileName = UUID.randomUUID() + roomImgs.getOriginalFilename();
            File storeFile = new File(file, oldName);
            roomImgs.transferTo(storeFile);
            InputStream in = new FileInputStream(storeFile);
            boolean res = FTPUtil.uploadFile(ftpConfig.getFTP_ADDRESS(), 21, ftpConfig.getFTP_USERNAME(),ftpConfig.getFTP_PASSWORD(), ftpConfig.getFTP_BASEPATH(), "/", oldName, in);

            roomImg.setImg(oldName);

            boolean delete = storeFile.delete();

            roomImgMapper.add(roomImg.getRoomId(),newFileName);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id) {
        RoomImg roomImg =roomImgMapper.findById(id);
        roomImgMapper.delete(id);

        // 从nginx服务器上移除图片
        // 同时删除nginx服务器上图片
        File file = new File("D:\\soft\\nginx\\mynginx\\nginx-1.18.0\\html",roomImg.getImg());
        if(file.exists()){
            file.delete();
        }
    }

    private String byte2Hex(byte[] bytes) {
        StringBuffer stringBuffer = new StringBuffer();
        String temp = "";
        for (int i = 0; i < bytes.length; i++) {
            temp = Integer.toHexString(bytes[i] & 0XFF);
            if(temp.length() == 1){
                stringBuffer.append("0");
            }
            stringBuffer.append(temp);
        }
        return stringBuffer.toString();
    }
}
