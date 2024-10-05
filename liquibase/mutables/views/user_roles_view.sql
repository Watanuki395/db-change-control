-- user_roles_view.sql

CREATE OR REPLACE VIEW user_roles_view AS
SELECT
    u.user_id,
    u.username,
    u.first_name,
    r.role_name,
    r.description
FROM users_tb u
JOIN user_roles_tb ur ON u.user_id = ur.user_id
JOIN roles_tb r ON ur.role_id = r.role_id;
