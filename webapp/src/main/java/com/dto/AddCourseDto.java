package com.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AddCourseDto {

    @NotNull(message = "Tên khóa học là bắt buộc")
    @NotEmpty(message = "Tên khóa học không được để trống")
    @Size(min = 2, max = 100, message = "Tên khóa học phải có độ dài từ 2 đến 100 ký tự")
    private String courseName;

    @NotEmpty(message = "Mô tả không được để trống")
    private String description;

    @NotNull(message = "Danh sách bài học là bắt buộc")
    @Size(min = 1, message = "Phải có ít nhất một bài học")
    private List<String> lessons;
}
