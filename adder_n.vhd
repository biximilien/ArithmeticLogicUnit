-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception des circuits integrés                  --
--             : Projet de conception individuel 1                           --
-- Par         : Maxime Gauthier                                             --
-- Date        : 03 / 21 / 2015                                              --
-- Fichier     : adder_n.vhd                                                   --
-- Description : VHDL pour une unité arithmétique logique générique (n bits) --
--             : basé sur du matériel de cours fourni par Ahmed Lakhsassi    --
--             : et du code originellement écrit par Antoine Shaneen         --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- librairie a inclure
library ieee;
use ieee.std_logic_1164.all;

-- déclaration de l'entité de l'additionneur générique (n bits) paramétrable
entity adder_n is
  generic ( N : integer := 8);
  port (
    augend, addend : in  std_logic_vector ( N downto 1 );
    sum            : out std_logic_vector ( N downto 1 );
    carry_in       : in  std_logic;
    carry_out      : out std_logic
  );
end adder_n;

-- architecture structurelle de l'additionneur générique (n bits).
architecture adder_n_impl of adder_n is

  -- declare components
  component adder
    port(
      augend, addend, carry_in : in  std_logic;
      sum, carry_out           : out std_logic
    );
  end component;

  -- declare signal
  signal cs : std_logic_vector ( N downto 0 ); -- pour garder le carry

  begin

    cs(0)     <= carry_in;
    carry_out <= cs(N);
    
    --instantiation de l'additionneur de 1 bit n fois
    summator : for i in 1 to N generate
      sum_n : adder
      port map (
        augend    => augend(i),
        addend    => addend(i),
        carry_in  => cs(i-1),
        sum       => sum(i),
        carry_out => cs(i)
      );
    end generate summator;
end adder_n_impl;
