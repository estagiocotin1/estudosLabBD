CREATE	OR	REPLACE	FUNCTION fn_ex1(in_ssn character(9))	RETURNS	int	AS	$$
DECLARE
    idade	integer	:=	0;
BEGIN
    SELECT	INTO	idade	EXTRACT(YEAR FROM age(bdate)) 	FROM	employee where ssn = in_ssn;
    return	idade;
END;
$$ LANGUAGE plpgsql;

select fn_ex1(ssn) from employee;


alter table department add column qty_employees int;
CREATE	OR	REPLACE	FUNCTION fn_ex2(dnum int)	RETURNS	void	AS	$$
DECLARE
    qty_func int	:=	0;
BEGIN
    SELECT INTO qty_func count(*) FROM employee where dno = dnum;
    UPDATE department SET qty_employees = qty_func WHERE dnumber = dnum;
END;
$$ LANGUAGE plpgsql;

select dnumber, fn_ex2(dnumber) from department;


CREATE	OR	REPLACE	FUNCTION fn_ex4(salary numeric(10, 2), dolar numeric(10,2))	RETURNS	numeric(10,2)	AS	$$
BEGIN
    return cast((salary / dolar) as numeric(10, 2));
END;
$$ LANGUAGE plpgsql;

select salary, fn_ex2(salary, 2) from employee;


CREATE	OR	REPLACE	FUNCTION fn_ex5(in_ssn character(9))	RETURNS	boolean	AS	$$
DECLARE
    person record	:=	0;
BEGIN
    SELECT INTO person	EXTRACT(MONTH FROM age(bdate)) niver FROM	employee where ssn = in_ssn;
    return person.niver = 7;
END;
$$ LANGUAGE plpgsql;

select bdate, fn_ex5(ssn) from employee;

CREATE	OR	REPLACE	FUNCTION fn_ex6(in_ssn character(9))	RETURNS	boolean	AS	$$
DECLARE
    person record	:=	0;
BEGIN
    SELECT INTO person	EXTRACT(MONTH FROM age(bdate)) niver,	EXTRACT(MONTH FROM age(CURRENT_DATE)) mes_corrente FROM	employee where ssn = in_ssn;
    return person.niver = person.mes_corrente;
END;
$$ LANGUAGE plpgsql;

select bdate, fn_ex6(ssn) from employee;

CREATE	OR	REPLACE	FUNCTION fn_ex7(in_ssn character(9))	RETURNS	int	AS	$$
DECLARE
    qtd int	:=	0;
BEGIN
    SELECT INTO qtd	 count(distinct ssn) FROM	employee where superssn = in_ssn;
    return qtd;
END;
$$ LANGUAGE plpgsql;

select ssn, fn_ex7(ssn) from employee;

CREATE	OR	REPLACE	FUNCTION fn_ex8(in_ssn character(9))	RETURNS	numeric(10, 2)	AS	$$
DECLARE
    qtd numeric(10, 2)	:=	0;
BEGIN
    SELECT INTO qtd	 sum(hours) FROM works_on where essn = in_ssn;
    return qtd;
END;
$$ LANGUAGE plpgsql;

select ssn, fn_ex8(ssn) from employee;

--alter table employee add column hour_value numeric(10, 2);

CREATE	OR	REPLACE	FUNCTION fn_ex9(in_ssn character(9))	RETURNS	void	AS	$$
DECLARE
    total_hours numeric(10, 2)	:=	0;
BEGIN
    SELECT INTO total_hours	sum(hours) FROM works_on where essn = in_ssn;
    UPDATE employee SET hour_value = salary / total_hours WHERE ssn = in_ssn;
END;
$$ LANGUAGE plpgsql;

--select ssn, fn_ex9(ssn) from employee;