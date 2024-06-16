-- deklaracja standardowej
biblioteki i pakietu
library ieee;
-- import elementów pakietu biblioteki
use ieee.std_logic_1164.all;
entity sumator is
port(
a: in std_logic;
b: in std_logic;
cin: in std_logic;
s: out std_logic;
cout: out std_logic);
-- sygnały
end sumator ;