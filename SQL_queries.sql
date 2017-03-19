#top ten merchants by total revenue
SELECT m.id, m.name, sum(it.quantity * unit_price) as revenue
FROM merchants m
INNER JOIN invoices i on m.id = i.merchant_id
INNER JOIN invoice_items it on i.id = it.invoice_id
GROUP BY m.id, m.name
ORDER BY revenue DESC
LIMIT 10;

# in ActiveRecord
# Merchant.joins(:transactions, :invoice_items).where(transactions: {result: "success"}).group(:id).order("sum(quantity * unit_price) DESC").LIMIT(5)

#returns the top x merchants ranked by total number of items sold
SELECT m.id, m.name, count(it.item_id) as total_sales
FROM merchants m
INNER JOIN invoices i on m.id = i.merchant_id
INNER JOIN invoice_items it on i.id = it.invoice_id
INNER JOIN payments p on i.id = p.invoice_id
WHERE p.result = 'success'
GROUP BY m.id, m.name
ORDER BY total_sales DESC
LIMIT 10;

#returns the total revenue for date x across all merchants
#WHERE date_trunc('day',DateField) = to_date('2010-01-01','YYYY-MM-DD')
#, 'YYYY-MM-DD h12:mi:ss')
SELECT m.name, i.created_at, sum(it.quantity * unit_price) as revenue
FROM merchants m
INNER JOIN invoices i on m.id = i.merchant_id
INNER JOIN payments p on p.invoice_id = i.id
INNER JOIN invoice_items it on i.id = it.invoice_id
where i.created_at = '2012-03-16 11:55:05'
  and p.result = 'success'
GROUP BY m.name, i.created_at;

#GET /api/v1/merchants/:id/revenue
#returns the total revenue for that merchant across all transactions
SELECT m.name, p.result, sum(it.quantity * unit_price) as revenue
FROM merchants m
INNER JOIN invoices i on m.id = i.merchant_id
INNER JOIN payments p on p.invoice_id = i.id
INNER JOIN invoice_items it on i.id = it.invoice_id
where m.name = 'Shields, Hirthe and Smith'
GROUP BY m.name, p.result
having p.result = 'success'
ORDER BY revenue DESC;

#GET /api/v1/merchants/:id/revenue?date=x
#returns the total revenue for that merchant for a specific invoice date x

#Ernser, Borer and Marks
SELECT m.name, i.created_at, p.result, sum(it.quantity * it.unit_price) as revenue
FROM merchants m
INNER JOIN invoices i on m.id = i.merchant_id
INNER JOIN payments p on p.invoice_id = i.id
INNER JOIN invoice_items it on i.id = it.invoice_id
where m.name = 'Ernser, Borer and Marks'
and i.created_at  = '2012-03-16 11:55:05'
GROUP BY m.name, p.result, i.created_at
having p.result = 'success'
ORDER BY revenue DESC;


#GET /api/v1/merchants/:id/favorite_customer
#returns the customer who has conducted the most total number of successful transactions
SELECT c.id, c.first_name, c.last_name, sum(p.id) as total_successful_transactions, p.result
FROM customers c
INNER JOIN invoices i on c.id = i.customer_id
INNER JOIN payments p on i.id = p.invoice_id
GROUP BY c.id, c.first_name, c.last_name, p.id, p.result
having p.result = 'success'
ORDER BY total_successful_transactions DESC
LIMIT 5;

#GET /api/v1/items/most_revenue?quantity=x
#returns the top x items ranked by total revenue generated
SELECT im.name, sum(it.quantity * it.unit_price) as total_revenue
FROM items im
INNER JOIN invoice_items it on im.id = it.item_id
GROUP BY im.name
ORDER BY total_revenue DESC
LIMIT 5;

#GET /api/v1/items/most_items?quantity=x
#returns the top x item instances ranked by total number sold
SELECT im.name, count(it.id) as total_sold
FROM items im
INNER JOIN invoice_items it on im.id = it.item_id
GROUP BY im.name
ORDER BY total_sold DESC
LIMIT 5;

#GET /api/v1/items/:id/best_day
#returns the date with the most sales for the given item using the invoice date.
#If there are multiple days with equal number of sales, return the most recent day.
SELECT im.id, date(i.created_at) as invoice_date, im.name, sum(im.id) as item_total
FROM invoices i
INNER JOIN invoice_items it on it.id = i.id
INNER JOIN items im on im.id = it.id
where im.id = 2198
GROUP BY im.id, im.name, invoice_date
ORDER BY item_total DESC
LIMIT 5;

#GET /api/v1/customers/:id/favorite_merchant 
#returns a merchant where the customer has conducted the most successful transactions
SELECT c.first_name, c.last_name, m.name, sum(p.id) as total_successful_transactions
FROM customers c
INNER JOIN invoices i on c.id = i.customer_id
INNER JOIN payments p on i.id = p.invoice_id
INNER JOIN merchants m on m.id = i.merchant_id
where p.result = 'success'
and c.id = '66'
GROUP BY c.first_name, c.last_name, m.name
ORDER BY total_successful_transactions DESC
LIMIT 5;