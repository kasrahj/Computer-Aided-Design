	alias clc ".main clear"
	
	clc
	exec vlib work
	vmap work work
	
	set TB					"TB"
	set hdl_path			"../src/hdl"
	set inc_path			"../src/inc"
	
	set run_time			"1 us"
#	set run_time			"-all"

#============================ Add verilog files  ===============================
# Pleas add other module here	
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/ActivationFunction.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Adder11.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Adder12.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/basic_components.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/cells.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/controller.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/datapath.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/maxnet_cellular.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Multiplier.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/MUX2.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/other_components.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/PU.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Reg5.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Reg10.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/Reg12.v
	vlog 	+acc -incr -source  +define+SIM 	$hdl_path/s_cal.v
	
		
	vlog 	+acc -incr -source  +incdir+$inc_path +define+SIM 	./tb/$TB.v
	onerror {break}

#================================ simulation ====================================

	vsim	-voptargs=+acc -debugDB $TB


#======================= adding signals to wave window ==========================


	add wave -hex -group 	 	{TB}				sim:/$TB/*
	add wave -hex -group 	 	{top}				sim:/$TB/uut/*	
	add wave -hex -group -r		{all}				sim:/$TB/*

#=========================== Configure wave signals =============================
	
	configure wave -signalnamewidth 2
    

#====================================== run =====================================

	run $run_time 
	