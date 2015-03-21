library ieee;
use ieee.std_logic_1164.all;

entity exclusive_or_gate is
  port (
    x, y : in  std_ulogic;
    z    : out std_ulogic
  );
end entity exclusive_or_gate;

architecture exclusive_or_gate_impl of exclusive_or_gate is
  begin
    z <= x xor y;
end architecture exclusive_or_gate_impl;