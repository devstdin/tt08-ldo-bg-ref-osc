* AC_PSRR
*********
* VDD gain
alter vsupp dc = 5
alter vsupp ac = 1

save all
ac DEC 10 1 10G

let vec_vldo = v(vldo)
if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vec_vldo
	end
end

* PSRR
let psrr_p = db(vec_vldo)
meas ac m_psrr_p_10Hz find psrr_p at=10
meas ac m_psrr_p_10MHz find psrr_p at=10e6

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot psrr_p
	end
	write ldo_ac_psrr.raw psrr_p
end

let psrr_p_10Hz[run] = m_psrr_p_10Hz
let psrr_p_10MHz[run] = m_psrr_p_10MHz

