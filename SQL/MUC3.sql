--21. Đếm tổng số khách hàng trong bảng `customers` (`COUNT`).
select count(customer_id) from customers
--22. Tính tổng `total_amount` của toàn bộ đơn hàng có `status = 'completed'` (`SUM`).
select sum(total_amount) from orders where status = 'completed'
--23. Tính giá trị trung bình (`AVG`) của `unit_price` trong bảng `products`.
select avg(unit_price) from products 
--24. Tìm đơn hàng có `total_amount` nhỏ nhất và lớn nhất (`MIN`, `MAX`).
select min(total_amount), max(total_amount) from orders
--25. Tính doanh thu trung bình mỗi đơn hàng, làm tròn đến 2 chữ số thập phân (`ROUND`).
SELECT ROUND(AVG(total_amount), 2) FROM orders;
--26. Với bảng `products`, dùng `COALESCE` để hiển thị `cost_price`, nếu `NULL` thì thay bằng 0.
SELECT product_id,
       product_name,
       COALESCE(cost_price, 0) AS COALESCE
FROM products;
--27. Dùng `CASE WHEN` để phân loại sản phẩm theo mức giá: "Rẻ" (< 500k), "Trung bình" (500k–3tr), "Cao cấp" (> 3tr).
select *,
case 
	when unit_price < 500000 then 'Rẻ'	
	when unit_price > 500000 AND unit_price < 3000000 then 'Trung bình'
	else 'Cao cấp'
end as "Phân loại"
from products;
--28. Đếm số lượng đơn hàng theo từng `payment_method` (không cần `GROUP BY`, chỉ dùng nhiều `COUNT ... FILTER` hoặc subquery đơn giản).
SELECT
    COUNT(*) FILTER (WHERE payment_method = 'cod')           AS so_don_cod,
    COUNT(*) FILTER (WHERE payment_method = 'bank_transfer') AS so_don_bank_transfer,
    COUNT(*) FILTER (WHERE payment_method = 'credit_card')   AS so_don_credit_card,
    COUNT(*) FILTER (WHERE payment_method = 'e_wallet')      AS so_don_e_wallet
FROM orders;
--29. Tính tổng số lượng sản phẩm đã bán (`SUM(quantity)`) trong bảng `order_items`.
select sum(quantity) from order_items
--30. Dùng `CASE WHEN` gắn nhãn khách hàng "Khách mới" nếu `registration_date` sau ngày 2025-01-01, ngược lại là "Khách cũ".
select *,
	case
		when registration_date >= '2025-01-01' then 'Khách mới'
	else 'Khách cũ'
end as "Gán nhãn"
from customers;