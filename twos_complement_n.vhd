library ieee;
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all;

entity twos_complement_n is
  generic ( N : positive := 8 );
  port (

    -- inputs
    a : in std_logic_vector ( N-1 downto 0 );
    
    -- outputs
    y : out std_logic_vector ( N downto 0 )

  );
end twos_complement_n;

architecture twos_complement_n_impl of twos_complement_n is
  signal temp : std_logic_vector( N-1 downto 0 );
  begin
    temp <= not A;
    Y    <= std_logic_vector(unsigned(temp + 1));
end twos_complement_n_impl;