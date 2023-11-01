-- Get the delivery days according to the city and quantity of items
SELECT CalculateDeliveryDays(?, ?) AS delivery_days; -- replace ? with customer_id and city respectively

-- Get the additional delivery days according to the quantity of items ordered
SELECT CalculateItemDeliveryDays(?, ?) AS additional_delivery_days; -- replace ? with item_id and quantity respectively