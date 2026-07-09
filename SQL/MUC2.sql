--11. Lấy các đơn hàng có `status = 'completed'`.
select * from orders
where status = 'completed'
--12. Lấy các sản phẩm có `unit_price` lớn hơn 5.000.000 VNĐ **và** còn `is_active = TRUE`.
select * from products
where (unit_price >= 5000000) AND (is_active = 'TRUE')
--13. Lấy các khách hàng có `membership_level = 'Gold'` **hoặc** `membership_level = 'Platinum'`.
select * from customers
where (membership_level = 'Gold') OR (membership_level = 'Platinum')
--14. Lấy các đơn hàng có `status` nằm trong (`IN`) danh sách `('pending', 'confirmed', 'shipping')`.
select * from orders
where status in ('pending', 'confirmed', 'shipping')
--15. Lấy các sản phẩm **không** thuộc nhà cung cấp có `supplier_id` trong `(1, 2, 3)` (dùng `NOT IN`).
select * from products
where supplier_id not in (1, 2, 3)
--16. Lấy các sản phẩm có giá nằm trong khoảng từ 200.000 đến 1.000.000 VNĐ (dùng `BETWEEN`).
select * from products 
where unit_price between 200000 and 1000000
--17. Tìm các khách hàng có `full_name` chứa họ "Nguyễn" (dùng `LIKE`).
select * from customers
where full_name LIKE 'Nguyễn%'
--18. Tìm các sản phẩm có `product_name` chứa từ "laptop" mà không phân biệt hoa thường (dùng `ILIKE`).
select * from products
where product_name ILIKE 'laptop%'
--19. Lấy các đơn hàng chưa được gán nhân viên phụ trách (`employee_id IS NULL`).
select * from orders
where employee_id IS NULL
--20. Lấy các đánh giá (`reviews`) có `comment IS NOT NULL` và `rating >= 4`.
select * from reviews
where comment is NOT NULL AND rating >=4