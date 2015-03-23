library ieee;
use ieee.std_logic_1164.all;

entity decoder38 is
  port (
    x : in  std_logic_vector ( 3 downto 1 );
    y : out std_logic_vector ( 8 downto 1 )
  );
end entity decoder38;

architecture decoder38_impl of decoder38 is
  begin
    with x select y <=
    "00000001" when "000",
    "00000010" when "001",
    "00000100" when "010",
    "00001000" when "011",
    "00010000" when "100",
    "00100000" when "101",
    "01000000" when "110",
    "10000000" when others;
end architecture decoder38_impl;
