--1. Lấy toàn bộ dữ liệu (`SELECT *`) từ bảng `customers`.
select * from customers;
--2. Lấy các cột `product_name`, `unit_price`, `stock_quantity` từ bảng `products`.
select "product_name", "unit_price", "stock_quantity" from products;
--3. Liệt kê danh sách **các thành phố** khác nhau xuất hiện trong bảng `addresses` (không trùng lặp).
select distinct city from addresses;
--4. Lấy 10 khách hàng đầu tiên trong bảng `customers` theo `customer_id`.
select * from customers where "customer_id"<=10;
--5. Lấy 10 sản phẩm có `unit_price` cao nhất, sắp xếp giảm dần theo giá.
select * from products
order by "unit_price" DESC
LIMIT 10
--6. Lấy danh sách 15 đơn hàng, bỏ qua 5 đơn đầu tiên (dùng `LIMIT` và `OFFSET`), sắp xếp theo `order_date` giảm dần.
select * from orders
order by "order_date" desc
limit 15
offset 5
--7. Liệt kê tên và email của toàn bộ nhân viên, sắp xếp theo `full_name` tăng dần.
select "full_name", "email" from employees
order by "full_name"
--8. Lấy danh sách các `membership_level` khác nhau đang tồn tại trong bảng `customers`.
select distinct "membership_level" from customers
--9. Lấy 20 sản phẩm có `stock_quantity` thấp nhất, sắp xếp tăng dần.
select * from products
order by "stock_quantity" 
--10. Lấy danh sách `category_name` và `slug` của tất cả danh mục, sắp xếp theo `display_order`.
select "category_name", "display_order" from categories
order by "display_order"