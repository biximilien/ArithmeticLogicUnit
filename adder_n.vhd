-- cadre : conception des circuits integrés ( gen 1333 )
-- par : antoine shaneen
-- date : 07 / 12 / 2005
-- fichier : adder_n.vhd
-- description : vhdl pour un additionneur générique (n bits)
-- en utilisant un type de description structurelle.

-- librairie a inclure
library ieee;
use ieee.std_logic_1164.all;

-- déclaration de l'entité de l'additionneur générique (n bits) paramétrable
entity additionneur_n_bits is
  generic ( n : integer := 8);
  port (
  
    -- entrées:
    a   : in std_logic_vector(n downto 1);
    b   : in std_logic_vector(n downto 1);
    cin : in std_logic;

    -- sorties:
    q: out std_logic_vector(n downto 1);
    cout: out std_logic

  );
end additionneur_n_bits;

-- architecture structurelle de l'additionneur générique (n bits).
architecture structurelle of additionneur_n_bits is

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
end structurelle;
