CREATE or REPLACE FUNCTION idade (in_ssn character(9)) RETURNS int AS $$
DECLARE idade integer := 0;
BEGIN
    SELECT into idade EXTRACT(YEAR FROM age(bdate)) FROM employee WHERE ssn = in_ssn;
    RETURN idade;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION qtdFunc (dnum integer) RETURNS void AS $$
    DECLARE
        qtdeFuncionario int := 0;
    BEGIN
        SELECT INTO qtdeFuncionario COUNT(*) FROM employee where dnumero = dnum;
        UPDATE department SET qtdeFunc = qtdeFuncionairo where dnumero = dnum;
    END;
$$ LANGUAGE plpgsql;

SELECT dnum, qtdFunc(dnum) from department;

CREATE OR REPLACE FUNCTION converteSalario (salario numeric(10,2),dolar numeric(10,2)) RETURNS numeric (10,2) AS $$
    --DECLARE 
BEGIN
    RETURN cast ((salario/dolar) as numeric(10,2)); 
END;
$$ LANGUAGE plpgsql;

select salary, converteSalario(salary,2) from employee;