CREATE TABLE user_roles_tb (
  user_id INT,                       -- ID del usuario
  role_id INT,                       -- ID del rol
  PRIMARY KEY (user_id, role_id),    -- Llave primaria compuesta
  FOREIGN KEY (user_id) REFERENCES users_tb (user_id) ON DELETE CASCADE,
  FOREIGN KEY (role_id) REFERENCES roles_tb (role_id) ON DELETE CASCADE
);
