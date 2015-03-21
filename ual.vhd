-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : Conception des circuits integrés ( GEN 1333 )               --
--             : Projet de conception 1                                      --
-- Par         : Maxime Gauthier                                             --
-- Date        : 03 / 21 / 2015                                              --
-- Fichier     : ual.vhd                                                     --
-- Description : VHDL pour une unité arithmétique logique générique (n bits) --
--             : Basé sur du matériel de cours fourni par Ahmed Lakhsassi    --
--             : Et du code originellement écrit par Antoine Shaneen         --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

-- Librairie a inclure
LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Déclaration de l'entité de l'unité arithmétique logique générique (n bits) paramétrable
ENTITY ArithmeticLogicUnit IS
  GENERIC ( N : integer := 8);
  PORT (
  
    -- Entrées:
    OperandA     : IN  STD_LOGIC_VECTOR(N downto 1);
    OperandB     : IN  STD_LOGIC_VECTOR(N downto 1);
    ModeSelector : IN  STD_LOGIC_VECTOR(3 downto 1);

    -- Sorties:
    Result       : OUT STD_LOGIC_VECTOR(N downto 1);
    OverflowFlag : OUT STD_LOGIC
    CarryFlag    : OUT STD_LOGIC
    ZeroFlag     : OUT STD_LOGIC
    SignFlag     : OUT STD_LOGIC
    ParityFlag   : OUT STD_LOGIC

  );
END ArithmeticLogicUnit;

-- Architecture structurelle de l'additionneur générique (n bits).
ARCHITECTURE structurelle OF additionneur_n_bits IS

  -- Declaration des composants
  -- On ne declare pas un additionneur de 1-bit si c'est definit dans package
  COMPONENT additionneur
    port( A, B, Cin : in STD_LOGIC; Q, Cout : out STD_LOGIC );
  END COMPONENT;

  -- zone de déclaration
  signal CS : STD_LOGIC_VECTOR (N downto 0); -- pour garder le carry
  begin

    CS(0) <= Cin;
    Cout  <= CS(N);
    
    --instantiation de l'additionneur de 1 bit N fois
    sommateur : for i in 1 to N generate
      somme_de_n_bits : additionneur
      port map (
        A => A(i),
        B => B(i),
        Cin => CS(i-1),
        Q => Q(i),
        Cout => CS(i)
      );
    end generate sommateur;
end structurelle;
