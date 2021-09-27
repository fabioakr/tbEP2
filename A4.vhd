library IEEE;
use IEEE.numeric_bit.all;

entity testbench is
end testbench;

architecture tb of testbench is
	component ram is
		generic(
    		addressSize: natural := 5;
        	wordSize:    natural := 8
    	);
    	port(
    		ck, wr: in  bit;
        	addr:   in  bit_vector(addressSize-1 downto 0);
        	data_i: in  bit_vector(wordSize-1 downto 0);
        	data_o: out bit_vector(wordSize-1 downto 0)
    	);
	end component;

	signal clock, enable:   bit;
    signal endereco: bit_vector(4 downto 0);
    signal codigo:   bit_vector(7 downto 0);
    signal saida:    bit_vector(7 downto 0);
    
begin
	DUT: ram port map(clock,enable,endereco,codigo,saida);
    
    process
    begin
    	assert false report "inicio" severity note;
    	
        clock <= '0';
        enable <= '1';
    	endereco <= "00000";
        codigo <= "01000000";
        wait for 1 ns;
        
        clock <= '1';
        wait for 1 ns;
        
        assert (saida = "01000000") report "Falhou" severity error;
        assert false report "fim" severity note;
    wait; -- Para a execucao (senao ele fica em loop infinito)
   	end process;
end tb;
