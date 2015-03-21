library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity twos_complement is
  port (

    -- inputs
    a : in std_ulogic;
    
    -- outputs
    y : out std_ulogic

  );
end twos_complement;

architecture twos_complement_n_impl of twos_complement_n is
  signal temp : std_logic_vector( N-1 downto 0 );
  begin
    temp <= not A;
    Y    <= std_logic_vector(unsigned(temp + 1));
end twos_complement_n_impl;