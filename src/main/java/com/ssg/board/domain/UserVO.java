package com.ssg.board.domain;

import lombok.*;

import java.time.LocalDateTime;

//CREATE TABLE tb_user(
//     useq INT AUTO_INCREMENT PRIMARY KEY,
//     uemail VARCHAR(100) NOT NULL UNIQUE,
//     upwd VARCHAR(100) NOT NULL,
//     uname VARCHAR(100) NOT NULL,
//     urole ENUM('USER', 'ADMIN') DEFAULT 'USER',
//     uuid VARCHAR(100),
//     resetexpire DATETIME,
//     delflag BOOLEAN DEFAULT FALSE,
//     regdate DATETIME DEFAULT CURRENT_TIMESTAMP
//);
@Data
public class UserVO {
    private int useq;
    private String uemail;
    private String upwd;
    private String uname;
    private String urole;
    private String uuid;
    private LocalDateTime resetexpire;
    private boolean delflag;
    private LocalDateTime regdate;
}
