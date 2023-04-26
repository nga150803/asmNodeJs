-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 10, 2023 lúc 04:36 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `asm_nodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name_category` varchar(100) NOT NULL,
  `order` int(11) NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name_category`, `order`, `role`) VALUES
(1, 'Hoa', 1, 1),
(2, 'Cây xanh\n', 2, 1),
(3, 'Vật dụng liên quan', 3, 1),
(4, 'Hoa khác', 4, 1),
(9, 'loai5', 7, 1),
(10, 'demo 1', 6, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `title_page` varchar(500) NOT NULL,
  `content_page` text NOT NULL,
  `role` int(11) NOT NULL,
  `img_page` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `title_page`, `content_page`, `role`, `img_page`) VALUES
(1, 'Meliore accusata indoctum ei nec', 'Meliore accusata indoctum ei nec\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante. Aliquam lorem ante, dapibus in, viverra quis,\r\n\r\nFeugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget eget dui. condime ntum rhoncus, sem quam semper libero sit. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamc er ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget\r\n\r\nLorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed diam nonum nibhie euismod. Facilisis at veroeros et accumsan et iusto odio dignissim qui blandit \r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum Theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante. Aliquam lorem ante, dapibus in, viverra quis, Feugiat a, tellus. Phasellusviverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies isi vel augue. Curab ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum, sem quam semper libero sit. Maecenas nec odio et ante. Aliquam lorem ante, dapibus in, viverra quis, Feugiat a, tellus. Phasellus iverra nut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies isi vel augue. Curabitur ullamcorper nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum\r\n\r\n', 1, '/img/product/page1.jpg'),
(2, 'Meliore accusata indoctum ei nec', 'Meliore accusata indoctum ei nec\r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante. Aliquam lorem ante, dapibus in, viverra quis,\r\n\r\nFeugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget eget dui. condime ntum rhoncus, sem quam semper libero sit. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamc er ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget\r\n\r\nLorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed diam nonum nibhie euismod. Facilisis at veroeros et accumsan et iusto odio dignissim qui blandit \r\nLorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum Theme natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante. Aliquam lorem ante, dapibus in, viverra quis, Feugiat a, tellus. Phasellusviverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies isi vel augue. Curab ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum, sem quam semper libero sit. Maecenas nec odio et ante. Aliquam lorem ante, dapibus in, viverra quis, Feugiat a, tellus. Phasellus iverra nut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies isi vel augue. Curabitur ullamcorper nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum\r\n\r\n', 1, '/img/product/page2.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name_product` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `img` varchar(500) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `product_details` text NOT NULL,
  `id_category` int(11) NOT NULL,
  `views` int(20) NOT NULL,
  `price_sale` int(100) NOT NULL,
  `hot` int(1) NOT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name_product`, `price`, `img`, `description`, `quantity`, `tags`, `product_details`, `id_category`, `views`, `price_sale`, `hot`, `date`) VALUES
(1, 'Hoa Moronto', 500000, '/img/product/product1.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 2, 'Tươi tốt, theo mùa, kết cấu', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 27, 500000, 1, NULL),
(2, 'Hoa mao lương', 300000, '/img/product/product2.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 2, 'Tươi tốt, theo mùa, kết cấu', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 58, 320000, 1, NULL),
(3, 'Chậu cây xanh', 350000, 'img/product/product3.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 12, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 2, 10, 360000, 1, NULL),
(5, 'Bó hoa hồng', 350000, 'img/product/product4.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 12, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 29, 360000, 0, NULL),
(7, 'Cỏ roi ngựa', 380000, '/img/product/product6.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 12, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 2, 34, 400000, 0, NULL),
(8, 'Hộp quà tặng', 250000, 'img/product/product7.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 1, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 3, 493, 280000, 1, NULL),
(9, 'Hoa lan trắng ', 380000, 'img/product/product8.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 32, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 100, 400000, 0, NULL),
(10, 'Gối tựa lưng', 300000, '/img/product/product9.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 12, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 23, 320000, 0, NULL),
(11, 'Hoa mẫu đơn', 300000, '/img/product/product10.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 12, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 23, 340000, 0, NULL),
(12, 'Lá cọ cắm hoa', 340000, '/img/product/product11.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 34, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 2, 12, 350000, 0, NULL),
(13, 'Hoa hồng cánh to', 340000, '/img/product/product12.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 34, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 12, 360000, 0, NULL),
(14, 'Đĩa ăn trang trí', 450000, 'img/product/product13.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 12, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 3, 23, 470000, 1, NULL),
(15, 'Hoa hồng size lớn', 380000, 'img/product/product14.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 12, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 432, 400000, 1, NULL),
(16, 'Chi cỏ chân ngỗng', 450000, 'img/product/product15.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 34, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 4, 243, 480000, 1, NULL),
(17, 'Hồng chùm màu', 470000, 'img/product/product16.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 34, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 243, 480000, 0, NULL),
(18, 'Cúc mâm xôi', 300000, 'img/product/product17.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 34, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 4, 12, 350000, 0, NULL),
(19, 'Lo cắm hoa mini', 100000, 'img/product/product18.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 70, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 3, 12, 110000, 0, NULL),
(20, 'Hoa cát tường', 540000, 'img/product/product19.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 23, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 1, 35, 550000, 0, NULL),
(21, 'Gối bông tựa lưng', 100000, 'img/product/product20.jpg', 'Hồng hay hường là tên gọi chung cho các loài thực vật có hoa dạng cây bụi hoặc cây leo lâu năm thuộc chi Rosa, họ Rosaceae, với hơn 100 loài với màu hoa đa dạng, phân bố từ miền ôn đới đến nhiệt đới. Các loài này nổi tiếng vì hoa đẹp nên thường gọi là hoa hồng.', 23, 'Tươi tốt, theo mùa, kết cấu đẹp', 'Với vẻ đẹp, hình dáng cùng hương thơm nổi bật, hoa hồng là hoa biểu trưng và được ưa chuộng nhiều nhất ở phương Tây, tương ứng trong tổng thể với hình tượng hoa sen ở châu Á, cả hai đều gần gũi với biểu tượng bánh xe. Trong văn hóa Ấn Độ, bông hồng vũ trụ Triparasundari được dùng làm vật đại diện cho vẻ đẹp của người Mẹ thánh thần, biểu thị một sự hoàn mĩ trọn vẹn và không có thiếu sót. Bên cạnh đó, hoa hồng còn tượng trưng cho phần thưởng cuộc sống, tâm hồn, trái tim, tình yêu, và có thể được chiêm ngưỡng như một mandala', 3, 35, 150000, 1, NULL),
(33, 'Sản phẩm test sửa', 490000, '', 'Đồ ngủ trẻ em với chất liệu mềm mịn tạo cảm giác thoáng mát khi mặc. Đồng thời toát lên vẻ dể thương cho các bé nhỏ.', 5, '', '', 1, 18, 500000, 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `role`) VALUES
(2, 'ngattps22580@fpt.edu.vn', 'tranhan1', '12345', 'admin'),
(5, 'ttnga1508@gmail.com', 'TranHaNga', '12345', 'user'),
(6, 'hanga1508@gmail.com', 'nga', '123', ''),
(7, 'minull1810@gmail.com', 'Min', '123456', 'user'),
(8, 'tranthinga1508@gmail.com', 'nga123', '12345', 'user');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
