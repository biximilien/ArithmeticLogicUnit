-- fichier : adder.vhd : vhdl structurelle pour un additionneur
library ieee;
use ieee.std_logic_1164.all;

-- déclaration de l'entité de l'additionneur:
entity adder is
  port (

    -- entrées:
    augend    : in std_logic;
    addend    : in std_logic;
    carry_in  : in std_logic;

    -- sorties:
    sum       : out std_logic;
    carry_out : out std_logic

  );
end adder;

-- architecture style structurelle de l'adder:
architecture adder_impl of adder is

  -- déclaration des composants
  component exclusive_or_gate
    port(
      x, y : in  std_logic;
      z    : out std_logic
    );
  end component;

  component and_gate
    port(
      x, y : in  std_logic;
      z    : out std_logic
    );
  end component;

  component or_gate
    port(
      x, y : in  std_logic;
      z    : out std_logic
    );
  end component;

  -- instantiation
  -- signaux internes
  signal s1, s2, s3: std_logic;
  begin
    xor_1: exclusive_or_gate port map( augend, addend, s1 );
    xor_2: exclusive_or_gate port map( s1, carry_in, sum );
    and_1: and_gate port map( augend, addend, s3 );
    and_2: and_gate port map( s1, carry_in, s2 );
    or_1 : or_gate port map( s2, s3, carry_out );
end adder_impl;