DROP TRIGGER IF EXISTS payments_after_insert;

DELIMITER $$
CREATE TRIGGER payments_after_insert -- naming convention: table that triggers the function, event
	AFTER INSERT ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount,
		payment_date = DATE(NOW())
    WHERE invoice_id = NEW.invoice_id;
END $$
DELIMITER ;