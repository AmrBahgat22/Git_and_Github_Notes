library verilog;
use verilog.vl_types.all;
entity Parity_Generator_Tx is
    port(
        data_in_tx_par  : in     vl_logic_vector(7 downto 0);
        parity_out      : out    vl_logic
    );
end Parity_Generator_Tx;
