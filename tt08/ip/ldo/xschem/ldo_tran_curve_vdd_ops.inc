* TRAN_CURVE_VDD
****************
option temp=$t_sweep

save all
dc vsupp 2 5 0.1

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vldo
		*plot x1.vr
		*plot x1.vl
		*plot x1.vt
		*plot v.x1.visup#branch
	end
end

meas tran m_vldo_3v3 find vldo at=3.3
let vldo_tc = deriv(vldo)
meas tran m_vldo_tc3v3 find vldo_tc at=3.3

let vldo_pp[run] = maximum(vldo)-minimum(vldo)
let vldo_mean[run] = mean(vldo)
let vldo_3v3[run] = m_vldo_3v3
let vldo_tc3v3[run] = m_vldo_tc3v3
let te[run] = $t_sweep
let isup[run] = maximum(vsupp#branch)

if MC_RUNS = 0
	write ldo_tran_vdd.raw all
	set appendwrite
end

