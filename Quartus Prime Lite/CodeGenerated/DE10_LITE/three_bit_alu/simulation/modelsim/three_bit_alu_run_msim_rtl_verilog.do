transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/led.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/three_bit_alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/half_adder_core.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/full_adder_core.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/dff_sync.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/bitwise_or.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/bitwise_and.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/3bit_multiplier.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/3bit_full_adder_core.v}
vlog -vlog01compat -work work +incdir+C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu {C:/Users/Student/Desktop/CodeGenerated/DE10_LITE/three_bit_alu/3bit_alu.v}

