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
  
  component decoder38
    port(
      decoder_in  : in  std_logic_vector ( 3 downto 1 );
      decoder_out : out std_logic_vector ( 8 downto 1 )
    );
  end component;
  
  component right_shift_n
    port (
      rs_in  : in  std_logic_vector ( N downto 1 );
      rs_out : out std_logic_vector ( N downto 1 )
    );
  end component;
  
  component left_shift_n
    port (
      ls_in  : in  std_logic_vector ( N downto 1 );
      ls_out : out std_logic_vector ( N downto 1 )
    );
  end component;
  
  component comparator_n
    port (
       a, b  : in  std_logic_vector ( N downto 1 );
      gt, eq : out std_logic
    );
  end component;
    
  begin
    
    s1 <= operand_a, s2 <= operand_b when mode_selector = "00000000",
    s3 <= operand_a, s4 <= operand_b when mode_selector = "00000010",
    s5 <= operand_a when mode_selector = "00010000",
    s6 <= operand_a when mode_selector = "00100000",
    s7 <= operand_b when mode_selector = "01000000",
    s8 <= operand_b when others;
      
    adder: adder_n port map (s1, s2, result, carry_flag);
    subtractor: subtractor_n port map (s3, s4, result, overflow_flag);
    rs_a: right_shift_n port map (s5, result);
    ls_a: left_shift_n port map (s6, result);
    rs_b: right_shift_n port map (s7, result);
    ls_b: left_shift_n port map (s8, result);

end arithmetic_logic_unit_impl;
