-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception des circuits integrés                  --
--             : Projet de conception individuel 1                           --
-- Par         : Maxime Gauthier                                             --
-- Date        : 03 / 21 / 2015                                              --
-- Fichier     : arithmetic_logic_unit.vhd                                   --
-- Description : VHDL pour une unité arithmétique logique générique (n bits) --
--             : basé sur du matériel de cours fourni par Ahmed Lakhsassi    --
--             : et du code originellement écrit par Antoine Shaneen         --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- librairie a inclure
library ieee;
use ieee.std_logic_1164.all;

-- déclaration de l'entité de l'unité arithmétique logique générique (n bits) paramétrable
entity arithmetic_logic_unit is
  generic ( N : integer := 8);
  port (
    operand_a, operand_b : in  std_logic_vector (N downto 1);
    mode_selector        : in  std_logic_vector (3 downto 1);
    result               : out std_logic_vector (N downto 1);
    overflow_flag, carry_flag, zero_flag, sign_flag, parity_flag : out std_logic
  );
end arithmetic_logic_unit;

-- architecture structurelle de l'additionneur générique (n bits).
architecture arithmetic_logic_unit_impl of arithmetic_logic_unit is

  -- declaration des composants
  component adder_n
    port(
      augend, addend : in  std_logic_vector ( N downto 1 );
      sum            : out std_logic_vector ( N downto 1 );
      carry_flag     : out std_logic
    );
  end component;

  component subtractor_n
    port(
      minuend, subtrahend : in  std_logic_vector ( N downto 1 );
      difference          : out std_logic_vector ( N downto 1 );
      overflow_flag       : out std_logic
    );
  end component;
  
  begin
    
    

end arithmetic_logic_unit_impl;
