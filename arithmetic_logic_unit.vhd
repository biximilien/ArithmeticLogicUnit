-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- cadre       : conception des circuits integrés ( gen 1333 )               --
--             : projet de conception 1                                      --
-- par         : maxime gauthier                                             --
-- date        : 03 / 21 / 2015                                              --
-- fichier     : arithmetic_logic_unit.vhdl                                    --
-- description : vhdl pour une unité arithmétique logique générique (n bits) --
--             : basé sur du matériel de cours fourni par ahmed lakhsassi    --
--             : et du code originellement écrit par antoine shaneen         --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- librairie a inclure
library ieee;
use ieee.std_logic_1164.all;

-- déclaration de l'entité de l'unité arithmétique logique générique (n bits) paramétrable
entity arithmetic_logic_unit is
  generic ( n : integer := 8);
  port (
  
    -- entrées:
    operand_a     : in  std_logic_vector(n downto 1);
    operand_b     : in  std_logic_vector(n downto 1);
    mode_selector : in  std_logic_vector(3 downto 1);

    -- sorties:
    result        : out std_logic_vector(n downto 1);
    overflow_flag : out std_logic
    carry_flag    : out std_logic
    zero_flag     : out std_logic
    sign_flag     : out std_logic
    parity_flag   : out std_logic

  );
end arithmetic_logic_unit;

-- architecture structurelle de l'additionneur générique (n bits).
architecture arithmetic_logic_unit_impl of additionneur_n_bits is

  -- declaration des composants
  -- on ne declare pas un additionneur de 1-bit si c'est definit dans package
  component additionneur
    port( a, b, cin : in std_logic; q, cout : out std_logic );
  end component;

  -- zone de déclaration
  signal cs : std_logic_vector (n downto 0); -- pour garder le carry
  begin

    cs(0) <= cin;
    cout  <= cs(n);
    
    --instantiation de l'additionneur de 1 bit n fois
    sommateur : for i in 1 to n generate
      somme_de_n_bits : additionneur
      port map (
        a => a(i),
        b => b(i),
        cin => cs(i-1),
        q => q(i),
        cout => cs(i)
      );
    end generate sommateur;
end arithmetic_logic_unit_impl;
