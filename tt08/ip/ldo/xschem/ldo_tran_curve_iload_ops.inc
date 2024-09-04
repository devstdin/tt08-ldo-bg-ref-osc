* TRAN_CURVE_ILOAD
******************
option temp=$t_sweep

save all
dc il 0 500e-6 10e-6

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vldo
		*plot x1.vr
		*plot x1.vl
		*plot x1.vt
		*plot v.x1.visup#branch
	end
end

meas tran m_vldo_100u find vldo at=100e-6
let vldo_tc = deriv(vldo)
meas tran m_vldo_tc100u find vldo_tc at=100e-6

let vldo_pp[run] = maximum(vldo)-minimum(vldo)
let vldo_mean[run] = mean(vldo)
let vldo_100u[run] = m_vldo_100u
let vldo_tc100u[run] = m_vldo_tc100u
let te[run] = $t_sweep
let isup[run] = maximum(vsupp#branch)

if MC_RUNS = 0
	write ldo_tran_iload.raw all
	set appendwrite
end

