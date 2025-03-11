-- user_roles_view.sql

CREATE OR REPLACE VIEW v_user_roles_view AS
SELECT
  us.user_id,
  us.username,
  us.first_name,
  ro.role_name,
  ro.description
FROM users_tb AS us
  INNER JOIN user_roles_tb AS ur ON us.user_id = ur.user_id
  INNER JOIN roles_tb AS ro ON ur.role_id = ro.role_id;
