library ieee;
use ieee.std_logic_1164.all;

entity comparator is
  port (
    x, y : in  std_ulogic;
    z    : out std_ulogic
  );
end entity comparator;

architecture and_gate_impl of and_gate is
  begin
    z <= x and y;
end architecture and_gate_impl;
