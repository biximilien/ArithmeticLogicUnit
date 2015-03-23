library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity right_shift_n is
  generic ( N : positive := 8 );
  port (
    x : in  std_logic_vector ( N downto 1 );
    y : out std_logic_vector ( N downto 1 )
  );
end entity right_shift_n;

architecture right_shift_n_impl of right_shift_n is
  begin
    y <= std_logic_vector(unsigned(x) srl 1);
end architecture right_shift_n_impl;