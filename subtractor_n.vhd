-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception des circuits integrés                  --
--             : Projet de conception individuel 1                           --
-- Par         : Maxime Gauthier                                             --
-- Date        : 03 / 21 / 2015                                              --
-- Fichier     : subtractor_n.vhd                                            --
-- Description : VHDL pour une unité arithmétique logique générique (n bits) --
--             : basé sur du matériel de cours fourni par Ahmed Lakhsassi    --
--             : et du code originellement écrit par Antoine Shaneen         --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- librairie a inclure
library ieee;
use ieee.std_logic_1164.all;

-- déclaration de l'entité de l'additionneur générique (n bits) paramétrable
entity subtractor_n is
  generic ( N : integer := 8);
  port (
    minuend, subtrahend : in  std_logic_vector ( N downto 1 );
    carry_in            : in  std_logic;
    difference          : out std_logic_vector ( N downto 1 );
    overflow_flag       : out std_logic
  );
end entity subtractor_n;

-- architecture structurelle de l'additionneur générique (n bits).
architecture subtractor_n_impl of subtractor_n is

  -- declaration des composants
  component adder_n
    port(
      augend, addend : in  std_logic_vector ( N downto 1 );
      carry_in       : in  std_logic;
      sum            : out std_logic_vector ( N downto 1 );
      carry_out      : out std_logic
    );
  end component;

  component twos_complement_n
    port(
      x : in  std_logic_vector ( N downto 1 );
      y : out std_logic_vector ( N downto 1 )
    );
  end component;

  -- zone de déclaration
  signal s : std_logic_vector ( N downto 1 );

  begin
    adder_1 : adder_n port map(minuend, s, carry_in, difference, overflow_flag);
    twos_1  : twos_complement_n port map(subtrahend, s);
    
end architecture subtractor_n_impl;
