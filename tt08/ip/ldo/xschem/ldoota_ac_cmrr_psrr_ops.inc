* AC_CMRR_PSRR
**************
* Common mode gain
alter vsupp dc = 3
alter vsupp ac = 0
alter vsupn dc = 3
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 1
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rinn ac = 100e12
alter rcm resistance = 100e12
alter rcm ac = 0.01
alter rfb resistance = 0
alter rfb ac = 100e12

save all
ac DEC 10 1 10G

let vec_ac = v(opout)
if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vec_ac
	end
end

reset

* Differential gain (Open-Loop gain)
alter vsupp dc = 3
alter vsupp ac = 0
alter vsupn dc = 3
alter vsupn ac = 0
alter vinnac ac = 1
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rinn ac = 0.01
alter rcm resistance = 100e12
alter rcm ac = 100e12
alter rfb resistance = 0
alter rfb ac = 100e12

save all
ac DEC 10 1 10G

let vec_ad = v(opout)
if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vec_ad
	end
end

reset

* VDD gain
alter vsupp dc = 3
alter vsupp ac = 1
alter vsupn dc = 3
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rinn ac = 0.01
alter rcm resistance = 100e12
alter rcm ac = 100e12
alter rfb resistance = 0
alter rfb ac = 100e12

save all
ac DEC 10 1 10G

let vec_avdd = v(opout)
if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vec_avdd
	end
end

reset

* VSS gain
alter vsupp dc = 3
alter vsupp ac = 0
alter vsupn dc = 3
alter vsupn ac = 1
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rinn ac = 0.01
alter rcm resistance = 100e12
alter rcm ac = 100e12
alter rfb resistance = 0
alter rfb ac = 100e12

save all
ac DEC 10 1 10G

let vec_avss = v(opout)
if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vec_avss
	end
end

* CMRR
let cmrr = db(ac2.vec_ad/ac1.vec_ac)
meas ac m_cmrr_10Hz find cmrr at=10
meas ac m_cmrr_10MHz find cmrr at=10e6

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot cmrr
	end
end

* PSRR
let psrr_p = db(ac2.vec_ad/ac3.vec_avdd)
meas ac m_psrr_p_10Hz find psrr_p at=10
meas ac m_psrr_p_10MHz find psrr_p at=10e6

let psrr_n = db(ac2.vec_ad/ac4.vec_avss)
meas ac m_psrr_n_10Hz find psrr_n at=10
meas ac m_psrr_n_10MHz find psrr_n at=10e6

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot psrr_p psrr_n
	end
	write ldoota_ac_cmrr_psrr.raw psrr_p psrr_n cmrr
end

let cmrr_10Hz[run] = m_cmrr_10Hz
let cmrr_10MHz[run] = m_cmrr_10MHz
let psrr_p_10Hz[run] = m_psrr_p_10Hz
let psrr_p_10MHz[run] = m_psrr_p_10MHz
let psrr_n_10Hz[run] = m_psrr_n_10Hz
let psrr_n_10MHz[run] = m_psrr_n_10MHz

