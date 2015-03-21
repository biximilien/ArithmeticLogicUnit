library ieee;
use ieee.std_logic_1164.all;

entity or_gate is
  port (
    x, y : in  std_ulogic;
    z    : out std_ulogic
  );
end entity or_gate;

architecture or_gate_impl of or_gate is
  begin
    z <= x or y;
end architecture or_gate_impl;
