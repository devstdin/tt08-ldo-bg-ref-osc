* TRAN_CMINP
************
* Unity gain configuration negative slope
alter vsupp dc = 2.5
alter vsupp ac = 0
alter vsupn dc = 2.5
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rcm resistance = 0
alter rfb resistance = 100e12
alter @vinpdc[pwl] = [ 0 0 2u -2.5 ]

save all @m.x1.xmmirr.msky130_fd_pr__nfet_g5v0d10v5[vds] @m.x1.xmmirr.msky130_fd_pr__nfet_g5v0d10v5[vdsat] @m.x1.xmmirl.msky130_fd_pr__nfet_g5v0d10v5[vds] @m.x1.xmmirl.msky130_fd_pr__nfet_g5v0d10v5[vdsat] @m.x1.xmmir2.msky130_fd_pr__pfet_g5v0d10v5[vdsat] @m.x1.xmmir2.msky130_fd_pr__pfet_g5v0d10v5[vds] @m.x1.xmdl.msky130_fd_pr__pfet_g5v0d10v5[vdsat] @m.x1.xmdl.msky130_fd_pr__pfet_g5v0d10v5[vds] @m.x1.xmdr.msky130_fd_pr__pfet_g5v0d10v5[vdsat] @m.x1.xmdr.msky130_fd_pr__pfet_g5v0d10v5[vds]

tran 1n 2u

let mmir2_sat = @m.x1.xmmir2.msky130_fd_pr__pfet_g5v0d10v5[vds] - @m.x1.xmmir2.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
let mmirl_sat = @m.x1.xmmirl.msky130_fd_pr__nfet_g5v0d10v5[vds] - @m.x1.xmmirl.msky130_fd_pr__nfet_g5v0d10v5[vdsat]
let mmirr_sat = @m.x1.xmmirr.msky130_fd_pr__nfet_g5v0d10v5[vds] - @m.x1.xmmirr.msky130_fd_pr__nfet_g5v0d10v5[vdsat]
let mdr_sat = @m.x1.xmdr.msky130_fd_pr__pfet_g5v0d10v5[vds] - @m.x1.xmdr.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
let mdl_sat = @m.x1.xmdl.msky130_fd_pr__pfet_g5v0d10v5[vds] - @m.x1.xmdl.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
if MC_RUNS = 0
	plot mmir2_sat mdr_sat mdl_sat mmirl_sat mmirr_sat
	write tran_cminp.raw mmir2_sat mdr_sat mdl_sat mmirl_sat mmirr_sat
	set appendwrite
end

reset

* Unity gain configuration positive slope
alter vsupp dc = 2.5
alter vsupp ac = 0
alter vsupn dc = 2.5
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rcm resistance = 0
alter rfb resistance = 100e12
alter @vinpdc[pwl] = [ 0 0 2u 2.5 ]

save all @m.x1.xmmirr.msky130_fd_pr__nfet_g5v0d10v5[vds] @m.x1.xmmirr.msky130_fd_pr__nfet_g5v0d10v5[vdsat] @m.x1.xmmirl.msky130_fd_pr__nfet_g5v0d10v5[vds] @m.x1.xmmirl.msky130_fd_pr__nfet_g5v0d10v5[vdsat] @m.x1.xmmir2.msky130_fd_pr__pfet_g5v0d10v5[vdsat] @m.x1.xmmir2.msky130_fd_pr__pfet_g5v0d10v5[vds] @m.x1.xmdl.msky130_fd_pr__pfet_g5v0d10v5[vdsat] @m.x1.xmdl.msky130_fd_pr__pfet_g5v0d10v5[vds] @m.x1.xmdr.msky130_fd_pr__pfet_g5v0d10v5[vdsat] @m.x1.xmdr.msky130_fd_pr__pfet_g5v0d10v5[vds]	

tran 1n 2u

let mmir2_sat = @m.x1.xmmir2.msky130_fd_pr__pfet_g5v0d10v5[vds] - @m.x1.xmmir2.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
let mmirl_sat = @m.x1.xmmirl.msky130_fd_pr__nfet_g5v0d10v5[vds] - @m.x1.xmmirl.msky130_fd_pr__nfet_g5v0d10v5[vdsat]
let mmirr_sat = @m.x1.xmmirr.msky130_fd_pr__nfet_g5v0d10v5[vds] - @m.x1.xmmirr.msky130_fd_pr__nfet_g5v0d10v5[vdsat]
let mdr_sat = @m.x1.xmdr.msky130_fd_pr__pfet_g5v0d10v5[vds] - @m.x1.xmdr.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
let mdl_sat = @m.x1.xmdl.msky130_fd_pr__pfet_g5v0d10v5[vds] - @m.x1.xmdl.msky130_fd_pr__pfet_g5v0d10v5[vdsat]
if MC_RUNS = 0
	plot mmir2_sat mdr_sat mdl_sat mmirl_sat mmirr_sat
	write tran_cminp.raw mmir2_sat mdr_sat mdl_sat mmirl_sat mmirr_sat
end

meas tran m_pos_cm_bound find tran2.vinp when mmir2_sat=0 fall=1

let pos_cm_bound[run] = m_pos_cm_bound
let neg_cm_bound[run] = abs(9e999-9e999)

