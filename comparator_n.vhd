library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator_n is
  generic ( N : positive := 8 );
  port (
     x, y  : in  std_logic_vector ( N downto 1 );
    gt, eq : out std_logic
  );
end entity comparator_n;

architecture comparator_n_impl of comparator_n is
  
  begin
    
    gt <= '1' when x > y else '0';
    eq <= '1' when x = y else '0';
    
end architecture comparator_n_impl;