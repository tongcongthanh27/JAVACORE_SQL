--31. Đếm số lượng sản phẩm theo từng danh mục (`category_id`).
SELECT category_id, COUNT(*) AS so_luong_san_pham
FROM products
GROUP BY category_id
ORDER BY category_id;
--32. Tính tổng doanh thu (`SUM(total_amount)`) theo từng `status` của đơn hàng.
SELECT status , SUM(total_amount) as tongdoanhthu
from orders
group by status

--33. Tính số lượng đơn hàng của mỗi khách hàng, sắp xếp giảm dần theo số lượng.
select customer_id, count(*) as tongdonhang
from orders
group by customer_id
order by tongdonhang DESC
--34. Tìm các danh mục có **nhiều hơn 5 sản phẩm** (dùng `HAVING`).
select category_id, count(*) as sosanpham
from products
group by category_id
having count(*) >= 5
--35. Tính giá trị đơn hàng trung bình theo từng nhân viên phụ trách (`employee_id`).
select employee_id, AVG(total_amount) as trungbinh
from orders
group by employee_id
--36. Tìm những khách hàng có tổng chi tiêu (`SUM(total_amount)`) lớn hơn 50.000.000 VNĐ.
select customer_id , sum(total_amount) as tongchitieu
from orders
group by customer_id
HAVING SUM(total_amount) >= 50000000;
--37. Đếm số lượng đánh giá theo từng mức `rating` (1 đến 5 sao).
select rating, count(*) as soluong
from reviews
group by rating 
--38. Tính tổng số lượng nhập/xuất kho (`SUM(quantity)`) theo từng `movement_type`.
SELECT movement_type, 
sum(quantity) as soluong
from inventory_movements
group by movement_type
--39. Tìm các nhà cung cấp có ít nhất 10 sản phẩm đang hoạt động (`is_active = TRUE`).
select supplier_id,
count(*) as soluonghang
from products
WHERE is_active = TRUE
group by supplier_id
having count(*) >= 10 
--40. Tính doanh thu theo từng thành phố của địa chỉ giao hàng (`JOIN` bảng `addresses`, `GROUP BY city`).
SELECT a.city, SUM(o.total_amount) AS doanh_thu
FROM orders o
JOIN addresses a ON o.address_id = a.address_id
GROUP BY a.city
ORDER BY doanh_thu DESC;