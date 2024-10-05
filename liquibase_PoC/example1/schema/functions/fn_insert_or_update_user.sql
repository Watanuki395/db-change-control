CREATE OR REPLACE FUNCTION public.fn_insert_or_update_user(p_username character varying, p_email character varying)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
DECLARE
BEGIN
    INSERT INTO users_tb (username, email)
    VALUES (p_username, p_email)
    ON CONFLICT (username) DO
        UPDATE SET email = EXCLUDED.email;
END;
$function$
;