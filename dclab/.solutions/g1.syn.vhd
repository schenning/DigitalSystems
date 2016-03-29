-- file g1.vhd

entity g1 is
  port(clk, a, rst: in bit;
       s: out bit);
end entity g1;

architecture arc of g1 is

begin

  p: process(clk, rst)
    variable cnt: natural range 0 to 31;
  begin
    if rst = '1' then
      s <= '0';
      cnt := 0;
    elsif clk = '1' and clk'event then
      if cnt = 31 then
        cnt := 0;
      end if;
      if cnt = 0 and a = '1' then
        cnt := 1;
      elsif cnt /= 0 then
        cnt := cnt + 1;
      end if;
      case cnt is
        when 1 to 16 => s <= '1';
        when 25 to 28 => s <= '1';
        when 31 => s <= '1';
        when others => s <= '0';
      end case;
    end if;
  end process p;

end architecture arc;
