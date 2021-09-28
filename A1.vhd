library IEEE;
use IEEE.numeric_bit.all;

entity testbench is
end testbench;

architecture tb of testbench is
	component rom_simples is
    	port(
        	addr: in  bit_vector(4 downto 0);
            data: out bit_vector(7 downto 0)
        );
    end component;
    
    signal entrada: bit_vector(4 downto 0);
    signal saida:   bit_vector(7 downto 0);
    
begin
	DUT: rom_simples port map(entrada,saida);
    
    stimulus: process is -- Processo de testes
        -- Estrutura de dados com testes
		type test_record is record
        	endereco: bit_vector(4 downto 0);
            dado: bit_vector(7 downto 0);
		end record;

        -- Vetor com testes
		type tests_array is array (natural range <>) of test_record;
		constant tests : tests_array :=
         -- Endereco       Dado
         (("00000", "00000000"),
          ("00001", "00000011"),
          ("00010", "11000000"),
          ("00011", "00001100"),
          ("00100", "00110000"),
          ("00101", "01010101"),
          ("00110", "10101010"),
          ("00111", "11111111"),
          ("01000", "11100000"),
          ("01001", "11100111"),
          ("01010", "00000111"),
          ("01011", "00011000"),
          ("01100", "11000011"),
          ("01101", "00111100"),
          ("01110", "11110000"),
          ("01111", "00001111"),
          ("10000", "11101101"),
          ("10001", "10001010"),
          ("10010", "00100100"),
          ("10011", "01010101"),
          ("10100", "01001100"),
          ("10101", "01000100"),
          ("10110", "01110011"),
          ("10111", "01011101"),
          ("11000", "11100101"),
          ("11001", "01111001"),
          ("11010", "01010000"),
          ("11011", "01000011"),
          ("11100", "01010011"),
          ("11101", "10110000"),
          ("11110", "11011110"),
          ("11111", "00110001"));
           
		begin -- Conteudo dos testes
			assert false report "Test start." severity note;
    
		for k in tests'range loop
            
            entrada <= tests(k).endereco;
            wait for 10 ns;
            
            assert (tests(k).dado = saida)
                report "Erro: Entrada " & to_string(tests(k).endereco) severity error;
                --report "Erro!" severity error;
            
		end loop;

        -- Final do teste
		assert false report "Test done." severity note;
	wait; -- Fim da execucao
	end process;
    
end architecture;

-- Hello
-- Hey Jude
-- Hey
