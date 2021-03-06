-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.1
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SVPWM is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    s_axis_V_TDATA : IN STD_LOGIC_VECTOR (63 downto 0);
    s_axis_V_TVALID : IN STD_LOGIC;
    s_axis_V_TREADY : OUT STD_LOGIC;
    m_axis_V_TDATA : OUT STD_LOGIC_VECTOR (63 downto 0);
    m_axis_V_TVALID : OUT STD_LOGIC;
    m_axis_V_TREADY : IN STD_LOGIC );
end;


architecture behav of SVPWM is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "SVPWM,hls_ip_2017_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.130000,HLS_SYN_LAT=4,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=405,HLS_SYN_LUT=442}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_state2 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_state3 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_state4 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state5 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv2_0 : STD_LOGIC_VECTOR (1 downto 0) := "00";
    constant ap_const_lv2_2 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv2_3 : STD_LOGIC_VECTOR (1 downto 0) := "11";
    constant ap_const_lv2_1 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000001111";
    constant ap_const_lv17_7FFF : STD_LOGIC_VECTOR (16 downto 0) := "00111111111111111";
    constant ap_const_lv17_18001 : STD_LOGIC_VECTOR (16 downto 0) := "11000000000000001";
    constant ap_const_lv16_8001 : STD_LOGIC_VECTOR (15 downto 0) := "1000000000000001";
    constant ap_const_boolean_1 : BOOLEAN := true;

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal s_axis_V_0_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_vld_in : STD_LOGIC;
    signal s_axis_V_0_vld_out : STD_LOGIC;
    signal s_axis_V_0_ack_in : STD_LOGIC;
    signal s_axis_V_0_ack_out : STD_LOGIC;
    signal s_axis_V_0_payload_A : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_payload_B : STD_LOGIC_VECTOR (63 downto 0);
    signal s_axis_V_0_sel_rd : STD_LOGIC := '0';
    signal s_axis_V_0_sel_wr : STD_LOGIC := '0';
    signal s_axis_V_0_sel : STD_LOGIC;
    signal s_axis_V_0_load_A : STD_LOGIC;
    signal s_axis_V_0_load_B : STD_LOGIC;
    signal s_axis_V_0_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal s_axis_V_0_state_cmp_full : STD_LOGIC;
    signal m_axis_V_1_data_out : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_vld_in : STD_LOGIC;
    signal m_axis_V_1_vld_out : STD_LOGIC;
    signal m_axis_V_1_ack_in : STD_LOGIC;
    signal m_axis_V_1_ack_out : STD_LOGIC;
    signal m_axis_V_1_payload_A : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_payload_B : STD_LOGIC_VECTOR (63 downto 0);
    signal m_axis_V_1_sel_rd : STD_LOGIC := '0';
    signal m_axis_V_1_sel_wr : STD_LOGIC := '0';
    signal m_axis_V_1_sel : STD_LOGIC;
    signal m_axis_V_1_load_A : STD_LOGIC;
    signal m_axis_V_1_load_B : STD_LOGIC;
    signal m_axis_V_1_state : STD_LOGIC_VECTOR (1 downto 0) := "00";
    signal m_axis_V_1_state_cmp_full : STD_LOGIC;
    signal s_axis_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
    signal m_axis_V_TDATA_blk_n : STD_LOGIC;
    signal ap_CS_fsm_state4 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
    signal ap_CS_fsm_state5 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
    signal Va_fu_65_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal Va_reg_329 : STD_LOGIC_VECTOR (15 downto 0);
    signal Vb_fu_69_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal Vb_reg_334 : STD_LOGIC_VECTOR (15 downto 0);
    signal Vc_fu_79_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal Vc_reg_339 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_4_fu_95_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_4_reg_346 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_5_fu_103_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_5_reg_351 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_8_fu_115_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_8_reg_356 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_9_fu_123_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_9_reg_361 : STD_LOGIC_VECTOR (0 downto 0);
    signal Van_fu_170_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal Van_reg_366 : STD_LOGIC_VECTOR (16 downto 0);
    signal ap_CS_fsm_state3 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
    signal Vbn_fu_179_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal Vbn_reg_371 : STD_LOGIC_VECTOR (16 downto 0);
    signal Vcn_fu_188_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal Vcn_reg_376 : STD_LOGIC_VECTOR (16 downto 0);
    signal icmp_fu_204_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp_reg_381 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp3_fu_220_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp3_reg_386 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp6_fu_236_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal icmp6_reg_391 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_19_fu_324_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal tmp_3_fu_89_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_7_fu_109_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal Vc_1_fu_129_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal Vc_2_fu_138_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal Vmin_cast_fu_134_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal Vmax_cast_fu_143_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_s_fu_147_p2 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_fu_153_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_6_cast_fu_167_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal Voff_cast_fu_163_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_2_cast_fu_176_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_10_cast_fu_185_p1 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_1_fu_194_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_6_fu_210_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal tmp_11_fu_226_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal Van_1_fu_242_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal Vbn_1_fu_254_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal Vcn_1_fu_266_p3 : STD_LOGIC_VECTOR (16 downto 0);
    signal tmp_2_fu_248_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_13_fu_278_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_10_fu_260_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_14_fu_290_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_12_fu_272_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_16_fu_302_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_17_fu_306_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_15_fu_294_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_24_cast_fu_282_p3 : STD_LOGIC_VECTOR (15 downto 0);
    signal res_fu_314_p4 : STD_LOGIC_VECTOR (47 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);


begin




    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    m_axis_V_1_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_sel_rd <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_logic_1 = m_axis_V_1_vld_out))) then 
                                        m_axis_V_1_sel_rd <= not(m_axis_V_1_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    m_axis_V_1_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_sel_wr <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_in))) then 
                                        m_axis_V_1_sel_wr <= not(m_axis_V_1_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    m_axis_V_1_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                m_axis_V_1_state <= ap_const_lv2_0;
            else
                if ((((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_lv2_3 = m_axis_V_1_state)) or ((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_lv2_2 = m_axis_V_1_state)))) then 
                    m_axis_V_1_state <= ap_const_lv2_2;
                elsif ((((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_0 = m_axis_V_1_ack_out) and (ap_const_lv2_3 = m_axis_V_1_state)) or ((ap_const_logic_0 = m_axis_V_1_ack_out) and (ap_const_lv2_1 = m_axis_V_1_state)))) then 
                    m_axis_V_1_state <= ap_const_lv2_1;
                elsif ((((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_lv2_2 = m_axis_V_1_state)) or ((ap_const_logic_1 = m_axis_V_1_ack_out) and (ap_const_lv2_1 = m_axis_V_1_state)) or ((ap_const_lv2_3 = m_axis_V_1_state) and not(((ap_const_logic_1 = m_axis_V_1_vld_in) and (ap_const_logic_0 = m_axis_V_1_ack_out))) and not(((ap_const_logic_0 = m_axis_V_1_vld_in) and (ap_const_logic_1 = m_axis_V_1_ack_out)))))) then 
                    m_axis_V_1_state <= ap_const_lv2_3;
                else 
                    m_axis_V_1_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_sel_rd_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_sel_rd <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = s_axis_V_0_ack_out) and (ap_const_logic_1 = s_axis_V_0_vld_out))) then 
                                        s_axis_V_0_sel_rd <= not(s_axis_V_0_sel_rd);
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_sel_wr_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_sel_wr <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_in))) then 
                                        s_axis_V_0_sel_wr <= not(s_axis_V_0_sel_wr);
                end if; 
            end if;
        end if;
    end process;


    s_axis_V_0_state_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                s_axis_V_0_state <= ap_const_lv2_0;
            else
                if ((((ap_const_logic_0 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_3)) or ((ap_const_logic_0 = s_axis_V_0_vld_in) and (s_axis_V_0_state = ap_const_lv2_2)))) then 
                    s_axis_V_0_state <= ap_const_lv2_2;
                elsif ((((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_0 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_3)) or ((ap_const_logic_0 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_1)))) then 
                    s_axis_V_0_state <= ap_const_lv2_1;
                elsif ((((ap_const_logic_1 = s_axis_V_0_vld_in) and (s_axis_V_0_state = ap_const_lv2_2)) or ((ap_const_logic_1 = s_axis_V_0_ack_out) and (s_axis_V_0_state = ap_const_lv2_1)) or ((s_axis_V_0_state = ap_const_lv2_3) and not(((ap_const_logic_1 = s_axis_V_0_vld_in) and (ap_const_logic_0 = s_axis_V_0_ack_out))) and not(((ap_const_logic_0 = s_axis_V_0_vld_in) and (ap_const_logic_1 = s_axis_V_0_ack_out)))))) then 
                    s_axis_V_0_state <= ap_const_lv2_3;
                else 
                    s_axis_V_0_state <= ap_const_lv2_2;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then
                Va_reg_329 <= Va_fu_65_p1;
                Vb_reg_334 <= s_axis_V_0_data_out(31 downto 16);
                Vc_reg_339 <= s_axis_V_0_data_out(47 downto 32);
                tmp_4_reg_346 <= tmp_4_fu_95_p3;
                tmp_5_reg_351 <= tmp_5_fu_103_p2;
                tmp_8_reg_356 <= tmp_8_fu_115_p3;
                tmp_9_reg_361 <= tmp_9_fu_123_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
                Van_reg_366 <= Van_fu_170_p2;
                Vbn_reg_371 <= Vbn_fu_179_p2;
                Vcn_reg_376 <= Vcn_fu_188_p2;
                icmp3_reg_386 <= icmp3_fu_220_p2;
                icmp6_reg_391 <= icmp6_fu_236_p2;
                icmp_reg_381 <= icmp_fu_204_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = m_axis_V_1_load_A)) then
                m_axis_V_1_payload_A <= tmp_19_fu_324_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = m_axis_V_1_load_B)) then
                m_axis_V_1_payload_B <= tmp_19_fu_324_p1;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = s_axis_V_0_load_A)) then
                s_axis_V_0_payload_A <= s_axis_V_TDATA;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if ((ap_const_logic_1 = s_axis_V_0_load_B)) then
                s_axis_V_0_payload_B <= s_axis_V_TDATA;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, s_axis_V_0_vld_out, m_axis_V_1_ack_in, ap_CS_fsm_state2, ap_CS_fsm_state4, ap_CS_fsm_state5)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state2;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_state2 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state3;
                else
                    ap_NS_fsm <= ap_ST_fsm_state2;
                end if;
            when ap_ST_fsm_state3 => 
                ap_NS_fsm <= ap_ST_fsm_state4;
            when ap_ST_fsm_state4 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state4) and (m_axis_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state5;
                else
                    ap_NS_fsm <= ap_ST_fsm_state4;
                end if;
            when ap_ST_fsm_state5 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state5) and (m_axis_V_1_ack_in = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_state1;
                else
                    ap_NS_fsm <= ap_ST_fsm_state5;
                end if;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    Va_fu_65_p1 <= s_axis_V_0_data_out(16 - 1 downto 0);
    Van_1_fu_242_p3 <= 
        ap_const_lv17_7FFF when (icmp_reg_381(0) = '1') else 
        Van_reg_366;
    Van_fu_170_p2 <= std_logic_vector(signed(tmp_6_cast_fu_167_p1) - signed(Voff_cast_fu_163_p1));
    Vb_fu_69_p4 <= s_axis_V_0_data_out(31 downto 16);
    Vbn_1_fu_254_p3 <= 
        ap_const_lv17_7FFF when (icmp3_reg_386(0) = '1') else 
        Vbn_reg_371;
    Vbn_fu_179_p2 <= std_logic_vector(signed(tmp_2_cast_fu_176_p1) - signed(Voff_cast_fu_163_p1));
    Vc_1_fu_129_p3 <= 
        Vc_reg_339 when (tmp_5_reg_351(0) = '1') else 
        tmp_4_reg_346;
    Vc_2_fu_138_p3 <= 
        Vc_reg_339 when (tmp_9_reg_361(0) = '1') else 
        tmp_8_reg_356;
    Vc_fu_79_p4 <= s_axis_V_0_data_out(47 downto 32);
    Vcn_1_fu_266_p3 <= 
        ap_const_lv17_7FFF when (icmp6_reg_391(0) = '1') else 
        Vcn_reg_376;
    Vcn_fu_188_p2 <= std_logic_vector(signed(tmp_10_cast_fu_185_p1) - signed(Voff_cast_fu_163_p1));
        Vmax_cast_fu_143_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Vc_2_fu_138_p3),17));

        Vmin_cast_fu_134_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Vc_1_fu_129_p3),17));

        Voff_cast_fu_163_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(tmp_fu_153_p4),17));

    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state2 <= ap_CS_fsm(1);
    ap_CS_fsm_state3 <= ap_CS_fsm(2);
    ap_CS_fsm_state4 <= ap_CS_fsm(3);
    ap_CS_fsm_state5 <= ap_CS_fsm(4);

    ap_done_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state5) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    icmp3_fu_220_p2 <= "1" when (tmp_6_fu_210_p4 = ap_const_lv2_1) else "0";
    icmp6_fu_236_p2 <= "1" when (tmp_11_fu_226_p4 = ap_const_lv2_1) else "0";
    icmp_fu_204_p2 <= "1" when (tmp_1_fu_194_p4 = ap_const_lv2_1) else "0";
    m_axis_V_1_ack_in <= m_axis_V_1_state(1);
    m_axis_V_1_ack_out <= m_axis_V_TREADY;

    m_axis_V_1_data_out_assign_proc : process(m_axis_V_1_payload_A, m_axis_V_1_payload_B, m_axis_V_1_sel)
    begin
        if ((ap_const_logic_1 = m_axis_V_1_sel)) then 
            m_axis_V_1_data_out <= m_axis_V_1_payload_B;
        else 
            m_axis_V_1_data_out <= m_axis_V_1_payload_A;
        end if; 
    end process;

    m_axis_V_1_load_A <= (m_axis_V_1_state_cmp_full and not(m_axis_V_1_sel_wr));
    m_axis_V_1_load_B <= (m_axis_V_1_sel_wr and m_axis_V_1_state_cmp_full);
    m_axis_V_1_sel <= m_axis_V_1_sel_rd;
    m_axis_V_1_state_cmp_full <= '0' when (m_axis_V_1_state = ap_const_lv2_1) else '1';

    m_axis_V_1_vld_in_assign_proc : process(m_axis_V_1_ack_in, ap_CS_fsm_state4)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) and (m_axis_V_1_ack_in = ap_const_logic_1))) then 
            m_axis_V_1_vld_in <= ap_const_logic_1;
        else 
            m_axis_V_1_vld_in <= ap_const_logic_0;
        end if; 
    end process;

    m_axis_V_1_vld_out <= m_axis_V_1_state(0);
    m_axis_V_TDATA <= m_axis_V_1_data_out;

    m_axis_V_TDATA_blk_n_assign_proc : process(m_axis_V_1_state, ap_CS_fsm_state4, ap_CS_fsm_state5)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state4) or (ap_const_logic_1 = ap_CS_fsm_state5))) then 
            m_axis_V_TDATA_blk_n <= m_axis_V_1_state(1);
        else 
            m_axis_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    m_axis_V_TVALID <= m_axis_V_1_state(0);
    res_fu_314_p4 <= ((tmp_17_fu_306_p3 & tmp_15_fu_294_p3) & tmp_24_cast_fu_282_p3);
    s_axis_V_0_ack_in <= s_axis_V_0_state(1);

    s_axis_V_0_ack_out_assign_proc : process(s_axis_V_0_vld_out, ap_CS_fsm_state2)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state2) and (s_axis_V_0_vld_out = ap_const_logic_1))) then 
            s_axis_V_0_ack_out <= ap_const_logic_1;
        else 
            s_axis_V_0_ack_out <= ap_const_logic_0;
        end if; 
    end process;


    s_axis_V_0_data_out_assign_proc : process(s_axis_V_0_payload_A, s_axis_V_0_payload_B, s_axis_V_0_sel)
    begin
        if ((ap_const_logic_1 = s_axis_V_0_sel)) then 
            s_axis_V_0_data_out <= s_axis_V_0_payload_B;
        else 
            s_axis_V_0_data_out <= s_axis_V_0_payload_A;
        end if; 
    end process;

    s_axis_V_0_load_A <= (s_axis_V_0_state_cmp_full and not(s_axis_V_0_sel_wr));
    s_axis_V_0_load_B <= (s_axis_V_0_sel_wr and s_axis_V_0_state_cmp_full);
    s_axis_V_0_sel <= s_axis_V_0_sel_rd;
    s_axis_V_0_state_cmp_full <= '0' when (s_axis_V_0_state = ap_const_lv2_1) else '1';
    s_axis_V_0_vld_in <= s_axis_V_TVALID;
    s_axis_V_0_vld_out <= s_axis_V_0_state(0);

    s_axis_V_TDATA_blk_n_assign_proc : process(s_axis_V_0_state, ap_CS_fsm_state2)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state2)) then 
            s_axis_V_TDATA_blk_n <= s_axis_V_0_state(0);
        else 
            s_axis_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    s_axis_V_TREADY <= s_axis_V_0_state(1);
        tmp_10_cast_fu_185_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Vc_reg_339),17));

    tmp_10_fu_260_p2 <= "1" when (signed(Vbn_1_fu_254_p3) < signed(ap_const_lv17_18001)) else "0";
    tmp_11_fu_226_p4 <= Vcn_fu_188_p2(16 downto 15);
    tmp_12_fu_272_p2 <= "1" when (signed(Vcn_1_fu_266_p3) < signed(ap_const_lv17_18001)) else "0";
    tmp_13_fu_278_p1 <= Van_1_fu_242_p3(16 - 1 downto 0);
    tmp_14_fu_290_p1 <= Vbn_1_fu_254_p3(16 - 1 downto 0);
    tmp_15_fu_294_p3 <= 
        ap_const_lv16_8001 when (tmp_10_fu_260_p2(0) = '1') else 
        tmp_14_fu_290_p1;
    tmp_16_fu_302_p1 <= Vcn_1_fu_266_p3(16 - 1 downto 0);
    tmp_17_fu_306_p3 <= 
        ap_const_lv16_8001 when (tmp_12_fu_272_p2(0) = '1') else 
        tmp_16_fu_302_p1;
    tmp_19_fu_324_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(res_fu_314_p4),64));
    tmp_1_fu_194_p4 <= Van_fu_170_p2(16 downto 15);
    tmp_24_cast_fu_282_p3 <= 
        ap_const_lv16_8001 when (tmp_2_fu_248_p2(0) = '1') else 
        tmp_13_fu_278_p1;
        tmp_2_cast_fu_176_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Vb_reg_334),17));

    tmp_2_fu_248_p2 <= "1" when (signed(Van_1_fu_242_p3) < signed(ap_const_lv17_18001)) else "0";
    tmp_3_fu_89_p2 <= "1" when (signed(Va_fu_65_p1) < signed(Vb_fu_69_p4)) else "0";
    tmp_4_fu_95_p3 <= 
        Va_fu_65_p1 when (tmp_3_fu_89_p2(0) = '1') else 
        Vb_fu_69_p4;
    tmp_5_fu_103_p2 <= "1" when (signed(Vc_fu_79_p4) < signed(tmp_4_fu_95_p3)) else "0";
        tmp_6_cast_fu_167_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(Va_reg_329),17));

    tmp_6_fu_210_p4 <= Vbn_fu_179_p2(16 downto 15);
    tmp_7_fu_109_p2 <= "1" when (signed(Va_fu_65_p1) > signed(Vb_fu_69_p4)) else "0";
    tmp_8_fu_115_p3 <= 
        Va_fu_65_p1 when (tmp_7_fu_109_p2(0) = '1') else 
        Vb_fu_69_p4;
    tmp_9_fu_123_p2 <= "1" when (signed(Vc_fu_79_p4) > signed(tmp_8_fu_115_p3)) else "0";
    tmp_fu_153_p4 <= tmp_s_fu_147_p2(16 downto 1);
    tmp_s_fu_147_p2 <= std_logic_vector(signed(Vmin_cast_fu_134_p1) + signed(Vmax_cast_fu_143_p1));
end behav;
