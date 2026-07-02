read_liberty library/NangateOpenCellLibrary_typical.lib

read_verilog synthesis/counter_nangate.v

link_design counter

read_sdc sta/counter.sdc

check_setup

report_checks


