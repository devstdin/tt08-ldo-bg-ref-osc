* TRAN_CURVE_TEMP
*****************
alter vsupp dc = $v_sweep

save all
dc temp -40 140 1

if MC_RUNS = 0
	plot vref
	*plot x1.vr
	*plot x1.vl
	*plot x1.vt
	plot v.x1.visup#branch
end

meas tran m_vref_t20 find vref at=20
let vref_tc = deriv(vref)
meas tran m_vref_tc20 find vref_tc at=20

let vref_pp[run] = maximum(vref)-minimum(vref)
let vref_mean[run] = mean(vref)
let vref_t20[run] = m_vref_t20
let vref_tc20[run] = m_vref_tc20
let vsup[run] = $v_sweep
let isup[run] = maximum(vsupp#branch)

if MC_RUNS = 0
	write dc.raw all
	set appendwrite
end

