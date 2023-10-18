-- Get the password of a user given the email. If the user is not registered, return NULL
SELECT password
FROM customer
WHERE email = ?; -- replace ? with the email