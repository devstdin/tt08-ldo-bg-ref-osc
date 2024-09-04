v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 40 -360 40 -350 { lab=vb}
N 40 -350 80 -350 { lab=vb}
N 140 -350 230 -350 { lab=#net1}
C {devices/title.sym} 160 -30 0 0 {name=l1 author=""}
C {devices/lab_pin.sym} 230 -410 0 0 {name=p1 lab=VDD}
C {devices/lab_pin.sym} 230 -330 0 0 {name=p2 lab=VSS}
C {devices/lab_pin.sym} 370 -370 0 1 {name=p3 lab=OSC}
C {devices/vsource.sym} 280 -190 0 0 {name=V1 value=1.8}
C {devices/lab_pin.sym} 280 -160 0 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 280 -220 0 0 {name=p6 lab=VDD}
C {devices/vsource.sym} 395 -200 1 0 {name=V2 value=0
}
C {devices/lab_pin.sym} 365 -200 0 0 {name=p9 lab=0
}
C {devices/lab_pin.sym} 425 -200 0 1 {name=p10 lab=VSS}
C {devices/code.sym} 30 -580 0 0 {name=LIB_CORNER
only_toplevel=true
format="tcleval( @value )"
value="
.csparam TB_ID=\\\\$::TB_ID\\\\
.csparam MC_RUNS=\\\\$::MC_RUNS\\\\
.csparam EXIT_NGSPICE=\\\\$::EXIT_NGSPICE\\\\
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice \\\\$::CORNER\\\\
"}
C {devices/lab_pin.sym} 160 -160 0 0 {name=p12 lab=VSS}
C {devices/lab_pin.sym} 160 -220 0 0 {name=p13 lab=TEMPERATURE}
C {devices/vsource_arith.sym} 160 -190 0 0 {name=E1 VOL=temper}
C {devices/code.sym} 180 -580 0 0 {name=NGSPICE
only_toplevel=true
*format="tcleval( @value )"
value="* this experimental option enables mos model bin 
* selection based on W/NF instead of W
.option wnflag=0
.option warn=0

.control
* option savecurrents
save all


* dummy block for goto
if (1)
if TB_ID = 0
	goto TRAN
end
if TB_ID = 1
	goto TRAN
end
if TB_ID = 2
	goto TRAN_PEX
end

****************************************
label TRAN
*save all
label TRAN_PEX
*save all
****************************************
if MC_RUNS = 0
	let veclen=9
	let en_dt = vector(veclen)
	let vs = vector(veclen)
	let temp = vector(veclen)
	let first_high = vector(veclen)
	let first_period = vector(veclen)
	let first_dutycycle_percent = vector(veclen)
	let last_high = vector(veclen)
	let run = 0
	foreach te -40 20 140
	*foreach te 140
	*foreach en_delay 0 0.1us 0.2us
	*foreach en_delay 0
		foreach vsup 1.5 1.8 1.9
		*foreach vsup 1.8
			*alterparam en_d = $en_delay
			*reset
			alter v1=$vsup
			option temp=$te
			*save OSC, EN, VDD, x1.ENA_D1, x1.RESETB, TEMPERATURE
			save OSC, EN, VDD, TEMPERATURE

			tran 200p 10u
			meas tran m_high_v find v(VDD) at=1u
			meas tran m_temp find v(TEMPERATURE) at=1u
			let vddz = \{m_high_v/2\}
			meas tran m_first_high trig v(OSC) val=vddz td=5u rise=1 targ v(OSC) val=vddz td=5u fall=1
			meas tran m_first_per trig v(OSC) val=vddz td=5u rise=1 targ v(OSC) val=vddz td=5u rise=2
			meas tran m_en_t when v(x1.ENA_D1)=vddz fall=1
			meas tran m_last_rising_t when v(OSC)=vddz td=m_en_t rise=1
			meas tran m_last_falling_t when v(OSC)=vddz td=m_last_rising_t fall=1
			*meas tran m_last_high trig v(OSC) val=vddz td=m_en_t rise=1 targ v(OSC) val=vddz td=m_en_t fall=1
			let m_last_high = m_last_falling_t-m_last_rising_t

			*plot Temperature
			*plot Vib#branch
			plot OSC
			*plot OSC EN x1.ENA_D1 x1.RESETB
			*plot EN
			*plot x1.ENA_D1
			*plot x1.RESETB
			let en_dt[run] = 0
			let vs[run] = m_high_v
			let temp[run] = m_temp
			let first_high[run] = m_first_high
			let first_period[run] = m_first_per
			let first_dutycycle_percent[run] = \{100/m_first_per*m_first_high\}
			let last_high[run] = $&m_last_high
			let run = run + 1
			write tran.raw all
			set appendwrite
		end
	end
	set nobreak
	set width=300
	print en_dt, temp, vs, first_high, first_period, first_dutycycle_percent, last_high > tran.csv
else
	define aunif(nom, avar) (nom+avar*sunif(0))
	define agauss(nom, avar, sig) (nom + avar / sig * sgauss (0))
	let en_dt = vector(MC_RUNS)
	let vs = vector(MC_RUNS)
	let temp = vector(MC_RUNS)
	let first_high = vector(MC_RUNS)
	let first_period = vector(MC_RUNS)
	let first_dutycycle_percent = vector(MC_RUNS)
	let last_high = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"
		let ti = aunif(0, 200e-9)
		alterparam en_d = $&ti
		reset
		let vsup = aunif(1.7, 0.2)
		alter v1=$&vsup
		let te = aunif(50, 90)
		option temp=$&te
		save OSC, EN, VDD, x1.ENA_D1

		tran 200p 10u
		meas tran m_high_v find v(VDD) at=1u
		let vddz = \{m_high_v/2\}
		meas tran m_first_high trig v(OSC) val=vddz td=5u rise=1 targ v(OSC) val=vddz td=5u fall=1
		meas tran m_first_per trig v(OSC) val=vddz td=5u rise=1 targ v(OSC) val=vddz td=5u rise=2
		meas tran m_en_t when v(x1.ENA_D1)=vddz fall=1
		meas tran m_last_rising_t when v(OSC)=vddz td=m_en_t rise=1
		meas tran m_last_falling_t when v(OSC)=vddz td=m_last_rising_t fall=1
		*meas tran m_last_high trig v(OSC) val=vddz td=m_en_t rise=1 targ v(OSC) val=vddz td=m_en_t fall=1
		let m_last_high = m_last_falling_t-m_last_rising_t

		let en_dt[run] = $&ti
		let vs[run] = $&vsup
		let temp[run] = $&te
		let first_high[run] = m_first_high
		let first_period[run] = m_first_per
		let first_dutycycle_percent[run] = \{100/m_first_per*m_first_high\}
		let last_high[run] = $&m_last_high
		let run = run + 1
	end
	set nobreak
	set width=300
	print en_dt, temp, vs, first_high, first_period, first_dutycycle_percent, last_high > tran.csv
end
goto done

****************************************
label done
****************************************
if EXIT_NGSPICE > 0.0
	exit
end
end
.endc
" }
C {devices/isource.sym} 40 -390 0 0 {name=I0 value=10e-6}
C {devices/lab_pin.sym} 40 -420 0 0 {name=p7 lab=VDD}
C {devices/ammeter.sym} 110 -350 3 1 {name=Vib}
C {devices/lab_pin.sym} 40 -350 0 0 {name=p8 lab=vb}
C {riosc.sym} 300 -370 0 0 {name=X1}
C {devices/lab_pin.sym} 230 -390 0 0 {name=p4 lab=EN}
C {devices/vsource.sym} 590 -310 0 0 {name=V3 value="PWL(0 1.8 '4us+en_d' 1.8 '4.01us+en_d' 0 '7us+en_d' 0 '7.01us+en_d' 1.8)"}
C {devices/lab_pin.sym} 590 -280 0 0 {name=p11 lab=VSS}
C {devices/lab_pin.sym} 590 -340 0 0 {name=p14 lab=EN}
C {devices/vsource.sym} 590 -400 0 0 {name=V4 value="PWL(0 1.8 1us 1.8 1.01us 0)"}
C {devices/lab_pin.sym} 590 -370 0 0 {name=p15 lab=VSS}
C {devices/lab_pin.sym} 590 -430 0 0 {name=p16 lab=RESET}
C {devices/lab_pin.sym} 370 -410 0 1 {name=p17 lab=RESET}
C {devices/param.sym} 630 -340 0 0 {name=s1 value="en_d=0u"}
