* TRAN_SLEW
***********
* Unity gain configuration 10pf output load
alter vsupp dc = 2.5
alter vsupp ac = 0
alter vsupn dc = 2.5
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rcm resistance = 100e12
alter rfb resistance = 0
alter cout 10e-15
alter @vinpdc[pwl] = [ 0 0 1n 0.1 1u 0.1 1.001u 0 ]

save all 

tran 1n 2u

let opout_10f = opout
let vinp_10f = vinp

if MC_RUNS = 0
	plot opout vinp
	write tran_slew.raw opout_10f vinp_10f
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
alter rcm resistance = 100e12
alter rfb resistance = 0
alter cout 500e-15
alter @vinpdc[pwl] = [ 0 0 1n 1.5 1u 1.5 1.001u 0 ]

save all

tran 1n 2u

plot opout vinp

let slew = deriv(tran2.opout)
let opout_500f = opout
let vinp_500f = vinp


if MC_RUNS = 0
	plot slew
	write tran_slew.raw slew opout_500f vinp_500f
end

meas tran m_inp_offset find tran1.opout at=1.5u
meas tran m_slew_pos find slew when tran2.opout=0.75 rise=1
meas tran m_slew_neg find slew when tran2.opout=0.75 fall=1

let inp_offset[run] = m_inp_offset
let slew_pos[run] = m_slew_pos
let slew_neg[run] = m_slew_neg
