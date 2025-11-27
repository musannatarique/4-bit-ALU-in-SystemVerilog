create_clock -name SYS_CLOCK -period 10 -waveform {0 5} [get_ports "SYS_CLOCK"]
set_input_delay -max 0.0 [get_ports *] -clock SYS_CLOCK
remove_input_delay [get ports SYS_CLOCK SRST]
set_output_delay -max 0.0 [get_ports *] -clock SYS_CLOCK
