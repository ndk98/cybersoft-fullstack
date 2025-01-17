CREATE DATABASE app_food CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE app_food;

CREATE TABLE IF NOT EXISTS `food_type`
(
    `type_id`   int          NOT NULL AUTO_INCREMENT,
    `type_name` varchar(255) NOT NULL,
    PRIMARY KEY (type_id)
);

CREATE TABLE IF NOT EXISTS `food`
(
    `food_id`   int          NOT NULL AUTO_INCREMENT,
    `food_name` varchar(255) NOT NULL,
    `image`     varchar(255),
    `price`     float        NOT NULL,
    `desc`      varchar(255),
    `type_id`   int          NOT NULL,
    PRIMARY KEY (food_id),
    FOREIGN KEY (type_id) REFERENCES food_type (type_id)
);

CREATE TABLE IF NOT EXISTS `sub_food`
(
    `sub_id`    int          NOT NULL AUTO_INCREMENT,
    `sub_name`  varchar(255) NOT NULL,
    `sub_price` float        NOT NULL,
    `food_id`   int          NOT NULL,
    PRIMARY KEY (sub_id),
    FOREIGN KEY (food_id) REFERENCES food (food_id)
);

CREATE TABLE IF NOT EXISTS `user`
(
    `user_id`   int          NOT NULL AUTO_INCREMENT,
    `full_name` varchar(255) NOT NULL,
    `email`     varchar(255) NOT NULL,
    `password`  varchar(255) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS `order`
(
    `user_id`    int          NOT NULL,
    `food_id`    int          NOT NULL,
    `amount`     int          NOT NULL,
    `code`       varchar(255) NOT NULL,
    `arr_sub_id` varchar(255),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (food_id) REFERENCES food (food_id)
);

CREATE TABLE IF NOT EXISTS `restaurant`
(
    `res_id`   int          NOT NULL AUTO_INCREMENT,
    `res_name` varchar(255) NOT NULL,
    `image`    varchar(255),
    `desc`     varchar(255),
    PRIMARY KEY (res_id)
);

CREATE TABLE IF NOT EXISTS `rate_res`
(
    `user_id`   int NOT NULL,
    `res_id`    int NOT NULL,
    `amount`    int NOT NULL,
    `date_rate` datetime,
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant (res_id)
);

CREATE TABLE IF NOT EXISTS `like_res`
(
    `user_id`   int NOT NULL,
    `res_id`    int NOT NULL,
    `date_like` datetime,
    FOREIGN KEY (user_id) REFERENCES user (user_id),
    FOREIGN KEY (res_id) REFERENCES restaurant (res_id)
);

INSERT INTO `restaurant` (`res_name`, `image`, `desc`)
VALUES ('Restaurant A', 'restaurant_a.png', 'Demo Description'),
       ('Restaurant B', 'restaurant_b.png', 'Demo Description'),
       ('Restaurant C', 'restaurant_b.png', 'Demo Description'),
       ('Restaurant D', 'restaurant_d.png', 'Demo Description'),
       ('Restaurant E', 'restaurant_e.png', 'Demo Description'),
       ('Restaurant F', 'restaurant_f.png', 'Demo Description'),
       ('Restaurant G', 'restaurant_g.png', 'Demo Description'),
       ('Restaurant H', 'restaurant_h.png', 'Demo Description');

INSERT INTO rate_res (user_id, res_id, amount, date_rate)
VALUES (1, 2, 5, '2024-01-01'),
       (2, 3, 4, '2024-01-02'),
       (3, 1, 3, '2024-01-03'),
       (4, 4, 5, '2024-01-04'),
       (5, 2, 2, '2024-01-05'),
       (6, 3, 4, '2024-01-06'),
       (7, 1, 5, '2024-01-07'),
       (8, 4, 3, '2024-01-08'),
       (9, 2, 4, '2024-01-09'),
       (10, 3, 5, '2024-01-10'),
       (11, 1, 2, '2024-01-11'),
       (12, 4, 5, '2024-01-12');

INSERT INTO like_res (user_id, res_id, date_like)
VALUES (1, 2, '2024-01-01'),
       (2, 3, '2024-01-02'),
       (3, 1, '2024-01-03'),
       (4, 4, '2024-01-04'),
       (5, 2, '2024-01-05'),
       (6, 3, '2024-01-06'),
       (7, 1, '2024-01-07'),
       (8, 4, '2024-01-08'),
       (9, 2, '2024-01-09'),
       (10, 3, '2024-01-10'),
       (11, 1, '2024-01-11'),
       (12, 4, '2024-01-12'),
       (1, 1, '2024-01-12'),
       (1, 1, '2024-01-12');

INSERT INTO food_type (type_name)
VALUES ('Asian Cuisine'),
       ('Fast Food'),
       ('Desserts'),
       ('Beverages'),
       ('Italian Cuisine'),
       ('Mexican Cuisine'),
       ('Indian Cuisine'),
       ('Mediterranean Cuisine'),
       ('Vegetarian'),
       ('Vegan'),
       ('Seafood'),
       ('Grill & BBQ'),
       ('Breakfast'),
       ('Snacks'),
       ('Street Food'),
       ('Chinese Cuisine'),
       ('French Cuisine'),
       ('Japanese Cuisine'),
       ('Korean Cuisine'),
       ('Healthy Food');

INSERT INTO `food` (`food_name`, `price`, `image`, `desc`, `type_id`)
VALUES ('Margherita Pizza', 8.99, 'margherita.jpg', 'Classic Italian pizza with tomatoes, mozzarella, and basil.', 5),
       ('Tacos', 6.49, 'tacos.jpg', 'Soft tacos filled with seasoned meat, lettuce, and cheese.', 6),
       ('Butter Chicken', 10.99, 'butter_chicken.jpg', 'Rich and creamy Indian curry with tender chicken.', 7),
       ('Sushi Platter', 15.99, 'sushi_platter.jpg', 'An assortment of fresh sushi and sashimi.', 18),
       ('Korean BBQ Ribs', 12.99, 'korean_bbq.jpg', 'Grilled beef ribs marinated in a sweet and savory sauce.', 19),
       ('Vegetarian Salad', 7.49, 'veg_salad.jpg', 'Fresh mix of greens, tomatoes, and cucumbers.', 9),
       ('Vegan Burger', 9.99, 'vegan_burger.jpg', 'Plant-based burger served with fries.', 10),
       ('Grilled Salmon', 13.99, 'grilled_salmon.jpg', 'Perfectly grilled salmon with a lemon butter sauce.', 11),
       ('Pancakes', 5.99, 'pancakes.jpg', 'Fluffy pancakes served with maple syrup.', 13),
       ('Cheeseburger', 7.99, 'cheeseburger.jpg', 'Juicy beef patty topped with cheese and veggies.', 2),
       ('Dim Sum', 9.49, 'dim_sum.jpg', 'Steamed dumplings filled with pork and shrimp.', 16),
       ('Crepes', 6.99, 'crepes.jpg', 'Thin French pancakes with sweet or savory fillings.', 17),
       ('Ramen', 10.49, 'ramen.jpg', 'Japanese noodle soup with pork, egg, and vegetables.', 18),
       ('Falafel Wrap', 8.49, 'falafel_wrap.jpg', 'Middle Eastern wrap with falafel, hummus, and veggies.', 17),
       ('Chocolate Cake', 4.99, 'chocolate_cake.jpg', 'Rich and moist chocolate cake.', 3),
       ('Smoothie', 3.99, 'smoothie.jpg', 'Refreshing fruit smoothie made with fresh ingredients.', 4),
       ('Grilled Chicken', 11.49, 'grilled_chicken.jpg', 'Juicy grilled chicken served with a side of vegetables.', 12),
       ('Street Tacos', 5.99, 'street_tacos.jpg', 'Authentic street-style tacos with spicy salsa.', 15),
       ('Biryani', 12.99, 'biryani.jpg', 'Fragrant spiced rice dish with chicken or lamb.', 7),
       ('Pho', 9.99, 'pho.jpg', 'Vietnamese noodle soup with beef and herbs.', 1);

INSERT INTO `user` (`full_name`, `email`, `password`)
VALUES ('Nguyen Dang Khoa', 'khoand@gmail.com', '12345'),
       ('Nguyen Thi Nguyen', 'nguyennt@gmail.com', '12345'),
       ('Nguyen Van Tan', 'tannv@gmail.com', '12345'),
       ('Nguyen Thi Lan', 'lannt@gmail.com', '12345'),
       ('Nguyen Thi My', 'mynt@gmail.com', '12345'),
       ('Pham Duy Quan', 'quanpd@gmail.com', '12345'),
       ('Tran Van Khiem', 'khiemtv@gmail.com', '12345'),
       ('Nguyen Van Minh', 'minhnv@gmail.com', '12345'),
       ('Ngo Van Sang', 'sangnv@gmail.com', '12345'),
       ('Do Thi Huong Quynh', 'quynhdth@gmail.com', '12345'),
       ('Bui The Hanh', 'hanhbt@gmail.com', '12345'),
       ('Do Thu Trang', 'trangdt@gmail.com', '12345'),
       ('Khuat Quang Nam', 'namkq@gmail.com', '12345');

INSERT INTO `order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`)
VALUES (1, 5, 2, 'ORD001', 'SUB001, SUB002'),
       (2, 10, 1, 'ORD002', 'SUB003'),
       (3, 7, 3, 'ORD003', 'SUB004, SUB005'),
       (4, 15, 1, 'ORD004', 'SUB006'),
       (5, 2, 4, 'ORD005', 'SUB007, SUB008'),
       (6, 9, 2, 'ORD006', 'SUB009'),
       (7, 20, 3, 'ORD007', 'SUB010, SUB011'),
       (8, 14, 1, 'ORD008', 'SUB012'),
       (9, 8, 2, 'ORD009', 'SUB013, SUB014'),
       (10, 12, 1, 'ORD010', 'SUB015'),
       (11, 3, 3, 'ORD011', 'SUB016, SUB017'),
       (12, 18, 1, 'ORD012', 'SUB018'),
       (2, 5, 6, 'ORD00999', 'SUB00999'),
       (2, 6, 4, 'ORD00100', 'SUB00100');

# 5 nguoi da like nha hang nhieu nhat
SELECT user.*, COUNT(lr.user_id) AS res_liked
FROM user
         INNER JOIN like_res AS lr ON user.user_id = lr.user_id
         INNER JOIN restaurant r on lr.res_id = r.res_id
GROUP BY lr.user_id
ORDER BY res_liked DESC
LIMIT 5;

# 2 nha hang co luot like nhieu nhat
SELECT res.*, COUNT(lr.res_id) AS liked
FROM restaurant AS res
         INNER JOIN like_res AS lr ON res.res_id = lr.res_id
GROUP BY lr.res_id
ORDER BY liked DESC
LIMIT 2;

# nguoi da dat hang nhieu nhat
SELECT u.*, COUNT(o.user_id) AS user_ordered
FROM user AS u
         INNER JOIN `order` o on u.user_id = o.user_id
GROUP BY o.user_id
ORDER BY user_ordered DESC
LIMIT 1;

# nguoi dung khong hoat dong trong he thong (khong order, khong like, khong danh gia nha hang)
SELECT u.*
FROM user AS u
         LEFT JOIN `order` o on u.user_id = o.user_id
         LEFT JOIN `like_res` lr on u.user_id = lr.user_id
         LEFT JOIN `rate_res` rr on u.user_id = rr.user_id
WHERE o.user_id IS NULL
  AND lr.user_id IS NULL
  AND rr.user_id IS NULL;