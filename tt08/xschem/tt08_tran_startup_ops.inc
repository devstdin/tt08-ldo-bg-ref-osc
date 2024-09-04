* TRAN_STARTUP
**************
alter @v3[pwl] = [ 0 0 100us 1.8]
alter @v1[pwl] = [ 0 0 $t_supup 3.3]
alter @v5[pwl] = [ 0 0 ]
alter @v4[pwl] = [ 0 0 ]
option temp=$te

save DVDD, AVDD, VOUT, TEMPERATURE

tran 50n 500u

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot via#branch
		plot vid#branch
		plot DVDD
		plot AVDD
		plot VOUT
		plot OSC_EN
		plot OSC_RST
		plot OSC_OUT
	end
end

meas tran m_temp find v(TEMPERATURE) at=1u
meas tran m_ldo_out find VOUT at=499u

let max_i_a[run] = maximum(via#branch)
let max_i_d[run] = maximum(vid#branch)
let ldo_out_over[run] = maximum(VOUT)-m_ldo_out
let ldo_out_end[run] = m_ldo_out
let temp[run] = m_temp
let t_supup[run] = $t_supup

if MC_RUNS = 0
	write tran.raw all
	set appendwrite
end

