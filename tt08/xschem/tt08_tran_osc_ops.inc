* TRAN_OSC
**********
alter @v3[pwl] = [ 0 1.8]
alter @v1[pwl] = [ 0 3.3]
alter @v5[pwl] = [ 0 1.8 5us 1.8 5.1us 0 ]
alter @v4[pwl] = [ 0 0 5.2us 0 5.3us 1.8]
option temp=$te

save DVDD, OSC_OUT, OSC_EN, OSC_RST, TEMPERATURE

tran 200p 6u

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot OSC_OUT
	end
end

meas tran m_high_v find v(DVDD) at=1u
meas tran m_temp find v(TEMPERATURE) at=1u
let vddz = \{m_high_v/2\}
meas tran m_first_high trig v(OSC_OUT) val=vddz td=5u rise=1 targ v(OSC_OUT) val=vddz td=5u fall=1
meas tran m_first_per trig v(OSC_OUT) val=vddz td=5u rise=1 targ v(OSC_OUT) val=vddz td=5u rise=2

let temp[run] = m_temp
let first_high[run] = m_first_high
let first_period[run] = m_first_per
let first_dutycycle_percent[run] = \{100/m_first_per*m_first_high\}

if MC_RUNS = 0
	write tran.raw all
	set appendwrite
end

