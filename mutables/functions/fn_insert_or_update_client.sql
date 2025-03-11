CREATE OR REPLACE FUNCTION FN_INSERT_OR_UPDATE_CLIENT(
  _id INT,
  _first_name VARCHAR(50),
  _last_name VARCHAR(50),
  _email VARCHAR(99),
  _phone VARCHAR(15)
) RETURNS VOID AS
$$
BEGIN
  IF EXISTS (SELECT 1 FROM clients_tb WHERE id = _id) THEN
    UPDATE clients_tb 
      SET 
        first_name = _first_name,
        last_name = _last_name,
        email = _email,
        phone = _phone
        WHERE id = _id;
  ELSE
    INSERT INTO clients_tb(id, first_name, last_name, email, phone)
    VALUES (_id, _first_name, _last_name, _email, _phone);
  END IF;
END;
$$
LANGUAGE 'plpgsql';
