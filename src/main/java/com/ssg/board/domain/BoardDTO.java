package com.ssg.board.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;
import org.apache.logging.log4j.core.config.plugins.validation.constraints.NotBlank;

import java.time.LocalDate;


@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardDTO {
    private Long bno;
    @NotBlank
    private String title;
    @NotBlank
    private String writer;
    @NotBlank
    private String content;
    @NotBlank
    private LocalDate regDate;
}
