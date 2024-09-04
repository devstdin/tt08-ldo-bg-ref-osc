* TRAN_CURVE_VDD
****************
option temp=$t_sweep

save all
dc vsupp 3 5 0.1

if MC_RUNS = 0
	plot vref
	*plot x1.vr
	*plot x1.vl
	*plot x1.vt
	*plot v.x1.visup#branch
end

meas tran m_vref_3v3 find vref at=3.3
let vref_tc = deriv(vref)
meas tran m_vref_tc3v3 find vref_tc at=3.3

let vref_pp[run] = maximum(vref)-minimum(vref)
let vref_mean[run] = mean(vref)
let vref_3v3[run] = m_vref_3v3
let vref_tc3v3[run] = m_vref_tc3v3
let te[run] = $t_sweep
let isup[run] = maximum(vsupp#branch)

if MC_RUNS = 0
	write dc.raw all
	set appendwrite
end

