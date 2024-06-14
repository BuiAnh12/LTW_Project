-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 14, 2024 lúc 05:10 AM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `institutionmanagement`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`id`, `password`, `status`, `username`) VALUES
(1, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'admin'),
(2, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'admin2'),
(3, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'admin3'),
(4, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'admin4'),
(5, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'admin5'),
(6, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'teacher1'),
(7, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'teacher2'),
(8, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'teacher3'),
(9, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'teacher4'),
(10, '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', 1, 'teacher5');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account_role`
--

CREATE TABLE `account_role` (
  `account_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `account_role`
--

INSERT INTO `account_role` (`account_id`, `role_id`) VALUES
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `course_id` bigint(20) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`course_id`, `course_name`, `description`, `status`) VALUES
(1, 'Python', 'Học cơ bản về ngôn ngữ python', b'1'),
(2, 'Java', 'Học lập trình Java từ cơ bản đến nâng cao', b'1'),
(3, 'JavaScript', 'Học lập trình web với ngôn ngữ JavaScript', b'1'),
(4, 'HTML/CSS', 'Học thiết kế trang web với HTML và CSS', b'1'),
(5, 'React', 'Học phát triển ứng dụng web với ReactJS', b'1'),
(6, 'Node.js', 'Học xây dựng ứng dụng web với Node.js', b'1'),
(7, 'SQL', 'Học quản lý cơ sở dữ liệu với SQL', b'1'),
(8, 'C++', 'Học lập trình C++ từ cơ bản đến nâng cao', b'1'),
(9, 'Ruby', 'Học lập trình web với ngôn ngữ Ruby', b'1'),
(10, 'Swift', 'Học phát triển ứng dụng iOS với ngôn ngữ Swift', b'1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course_schedule`
--

CREATE TABLE `course_schedule` (
  `id` bigint(20) NOT NULL,
  `occurDate` date DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  `teacher_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `course_schedule`
--

INSERT INTO `course_schedule` (`id`, `occurDate`, `status`, `group_id`, `lesson_id`, `teacher_id`) VALUES
(1, '2024-06-11', b'0', 4, 13, 6),
(2, '2024-06-11', b'0', 4, 14, 10),
(3, '2024-06-11', b'0', 4, 15, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `end_date` date DEFAULT NULL,
  `format` bit(1) NOT NULL DEFAULT b'1',
  `group_detail` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `title` varchar(255) DEFAULT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `main_teacher_id` bigint(20) DEFAULT NULL,
  `supervisor_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `group`
--

INSERT INTO `group` (`id`, `end_date`, `format`, `group_detail`, `start_date`, `status`, `title`, `course_id`, `main_teacher_id`, `supervisor_id`) VALUES
(2, '2024-06-30', b'0', '3:00-5:00PM', '2024-06-12', b'1', 'Test', 2, 1, 2),
(3, '2024-06-29', b'1', '3:00-5:00AM', '2024-06-15', b'1', 'Test2', 7, 9, 3),
(4, '2024-06-29', b'1', '3:00-5:00PM', '2024-06-13', b'1', 'test3', 5, 1, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lesson`
--

CREATE TABLE `lesson` (
  `lesson_id` bigint(20) NOT NULL,
  `detail` text DEFAULT NULL,
  `status` bit(1) NOT NULL DEFAULT b'1',
  `course_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `lesson`
--

INSERT INTO `lesson` (`lesson_id`, `detail`, `status`, `course_id`) VALUES
(1, 'Bài 1: Giới thiệu về Python', b'1', 1),
(2, 'Bài 2: Cú pháp cơ bản của Python', b'1', 1),
(3, 'Bài 3: Cấu trúc điều khiển trong Python', b'1', 1),
(4, 'Bài 1: Giới thiệu về Java', b'1', 2),
(5, 'Bài 2: Cú pháp cơ bản của Java', b'1', 2),
(6, 'Bài 3: Cấu trúc điều khiển và vòng lặp trong Java', b'1', 2),
(7, 'Bài 1: Giới thiệu về JavaScript', b'1', 3),
(8, 'Bài 2: Xử lý sự kiện và DOM', b'1', 3),
(9, 'Bài 3: Xử lý Ajax và JSON trong JavaScript', b'1', 3),
(10, 'Bài 1: Giới thiệu về HTML và CSS', b'1', 4),
(11, 'Bài 2: Styling với CSS', b'1', 4),
(12, 'Bài 3: Layout và responsive design trong CSS', b'1', 4),
(13, 'Bài 1: Giới thiệu về React', b'1', 5),
(14, 'Bài 2: Cấu trúc và components trong React', b'1', 5),
(15, 'Bài 3: Quản lý trạng thái và sự kiện trong React', b'1', 5),
(16, 'Bài 1: Giới thiệu về Node.js', b'1', 6),
(17, 'Bài 2: Xử lý yêu cầu HTTP trong Node.js', b'1', 6),
(18, 'Bài 3: Sử dụng module và package trong Node.js', b'1', 6),
(19, 'Bài 1: Giới thiệu về SQL', b'1', 7),
(20, 'Bài 2: Truy vấn dữ liệu với SQL', b'1', 7),
(21, 'Bài 3: Tối ưu hóa truy vấn và quản lý cơ sở dữ liệu', b'1', 7),
(22, 'Bài 1: Giới thiệu về C++', b'1', 8),
(23, 'Bài 2: Cú pháp cơ bản của C++', b'1', 8),
(24, 'Bài 3: Lập trình hướng đối tượng trong C++', b'1', 8),
(25, 'Bài 1: Giới thiệu về Ruby', b'1', 9),
(26, 'Bài 2: Cấu trúc cơ bản của Ruby', b'1', 9),
(27, 'Bài 3: Sử dụng gem và framework trong Ruby', b'1', 9),
(28, 'Bài 1: Giới thiệu về Swift', b'1', 10),
(29, 'Bài 2: Cú pháp cơ bản của Swift', b'1', 10),
(30, 'Bài 3: Xử lý UI và chức năng cơ bản trong Swift', b'1', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `status` bit(1) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `registration`
--

INSERT INTO `registration` (`id`, `status`, `group_id`, `student_id`) VALUES
(4, NULL, 2, 1),
(11, NULL, 4, 5),
(12, NULL, 4, 8),
(13, NULL, 4, 9);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `role`
--

INSERT INTO `role` (`id`, `code`, `name`) VALUES
(1, 'ADMIN', 'Quản trị'),
(2, 'TEACHER', 'Giảng Viên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `id` bigint(20) NOT NULL,
  `additional_info` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `birthdate` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `laptop_available` bit(1) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `parent_name` varchar(255) DEFAULT NULL,
  `parent_tel` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`id`, `additional_info`, `age`, `birthdate`, `email`, `firstname`, `gender`, `laptop_available`, `lastname`, `location`, `login`, `middlename`, `parent_name`, `parent_tel`, `password`, `skype`) VALUES
(1, 'Nothin', 21, '2003-09-03', 'n21dccn096@gmail.com', 'Y', 'Nam', b'1', 'Huynh', 'Sai Gon', 'student1', 'Nhu', 'Huynh Luc', '0328542156', '123456', 'skype1@'),
(5, 'Details', 19, '2005-03-17', 'student5@gmail.com', 'Sophia', 'Ná»¯', b'1', 'Brown', 'Chicago', 'student5', 'Elizabeth', 'Sophia Brown', '0956732145', 'password5', 'skype5@'),
(6, 'Additional', 21, '2003-10-08', 'student6@gmail.com', 'Daniel', 'Nam', b'1', 'Martinez', 'Mexico City', 'student6', 'James', 'Daniel Martinez Sr.', '0213459876', 'password6', 'skype6@'),
(7, 'Extra info', 20, '2004-06-21', 'student7@gmail.com', 'Olivia', 'Nữ', b'1', 'Garcia', 'Madrid', 'student7', 'Maria', 'Olivia Garcia', '0658741236', 'password7', 'skype7@'),
(8, 'No data', 22, '2002-09-14', 'student8@gmail.com', 'William', 'Nam', b'1', 'Hernandez', 'Barcelona', 'student8', 'Alexander', 'William Hernandez', '0321456987', 'password8', 'skype8@'),
(9, 'Empty', 23, '2001-11-02', 'student9@gmail.com', 'Isabella', 'Nữ', b'1', 'Lopez', 'Paris', 'student9', 'Sophia', 'Isabella Lopez', '0956231478', 'password9', 'skype9@'),
(10, 'Nothing', 19, '2005-04-29', 'student10@gmail.com', 'Alexander', 'Nam', b'1', 'Scott', 'London', 'student10', 'Andrew', 'Alexander Scott Sr.', '0365987412', 'password10', 'skype10@'),
(11, 'Info', 20, '2004-07-13', 'student11@gmail.com', 'Mia', 'Nữ', b'1', 'Green', 'Sydney', 'student11', 'Madison', 'Mia Green', '0213548967', 'password11', 'skype11@'),
(12, 'More info', 22, '2002-10-18', 'student12@gmail.com', 'James', 'Nam', b'1', 'Adams', 'Toronto', 'student12', 'Logan', 'James Adams', '0987456321', 'password12', 'skype12@'),
(13, 'Details', 21, '2003-11-25', 'student13@gmail.com', 'Charlotte', 'Nữ', b'1', 'Baker', 'Melbourne', 'student13', 'Avery', 'Charlotte Baker', '0658741236', 'password13', 'skype13@'),
(14, 'Additional', 20, '2004-08-07', 'student14@gmail.com', 'Ethan', 'Nam', b'1', 'Hall', 'Vancouver', 'student14', 'Dylan', 'Ethan Hall', '0321598746', 'password14', 'skype14@'),
(15, 'Extra info', 19, '2005-05-03', 'student15@gmail.com', 'Ava', 'Nữ', b'1', 'Rivera', 'Mexico City', 'student15', 'Riley', 'Ava Rivera', '0956231478', 'password15', 'skype15@'),
(16, 'No data', 23, '2001-12-15', 'student16@gmail.com', 'Liam', 'Nam', b'1', 'Wright', 'Los Angeles', 'student16', 'Tyler', 'Liam Wright', '0213698745', 'password16', 'skype16@'),
(17, 'Empty', 21, '2003-09-28', 'student17@gmail.com', 'Amelia', 'Nữ', b'1', 'Gonzalez', 'Madrid', 'student17', 'Emma', 'Amelia Gonzalez', '0321456987', 'password17', 'skype17@'),
(18, 'Nothing', 20, '2004-07-01', 'student18@gmail.com', 'Noah', 'Nam', b'1', 'King', 'New York', 'student18', 'Benjamin', 'Noah King', '0987456321', 'password18', 'skype18@'),
(19, 'Info', 22, '2002-11-09', 'student19@gmail.com', 'Harper', 'Nữ', b'1', 'Evans', 'Toronto', 'student19', 'Mason', 'Harper Evans', '0213698745', 'password19', 'skype19@'),
(20, 'More info', 19, '2005-06-09', 'student20@gmail.com', 'Benjamin', 'Nam', b'1', 'Turner', 'Chicago', 'student20', 'Carter', 'Benjamin Turner', '0658741236', 'password20', 'skype20@'),
(23, '', 20, '', '', 'Anh Anh', '', b'0', '', '', '', '', '', '', '', ''),
(24, '', 12, '', '', 'Test ti', '', b'0', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `phone`, `status`, `account_id`) VALUES
(1, 'admin12@gmail.com', 'Huynh Nhu Y', 965951246, b'1', 1),
(2, 'admin2@gmail.com', 'John Doe', 987654321, b'1', 2),
(3, 'admin3@gmail.com', 'Emily Smith', 123456789, b'1', 3),
(4, 'admin4@gmail.com', 'Michael Johnson', 321654987, b'1', 4),
(5, 'admin5@gmail.com', 'Sophia Brown', 956732145, b'1', 5),
(6, 'teacher1@gmail.com', 'Daniel Martinez', 213459876, b'1', 6),
(7, 'teacher2@gmail.com', 'Olivia Garcia', 658741236, b'1', 7),
(8, 'teacher3@gmail.com', 'William Hernandez', 321456987, b'1', 8),
(9, 'teacher4@gmail.com', 'Isabella Lopez', 956231478, b'1', 9),
(10, 'teacher5@gmail.com', 'Alexander Scott', 365987412, b'1', 10);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `account_role`
--
ALTER TABLE `account_role`
  ADD KEY `FK_p2jpuvn8yll7x96rae4hvw3sj` (`role_id`),
  ADD KEY `FK_ibmw1g5w37bmuh5fc0db7wn10` (`account_id`);

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course_id`),
  ADD UNIQUE KEY `UK_h03guhdkm04pxnlyep8ki8fg3` (`course_name`);

--
-- Chỉ mục cho bảng `course_schedule`
--
ALTER TABLE `course_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_kbvk7qcqjgnmol9cwx4g28v3a` (`group_id`),
  ADD KEY `FK_dqlqbdvruef59ghq585phmuas` (`lesson_id`),
  ADD KEY `FK_sog07fccrujlk7koa8uic5twu` (`teacher_id`);

--
-- Chỉ mục cho bảng `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_k3pkc6ovd1idfuih83l1lq63f` (`course_id`),
  ADD KEY `FK_i7f97h1xjjqkp4ve5xl4bilh7` (`main_teacher_id`),
  ADD KEY `FK_700va3q4ko77jds3iqwvde4qg` (`supervisor_id`);

--
-- Chỉ mục cho bảng `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `FK_swxtnpbei5seidnpkvxyqph49` (`course_id`);

--
-- Chỉ mục cho bảng `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_h0sm5r5grwxru3u421qqfl5ne` (`group_id`),
  ADD KEY `FK_2x3j4dh87jqmaocem6njdr57u` (`student_id`);

--
-- Chỉ mục cho bảng `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_nh9shkv6p10cahqqeoshgjxs3` (`account_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
  MODIFY `course_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `course_schedule`
--
ALTER TABLE `course_schedule`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `group`
--
ALTER TABLE `group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `lesson`
--
ALTER TABLE `lesson`
  MODIFY `lesson_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `account_role`
--
ALTER TABLE `account_role`
  ADD CONSTRAINT `FK_ibmw1g5w37bmuh5fc0db7wn10` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`),
  ADD CONSTRAINT `FK_p2jpuvn8yll7x96rae4hvw3sj` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Các ràng buộc cho bảng `course_schedule`
--
ALTER TABLE `course_schedule`
  ADD CONSTRAINT `FK_dqlqbdvruef59ghq585phmuas` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  ADD CONSTRAINT `FK_kbvk7qcqjgnmol9cwx4g28v3a` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`),
  ADD CONSTRAINT `FK_sog07fccrujlk7koa8uic5twu` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `group`
--
ALTER TABLE `group`
  ADD CONSTRAINT `FK_700va3q4ko77jds3iqwvde4qg` FOREIGN KEY (`supervisor_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_i7f97h1xjjqkp4ve5xl4bilh7` FOREIGN KEY (`main_teacher_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_k3pkc6ovd1idfuih83l1lq63f` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Các ràng buộc cho bảng `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `FK_swxtnpbei5seidnpkvxyqph49` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`);

--
-- Các ràng buộc cho bảng `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `FK_2x3j4dh87jqmaocem6njdr57u` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `FK_h0sm5r5grwxru3u421qqfl5ne` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`);

--
-- Các ràng buộc cho bảng `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_nh9shkv6p10cahqqeoshgjxs3` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
