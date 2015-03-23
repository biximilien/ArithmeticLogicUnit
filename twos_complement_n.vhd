library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity twos_complement_n is
  generic ( N : positive := 8 );
  port (
    x : in  std_logic_vector ( N downto 1 );
    y : out std_logic_vector ( N downto 1 )
  );
end twos_complement_n;

architecture twos_complement_n_impl of twos_complement_n is
  
  begin
    
    y <= std_logic_vector(unsigned(not(x)) + 1);
    
end architecture twos_complement_n_impl;