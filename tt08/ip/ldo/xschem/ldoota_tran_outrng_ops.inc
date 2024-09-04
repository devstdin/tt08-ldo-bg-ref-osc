* TRAN_OUTRNG
*************
* x(-10) gain configuration negative input slope
alter vsupp dc = 3
alter vsupp ac = 0
alter vsupn dc = 3
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 10
alter rcm resistance = 100e12
alter rfb resistance = 100
alter @vinndc[pwl] = [ 0 0 10u -3 ]

save all @m.x1.xmmir3.msky130_fd_pr__nfet_g5v0d10v5[vds] @m.x1.xmmir3.msky130_fd_pr__nfet_g5v0d10v5[vdsat] @m.x1.xmo.msky130_fd_pr__pfet_g5v0d10v5[vds] @m.x1.xmo.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
tran 1n 10u

reset

* x(-10) gain configuration positive input slope
alter vsupp dc = 3
alter vsupp ac = 0
alter vsupn dc = 3
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 10
alter rcm resistance = 100e12
alter rfb resistance = 100
alter @vinndc[pwl] = [ 0 0 10u 3 ]

save all @m.x1.xmmir3.msky130_fd_pr__nfet_g5v0d10v5[vds] @m.x1.xmmir3.msky130_fd_pr__nfet_g5v0d10v5[vdsat] @m.x1.xmo.msky130_fd_pr__pfet_g5v0d10v5[vds] @m.x1.xmo.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
tran 1n 10u

let mir3_sat = tran1.@m.x1.xmmir3.msky130_fd_pr__nfet_g5v0d10v5[vds] - tran1.@m.x1.xmmir3.msky130_fd_pr__nfet_g5v0d10v5[vdsat]
if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot mir3_sat tran1.opout tran1.vinn
	end
end

let mo_sat = tran2.@m.x1.xmo.msky130_fd_pr__pfet_g5v0d10v5[vds] - tran2.@m.x1.xmo.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot mo_sat tran2.opout tran2.vinn
	end
end

meas tran m_neg_out_comp find tran2.opout when mo_sat=0 fall=1
meas tran m_pos_out_comp find tran1.opout when mir3_sat=0 fall=1

let neg_out_comp[run] = m_neg_out_comp
let pos_out_comp[run] = m_pos_out_comp
