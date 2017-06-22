/*
Este programa busca la maxima combinacion de unos en la suma de un numero.
*/
CREATE OR REPLACE PACKAGE maxcandy AS
  FUNCTION decimal_a_binario(numero NUMBER) RETURN VARCHAR2;
  FUNCTION maximo_binario(num NUMBER) RETURN NUMBER;
END maxcandy;

CREATE OR REPLACE PACKAGE BODY maxcandy AS
FUNCTION decimal_a_binario(numero NUMBER)
RETURN VARCHAR2 IS
binario VARCHAR2(10000);
n NUMBER(2);
BEGIN
  n := numero;
  WHILE n <> 0 LOOP
    binario := TO_CHAR(MOD(n,2)) || binario;
    n := FLOOR(n/2);
  END LOOP;
  RETURN binario;
END;

FUNCTION maximo_binario(num NUMBER)
RETURN NUMBER IS
maxcandy NUMBER(10) := 0;
-- maximos
maxcandy_n1 NUMBER(10) := 0;
maxcandy_n2 NUMBER(10) := 0;
-- decimales
n1 NUMBER(10) := 0;
n2 NUMBER(10) := 0;
-- binarios
bn1 NUMBER(10) := 0;
bn2 NUMBER(10) := 0;
BEGIN
  FOR i IN 1..num LOOP
    n1 := i;
    n2 := num - i;
    bn1 := decimal_a_binario(n1);
    bn2 := decimal_a_binario(n2);

    IF REGEXP_COUNT(bn1, '1') + REGEXP_COUNT(bn2, '1') > maxcandy THEN
        maxcandy := REGEXP_COUNT(bn1, '1') + REGEXP_COUNT(bn2, '1');
        maxcandy_n1 := n1;
        maxcandy_n2 := n2;
    END IF;
  END LOOP;
  RETURN maxcandy_n1;
END;
END maxcandy;

BEGIN
  DBMS_OUTPUT.PUT_LINE(maxcandy.maximo_binario(10));
END;
