* TRAN_CURVE_TEMP
*****************
alter vsupp dc = $v_sweep

save all
dc temp -40 140 1

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vldo vdd x1.x1.vot
		*plot v.x1.vifbt#branch
		*plot x1.vr
		*plot x1.vfb
		*plot v.x1.visup#branch
	end
end

meas tran m_vldo_t20 find vldo at=20
let vldo_tc = deriv(vldo)
meas tran m_vldo_tc20 find vldo_tc at=20

let vldo_pp[run] = maximum(vldo)-minimum(vldo)
let vldo_mean[run] = mean(vldo)
let vldo_t20[run] = m_vldo_t20
let vldo_tc20[run] = m_vldo_tc20
let vsup[run] = $v_sweep
let isup[run] = maximum(vsupp#branch)

if MC_RUNS = 0
	write ldo_tran_temp.raw all
	set appendwrite
end

