-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component half_adder is
port(
  x: in std_logic;
  y: in std_logic;
  s: out std_logic;
  c: out std_logic);
end component;

signal x_in, y_in, s_out, c_out: std_logic;

begin

  -- Connect DUT
  DUT: half_adder port map(x_in, y_in, s_out, c_out);

  process
  begin
    x_in <= '1';
    y_in <= '1';
    wait for 1 ns;
    assert(s_out='0') report "Fail 1/1-s" severity error;
    assert(c_out='1') report "Fail 1/1-c" severity error;
  
  	x_in <= '0';
    y_in <= '1';
    wait for 1 ns;
    assert(s_out='1') report "Fail 0/1-s" severity error;
    assert(c_out='0') report "Fail 0/1-c" severity error;
    
    x_in <= '1';
    y_in <= '0';
    wait for 1 ns;
    assert(s_out='1') report "Fail 1/0-s" severity error;
    assert(c_out='0') report "Fail 1/0-c" severity error;
    
    x_in <= '0';
    y_in <= '0';
    wait for 1 ns;
    assert(s_out='0') report "Fail 0/0-s" severity error;
    assert(c_out='0') report "Fail 0/0-c" severity error;
    
    -- Clear inputs
    x_in <= '0';
    y_in <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
