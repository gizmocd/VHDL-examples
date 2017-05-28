-- Simple OR gate design
library IEEE;
use IEEE.std_logic_1164.all;

entity xor_gate is
port(
  a: in std_logic;
  b: in std_logic;
  q: out std_logic);
end xor_gate;

architecture rtl of xor_gate is
begin
    q <= (a and not b) or (not a and b);
end rtl;

library IEEE;
use IEEE.std_logic_1164.all;

entity and_gate is
port(
  a1: in std_logic;
  b1: in std_logic;
  q1: out std_logic);
end and_gate;

architecture rtl1 of and_gate is
begin
    q1 <= a1 and b1;
end rtl1;

library IEEE;
use IEEE.std_logic_1164.all;

entity half_adder is
port(
  x: in std_logic;
  y: in std_logic;
  s: out std_logic;
  c: out std_logic);
end half_adder;

architecture STRUCTURE of half_adder is

component xor_gate
  port (
  a: in std_logic;
  b: in std_logic;
  q: out std_logic);
end component;

component and_gate
  port (
  a1: in std_logic;
  b1: in std_logic;
  q1: out std_logic);
end component;

begin
  G1: xor_gate port map (x,y,s);
  G2: and_gate port map (x,y,c);
end; 
