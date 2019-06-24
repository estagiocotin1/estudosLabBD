CREATE TRIGGER tr_exemplo 
    BEFORE
    INSERT ON  prestacao
    FOR EACH ROW
    EXECUTE PROCEDURE fn_update_contrato(num_contrato)


CREATE OR REPLACE FUNCTION fn_audi_emp() RETURNS TRIGGER AS $$
    BEGIN
        INSERT INTO emplog VALUES(now(),userid, new.salario);
        RETURN NEW;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER tr_log_emp
BEFORE INSERT or UPDATE on empregado
FOR EACH ROW
EXECUTE PROCEDURE fn_audit_emp()