read_liberty NangateOpenCellLibrary_typical.lib

read_verilog counter_nangate.v

link_design counter

read_sdc counter.sdc

check_setup

report_checks


