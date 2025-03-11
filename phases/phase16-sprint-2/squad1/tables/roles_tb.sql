CREATE TABLE roles_tb (
  role_id INT PRIMARY KEY,          -- ID único del rol
  role_name VARCHAR(255) NOT NULL,   -- Nombre del rol (por ejemplo, 'Admin', 'User')
  description TEXT                  -- Descripción del rol
);
