

# Read technology library
read_liberty library/NangateOpenCellLibrary_typical.lib

# Read synthesized gate-level netlist
read_verilog synthesis/counter_nangate.v

# Link the design
link_design counter

# Read timing constraints
read_sdc sta/counter.sdc

# Check for missing constraints
check_setup

puts "\n========================================"
puts "          DESIGN SUMMARY"
puts "========================================"


puts "\n========================================"
puts "         SETUP ANALYSIS"
puts "========================================"
report_checks -path_delay max -fields {slew cap input_pin net fanout} -digits 3

puts "\n========================================"
puts "          HOLD ANALYSIS"
puts "========================================"
report_checks -path_delay min -fields {slew cap input_pin net fanout} -digits 3

puts "\n========================================"
puts "       TIMING CHECK SUMMARY"
puts "========================================"

# Try these commands if supported by your OpenSTA version
catch {report_wns}
catch {report_tns}
catch {report_worst_slack}
catch {report_clock_properties}
puts "========================================"
catch {report_checks -summary}
