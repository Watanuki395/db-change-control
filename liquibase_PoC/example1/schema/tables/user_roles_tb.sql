CREATE TABLE user_roles_tb (
    user_id INT NOT NULL,
    role_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users_tb(user_id),
    FOREIGN KEY (role_id) REFERENCES roles_tb(role_id)
);
