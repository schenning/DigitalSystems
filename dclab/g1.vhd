-- File g1.vhd
-- about a few 100 of um^2
-- near 1-2 Ghz
entity g1 is
  port(clk, a: in bit;
       s: out bit);
end entity g1;

architecture arc of g1 is

  -- Internal copy; the output s will be a copy of this signal
  signal s_local: bit;

begin

  s <= s_local; -- Ihe output s is a copy of s_local

  p: process(clk)
  begin
    -- First, if the condition to start a macro-cycle does not hold, synchronize
    -- on a rising edge of clock where a is active. Else, start a macro-cycle.
    
    if clk = '1' and clk'event then
      if a = '1' and (cnt=0 or cnt = 31) then
		

        -- if not (clk = '1' and clk'event and a = '1') then
        --  wait until clk = '1' and clk'event and a = '1';
        -- end if;
        s_local <= '1'; -- a macro-cycle starts (set s_local)
        for i in 4 downto 0 loop -- a macro-cycle is made of 5 sequences
          for j in 1 to 2 ** i loop -- wait for 2^i cycles

          end loop;
          s_local <= not s_local; -- invert s_local
        end loop;
	  end if;
	end if; 
  end process p;



end architecture arc;
