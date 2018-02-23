----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- LSD.TOS, March 2017 (DO NOT REMOVE THIS LINE)
--
-- Static RAM controller (slow but safe)
--
--

library ieee;
use     ieee.std_logic_1164.all;
use     ieee.numeric_std.all;

entity sram_controller is
  generic
  (
    clock_frequency : real range 1.0e6 to 200.0e6 -- (in Hz) frequency of the clock signal
  );
  port
  (
    clock : in std_logic;

    sram_addr : out   std_logic_vector(19 downto 0);
    sram_dq   : inout std_logic_vector(15 downto 0);
    sram_ce_n : out   std_logic;
    sram_oe_n : out   std_logic;
    sram_we_n : out   std_logic;
    sram_ub_n : out   std_logic;
    sram_lb_n : out   std_logic;

    write_addr     : in  std_logic_vector(19 downto 0); -- write adress
    write_data     : in  std_logic_vector(15 downto 0); -- data to write
    write_request  : in  std_logic;                     -- when set to '1' request a write operation
    write_accepted : out std_logic;                     -- write done pulse

    read_addr    : in  std_logic_vector(19 downto 0); -- read adress
    read_data    : out std_logic_vector(15 downto 0); -- last data read
    read_request : in  std_logic;                     -- when set to '1' request a read operation
    read_valid   : out std_logic                      -- read done pulse
  );
end sram_controller;

architecture v1 of sram_controller is
  type state_t is (idle,writing,reading);
  attribute syn_encoding : string;                    -- make sure the state machine recovers
  attribute syn_encoding of state_t : type is "safe"; --   from an illegal state
  signal state   : state_t := idle;
  signal addr    : std_logic_vector(19 downto 0);
  signal data    : std_logic_vector(15 downto 0);
  signal counter : integer range 0 to integer(20.0e-9*clock_frequency) := 0; -- 20ns is substantially more that what is strictly necessary
begin
  process(clock) is
  begin
    if rising_edge(clock) then
      --
      -- Default actions
      --
      write_accepted <= '0';        -- write request not accepted
      read_valid <= '0';            -- read request not finished
      sram_addr <= (others => '0'); -- address is 0
      sram_dq <= (others => 'Z');   -- high impedance
      sram_ce_n <= '1';             -- inactive (chip not enabled)
      sram_oe_n <= '1';             -- inactive (output not enabled)
      sram_we_n <= '1';             -- inactive (write not enabled)
      sram_ub_n <= '1';             -- inactive (upper byte not enabled)
      sram_lb_n <= '1';             -- inactive (lower byte not enabled)
      --
      -- The state machine
      --
      case state is
        when idle =>
          if write_request = '1' then
            state <= writing;
            addr <= write_addr;
            data <= write_data;
            counter <= counter'high;
            write_accepted <= '1';
          elsif read_request = '1' then
            state <= reading;
            addr <= read_addr;
            counter <= counter'high;
          end if;
        when writing =>
          sram_addr <= addr;
          sram_dq <= data;
          sram_ce_n <= '0';
          sram_we_n <= '0';
          sram_ub_n <= '0';
          sram_lb_n <= '0';
          if counter /= 0 then
            counter <= counter-1;
          else
            state <= idle;
          end if;
        when reading =>
          sram_addr <= addr;
          sram_ce_n <= '0';
          sram_oe_n <= '0';
          sram_ub_n <= '0';
          sram_lb_n <= '0';
          if counter /= 0 then
            counter <= counter-1;
          else
            state <= idle;
            read_data <= sram_dq;
            read_valid <= '1';
          end if;
      end case;
    end if;
  end process;
end v1;
