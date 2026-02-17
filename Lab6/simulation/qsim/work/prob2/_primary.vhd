library verilog;
use verilog.vl_types.all;
entity prob2 is
    port(
        \3-0\           : out    vl_logic_vector(0 to 6);
        reset           : in     vl_logic;
        Clock           : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        data_in         : in     vl_logic;
        \7-4\           : out    vl_logic_vector(0 to 6);
        current_state   : out    vl_logic_vector(0 to 6);
        ledn            : out    vl_logic_vector(0 to 6);
        sign            : out    vl_logic_vector(0 to 6)
    );
end prob2;
