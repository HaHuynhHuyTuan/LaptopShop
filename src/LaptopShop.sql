create database LaptopShop
use LaptopShop

INSERT INTO dbo.products (detail_desc, factory, image, name, price, quantity, short_desc, sold, target) VALUES
(N'ASUS TUF Gaming F15 FX506HF HN017W là chiếc laptop gaming giá rẻ nhưng vô cùng mạnh mẽ. Không chỉ bộ vi xử lý Intel thế hệ thứ 11, card đồ họa RTX 20 series mà điểm mạnh còn đến từ việc trang bị sẵn 16GB RAM, cho bạn hiệu năng xuất sắc mà không cần nâng cấp máy.', N'ASUS', N'1711078092373-asus-01.png', N'Laptop Asus TUF Gaming', 17490000, 100, N' Intel, Core i5, 11400H', 0, N'GAMING'),

(N'Khám phá sức mạnh tối ưu từ Dell Inspiron 15 N3520, chiếc laptop có cấu hình cực mạnh với bộ vi xử lý Intel Core i5 1235U thế hệ mới và dung lượng RAM lên tới 16GB. Bạn có thể thoải mái xử lý nhiều tác vụ, nâng cao năng suất trong công việc mà không gặp bất kỳ trở ngại nào.', N'DELL', N'1711078452562-dell-01.png', N'Laptop Dell Inspiron 15 ', 15490000, 200, N'i5 1235U/16GB/512GB/15.6"FHD', 0, N'SINHVIEN-VANPHONG'),

(N' Mới đây, Lenovo đã tung ra thị trường một sản phẩm gaming thế hệ mới với hiệu năng mạnh mẽ, thiết kế tối giản, lịch lãm phù hợp cho những game thủ thích sự đơn giản. Tản nhiệt mát mẻ với hệ thống quạt kép kiểm soát được nhiệt độ máy luôn mát mẻ khi chơi game.', N'LENOVO', N'1711079073759-lenovo-01.png', N'Lenovo IdeaPad Gaming 3', 19500000, 150, N' i5-10300H, RAM 8G', 0, N'GAMING'),

(N'Tận hưởng cảm giác mát lạnh sành điệu với thiết kế kim loại. Được thiết kế để đáp ứng những nhu cầu điện toán hàng ngày của bạn, dòng máy tính xách tay ASUS K Series sở hữu thiết kế tối giản, gọn nhẹ và cực mỏng với một lớp vỏ họa tiết vân kim loại phong cách.', N'ASUS', N'1711079496409-asus-02.png', N'Asus K501UX', 11900000, 99, N'VGA NVIDIA GTX 950M- 4G', 0, N'THIET-KE-DO-HOA'),

(N'Chiếc MacBook Air có hiệu năng đột phá nhất từ trước đến nay đã xuất hiện. Bộ vi xử lý Apple M1 hoàn toàn mới đưa sức mạnh của MacBook Air M1 13 inch 2020 vượt xa khỏi mong đợi người dùng, có thể chạy được những tác vụ nặng và thời lượng pin đáng kinh ngạc.', N'APPLE', N'1711079954090-apple-01.png', N'MacBook Air 13', 17690000, 99, N'Apple M1 GPU 7 nhân', 0, N'GAMING'),

(N'14.0 Chính: inch, 2880 x 1800 Pixels, OLED, 90 Hz, OLED', N'LG', N'1711080386941-lg-01.png', N'Laptop LG Gram Style', 31490000, 99, N'Intel Iris Plus Graphics', 0, N'DOANH-NHAN'),

(N'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm  ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.', N'APPLE', N'1711080787179-apple-02.png', N'MacBook Air 13 ', 24990000, 99, N' Apple M2 GPU 8 nhân', 0, N'MONG-NHE'),

(N'Là chiếc laptop gaming thế hệ mới nhất thuộc dòng Nitro 5 luôn chiếm được rất nhiều cảm tình của game thủ trước đây, Acer Nitro Gaming AN515-58-769J nay còn ấn tượng hơn nữa với bộ vi xử lý Intel Core i7 12700H cực khủng và card đồ họa RTX 3050, sẵn sàng cùng bạn chinh phục những đỉnh cao.', N'ACER', N'1711080948771-acer-01.png', N'Laptop Acer Nitro ', 23490000, 99, N'AN515-58-769J i7 12700H', 0, N'SINHVIEN-VANPHONG'),

(N'15.6 inch, FHD (1920 x 1080), IPS, 144 Hz, 250 nits, Acer ComfyView LED-backlit', N'ASUS', N'1711081080930-asus-03.png', N'Laptop Acer Nitro V', 26999000, 99, N' NVIDIA GeForce RTX 4050', 0, N'MONG-NHE'),

(N'Dell Inspiron N3520 là chiếc laptop lý tưởng cho công việc hàng ngày. Bộ vi xử lý Intel Core i5 thế hệ thứ 12 hiệu suất cao, màn hình lớn 15,6 inch Full HD 120Hz mượt mà, thiết kế bền bỉ sẽ giúp bạn giải quyết công việc nhanh chóng mọi lúc mọi nơi.', N'DELL', N'1711081278418-dell-02.png', N'Laptop Dell Latitude 3420', 21399000, 99, N' Intel Iris Xe Graphics', 0, N'MONG-NHE');
GO


INSERT INTO roles(name, description)
VALUES
    ('ADMIN', 'Admin thì full quyền'),
    ('USER', 'User thông thường');