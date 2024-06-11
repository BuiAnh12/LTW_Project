<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .wrapper {
            min-height: 100%;
            position: relative;
        }

        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            height: 20%; /* Set chiều cao của footer là 20% của chiều cao màn hình */
            background-color: #333333;
            box-shadow: 5px 10px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<footer class="text-light py-4" style="height:100%">
    <div class="container">
        <div class="row " >
            <div class="col-6 ">
                <h5>Về chúng tôi</h5>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla posuere quam at nisl eleifend, at
                    pretium elit aliquam. Integer laoreet, magna ut finibus bibendum, turpis ipsum fermentum lorem.</p>
            </div>
            <div class="col-6">
                <h5>Thông tin liên hệ</h5>
                <ul class="list-unstyled">
                    <li>Địa chỉ: 123 Đường, Thành phố, Quốc gia</li>
                    <li>Điện thoại: +1234567890</li>
                    <li>Email: info@example.com</li>
                </ul>
            </div>
        </div>
    </div>
</footer>

</body>
</html>