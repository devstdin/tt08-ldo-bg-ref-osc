* AC_OL_OPS
***********
alter vsupp dc = 2.5
alter vsupp ac = 0
alter vsupn dc = 2.5
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

* find phasemargin and ug-bw
let vec_phase = 180/PI*cph(v(opout))
let vec_ampdb = db(v(opout))
meas ac m_dcphase find vec_phase at=1
meas ac m_ugphase find vec_phase when vec_ampdb=0 FALL=1
let m_pm =  180-abs(m_dcphase-m_ugphase)
meas ac m_ugbw when vec_ampdb=0 FALL=1

* find openloop gain at 1 Hz
meas ac m_olgain_1hz find vec_ampdb at=1

* find 3db bandwidth
meas ac m_peak_mag max vec_ampdb
let f3db = m_peak_mag-3
meas ac m_f1_3db when vec_ampdb=f3db RISE=1
meas ac m_f2_3db WHEN vec_ampdb=f3db FALL=1

let olgain_1hz[run] = m_olgain_1hz
let pm[run] = m_pm
let ugbw[run] = m_ugbw
let f1_3db[run] = m_f1_3db
let f2_3db[run] = m_f2_3db

if MC_RUNS = 0
	plot vec_ampdb
	plot vec_phase
	print m_pm
	
	write ac_ol.raw all
	set appendwrite
end

