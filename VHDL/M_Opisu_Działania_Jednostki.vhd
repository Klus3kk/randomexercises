architecture pierwsza of sumatoris
signal s1:std_logic; --deklaracja sygnału

begin
-- ZBIÓR WSPÓŁBIERZNIE
-- REALIZOWANYCH PROCESÓW
- KAŻDA LINIA ODDZIELNY PROCES
s1<= (a and not b) or (b and not a);
s <= (cin and not s1) or (not cin and s1);
cout<= (a and b) or (s1 and cin);
end pierwsza;