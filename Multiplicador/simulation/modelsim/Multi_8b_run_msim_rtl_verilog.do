transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/melot/Desktop/Materias/2025_1_SD2/ULA_Multiplicador_Divisor/Multiplicador {C:/Users/melot/Desktop/Materias/2025_1_SD2/ULA_Multiplicador_Divisor/Multiplicador/Multi_8b.v}

vlog -vlog01compat -work work +incdir+C:/Users/melot/Desktop/Materias/2025_1_SD2/ULA_Multiplicador_Divisor/Multiplicador {C:/Users/melot/Desktop/Materias/2025_1_SD2/ULA_Multiplicador_Divisor/Multiplicador/tb_Multi_8b.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_Multi_8b

add wave *
view structure
view signals
run -all
