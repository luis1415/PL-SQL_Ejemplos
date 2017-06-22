/*
Split en PL/SQL
*/

-- Se crea la tabla para insertar los valores
CREATE TABLE tipo(
numero NUMBER(3),
clase VARCHAR2(20) NOT NULL
);

CREATE OR REPLACE PACKAGE string_to_arr AS
  TYPE t_array IS TABLE OF tipo.clase%TYPE INDEX BY BINARY_INTEGER;
  PROCEDURE string_to_array(cadena_ VARCHAR2);
END string_to_arr;

CREATE OR REPLACE PACKAGE BODY string_to_arr AS
PROCEDURE string_to_array(cadena_ VARCHAR2)
IS
sep tipo.clase%TYPE;
clase tipo.clase%TYPE;
fin tipo.clase%TYPE;
nums t_array;
cadena VARCHAR2(2000) := cadena_;
BEGIN
  IF INSTR(cadena, ';') <> 0 THEN
    clase := 'Clase A';
    sep := ';';
  END IF;
  IF INSTR(cadena, ',') <> 0 THEN
    clase := 'Clase B';
    sep := ',';
  END IF;
  IF INSTR(cadena, ' ') <> 0 THEN
    clase := 'Clase C';
    sep := ' ';
  END IF;
  FOR i IN 1..LENGTH(cadena) LOOP
    IF INSTR(cadena, sep) <> 0 AND LENGTH(cadena) > 0 THEN
      -- DBMS_OUTPUT.PUT_LINE(clase);
      fin := INSTR(cadena, sep);
      nums(i) := SUBSTR(cadena, 1, fin-1);
      cadena := SUBSTR(cadena, fin+1);
      -- DBMS_OUTPUT.PUT_LINE(nums(i));
      INSERT INTO tipo (numero, clase) VALUES (i, clase);
    END IF;
    IF INSTR(cadena, sep) = 0 AND LENGTH(cadena) > 0 THEN
      nums(i) := cadena;
      cadena := '';
      -- DBMS_OUTPUT.PUT_LINE(nums(i));
      INSERT INTO tipo (numero, clase) VALUES (i, clase);
    END IF;
  END LOOP;
  EXCEPTION
  WHEN OTHERS THEN
    -- DBMS_OUTPUT.PUT_LINE('ERROR');
END;
END string_to_arr;


BEGIN
  string_to_arr.string_to_array('1 2 3');
END;
