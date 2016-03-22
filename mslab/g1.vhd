-- file g1.vhd

entity g1 is
  port(clk, a, rst: in bit;
       s: out bit);
end entity g1;

architecture arc of g1 is

-- internal copy; the output s will be a copy of this signal
  signal s_local: bit;

begin

  s <= s_local; -- the output s is a copy of s_local

  p: process(clk,a,rst)
  begin
  -- quesion about the syncranious reset.   
 
	  -- first, synchronize on a rising edge of clock where a is active
    if a='0' then
		clk = '1' and clk'event and a = '1' ;
	end if;
-- if not(clk='1' and clk'event a='1') then BETTER SOLUTION
    
    s_local <= '1'; -- a macro-cycle starts (set s_local)
    for i in 4 downto 0 loop -- a macro-cycle is made of 5 sequences
      for j in 1 to 2 ** i loop -- wait for 2^i cycles
         clk = '1';
      end loop;
      s_local <= not s_local; -- invert s_local
    end loop;
  end process p;

  --rs: process
--	wait until rst='1';
	
end architecture arc;

