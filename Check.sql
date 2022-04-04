SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE
    v_salario NUMBER(10, 2) := &salario;
BEGIN
    IF v_salario <= 1513.69 then
        dbms_output.put_line('Sem desconto: ' || v_salario);
        
ELSIF v_salario > 1513.70 AND v_salario <= 2725.12 then
    v_salario := v_salario(v_salario * 016);
    dbms_output.put_line('16% de desconto: ' || v_salario);
    
ELSE v_salario := v_salario - ( v_salario * 0.285 );
        dmbs_output.put_line('28,4% de desconto' || v_salario);
    END IF;
END;


CREATE TABLE ALUNO_TB (RA NUMBER(2) PRIMARY KEY, NOME VARCHAR2(30), NOTA NUMBER(4,2),MEDIA NUMBER(4,2), SITUACAO VARCHAR2(30), FALTAS NUMBER(38), C_HORA NUMBER(38));

BEGIN
    INSERT INTO ALUNO_TB VALUES ( 1, 'ANA', 10, NULL, NULL, 3, 100);
    INSERT INTO ALUNO_TB VALUES ( 2, 'JORGE', 5, NULL, NULL, 13, 100);
    INSERT INTO ALUNO_TB VALUES ( 3, 'CARLOS', 3, NULL, NULL, 90, 100);
END;

DROP TABLE ALUNO_TB;

---=-=-=-=-=-==-


DECLARE
    v_ra number(2) := &ra;
    v_nota number(4,2);
    v_situa varchar2(30);
BEGIN
    select nota into v_nota from aluno_tb where ra = v_ra;
    if v_nota > 6 then
    v_situa := 'Aprovado';
    dbms_output.put_line(v_ra || ' - ' || v_nota || ' - ' || v_situa);
    
   else
    v_situa := 'Reprovado';
    dbms_output.put_line(v_ra || ' - ' || v_nota || ' - ' || v_situa);
    end if;
    
    update aluno_tb set media = v_nota, situacao = v_situa where ra = v_ra;
    commit;
END;

select * from aluno_tb
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
