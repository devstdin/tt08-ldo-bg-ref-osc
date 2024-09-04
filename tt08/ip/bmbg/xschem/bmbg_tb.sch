v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 470 -260 470 -240 {
lab=VSS}
N 450 -240 470 -240 {
lab=VSS}
N 380 -350 470 -350 {
lab=VREF}
N 570 -260 570 -240 {
lab=VSS}
N 550 -240 570 -240 {
lab=VSS}
N 470 -350 470 -320 {
lab=VREF}
N 380 -370 570 -370 {
lab=#net1}
N 570 -370 570 -320 {
lab=#net1}
N 310 -120 310 -100 {
lab=VSS}
N 310 -100 340 -100 {
lab=VSS}
N 160 -370 180 -370 {
lab=VDD}
N 240 -370 260 -370 {
lab=#net2}
C {devices/title.sym} 160 -30 0 0 {name=l1 author=""}
C {devices/vsource.sym} 310 -150 0 0 {name=VSUPP value="DC 5 AC 0"}
C {devices/lab_pin.sym} 310 -100 0 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 310 -180 0 0 {name=p6 lab=VDD}
C {devices/vsource.sym} 365 -100 1 0 {name=V2 value=0
}
C {devices/lab_pin.sym} 395 -100 0 1 {name=p9 lab=0
}
C {devices/code.sym} 790 -200 0 0 {name=LIB_CORNER
only_toplevel=true
format="tcleval( @value )"
value="
.csparam TB_ID=\\\\$::TB_ID\\\\
.csparam MC_RUNS=\\\\$::MC_RUNS\\\\
.csparam EXIT_NGSPICE=\\\\$::EXIT_NGSPICE\\\\
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice \\\\$::CORNER\\\\
"}
C {devices/lab_pin.sym} 160 -120 0 0 {name=p12 lab=VSS}
C {devices/lab_pin.sym} 160 -180 0 0 {name=p13 lab=TEMPERATURE}
C {devices/vsource_arith.sym} 160 -150 0 0 {name=E1 VOL=temper}
C {devices/code.sym} 940 -200 0 0 {name=NGSPICE
only_toplevel=true
*format="tcleval( @value )"
value="* this experimental option enables mos model bin 
* selection based on W/NF instead of W
.option wnflag=0

.control
option savecurrents
save all

* dummy block for goto
if (1)
if TB_ID = 0
	goto TRAN_STARTUP
end
if TB_ID = 1
	goto TRAN_CURVE_TEMP
end
if TB_ID = 2
	goto VREF_NOISE
end
if TB_ID = 3
	goto AC_PSRR
end
if TB_ID = 4
	goto TRAN_CURVE_VDD
end
if TB_ID = 5
	goto TRAN_STARTUP
end

****************************************
label TRAN_CURVE_TEMP
save all
****************************************
if MC_RUNS = 0
	let veclen=3
	let vref_pp = vector(veclen)
	let vref_t20 = vector(veclen)
	let vref_tc20 = vector(veclen)
	let vref_mean = vector(veclen)
	let vsup = vector(veclen)
	let isup = vector(veclen)
	let run = 0

	foreach v_sweep 3 4 5
	*foreach v_sweep 3.3

		.include tran_curve_temp_ops.inc

		let run = run + 1		
	end

	set nobreak
	set width=300
	print isup, vsup, vref_pp, vref_mean, vref_t20, vref_tc20 > dc.csv

else
	let vref_pp = vector(MC_RUNS)
	let vref_t20 = vector(MC_RUNS)
	let vref_tc20 = vector(MC_RUNS)
	let vref_mean = vector(MC_RUNS)
	let vsup = vector(MC_RUNS)
	let isup = vector(MC_RUNS)
	let run = 0
	set v_sweep = 5

	dowhile run < MC_RUNS
		echo MC-RUN: $&run

		.include tran_curve_temp_ops.inc

 		reset
		let run = run + 1
	end

	set nobreak
	set width=300
	print isup, vsup, vref_pp, vref_mean, vref_t20, vref_tc20 > dc.csv
end
goto done

****************************************
label TRAN_CURVE_VDD
save all
****************************************
if MC_RUNS = 0
	let veclen=3
	let vref_pp = vector(veclen)
	let vref_3v3 = vector(veclen)
	let vref_tc3v3 = vector(veclen)
	let vref_mean = vector(veclen)
	let te = vector(veclen)
	let isup = vector(veclen)
	let run = 0

	foreach t_sweep -40 20 140
	*foreach t_sweep 20

		.include tran_curve_vdd_ops.inc

		let run = run + 1		
	end

	set nobreak
	set width=300
	print isup, te, vref_pp, vref_mean, vref_3v3, vref_tc3v3 > dc.csv

else
	let vref_pp = vector(MC_RUNS)
	let vref_3v3 = vector(MC_RUNS)
	let vref_tc3v3 = vector(MC_RUNS)
	let vref_mean = vector(MC_RUNS)
	let te = vector(MC_RUNS)
	let isup = vector(MC_RUNS)
	let run = 0
	set t_sweep = 20

	dowhile run < MC_RUNS
		echo MC-RUN: $&run

		.include tran_curve_vdd_ops.inc

 		reset
		let run = run + 1
	end

	set nobreak
	set width=300
	print isup, te, vref_pp, vref_mean, vref_3v3, vref_tc3v3 > dc.csv
end
goto done

****************************************
label VREF_NOISE
****************************************
noise v(vref) VSUPP dec 10 1 100e3 1
setplot noise2
print onoise_total
setplot noise1
plot onoise_spectrum
write noise1_isource.raw all

* https://sourceforge.net/p/ngspice/discussion/120973/thread/2aa3e30f/ -- Holger Vogt
* script to read a specific y-value if x given
**********************************************
let f0 = vector(1)
let f1 = vector(1)
let n_f0 = vector(1)
let n_f1 = vector(1)
compose freq_list values 10 10e3
foreach freq_idx 0 1
	let freq = freq_list[$freq_idx]
	* find index where freqency is just above interesting value
	setplot noise1
	let nn = 0
	while frequency[nn] < freq
		let nn = nn + 1
	end
	* define vectors of frequncies and values just above and below
	* selected frequeny
	let fnn = frequency[nn]
	let nn1 = nn - 1
	let fnn1 = frequency[nn1]
	let snn = onoise_spectrum[nn]
	let snn1 = onoise_spectrum[nn1]
	*print vector values
	echo nn = "$&nn"  fnn = "$&fnn"  snn = "$&snn"
	echo nn1 = "$&nn1"  fnn1 = "$&fnn1"  snn1 = "$&snn1"
	*linear interpolation for exact frequency
	let newsnn = snn1 + (snn - snn1)/(fnn - fnn1)*(freq - fnn1)
	echo newfnn = "$&freq"  newsnn = "$&newsnn"
	if $freq_idx = 0
		let f0 = freq
		let n_f0 = newsnn
	end
	if $freq_idx = 1
		let f1 = freq
		let n_f1 = newsnn
	end
end
set nobreak
set width=300
set noprintscale
print col f0, n_f0, f1, n_f1 > ac_inoise.csv

goto done

****************************************
label AC_PSRR
save all
****************************************
if MC_RUNS = 0
	let psrr_p_10Hz = vector(MC_RUNS+1)
	let psrr_p_10MHz = vector(MC_RUNS+1)
	let run=0

	.include ac_psrr_ops.inc

	set nobreak
	set width=300
	print col psrr_p_10Hz, psrr_p_10MHz > ac_psrr.csv
else
	let psrr_p_10Hz = vector(MC_RUNS)
	let psrr_p_10MHz = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		.include ac_psrr_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print psrr_p_10Hz, psrr_p_10MHz > ac_psrr.csv
end
goto done

****************************************
label TRAN_STARTUP
****************************************
if MC_RUNS = 0
	let veclen=4
	let startup_t = vector(veclen)
	let run=0
	foreach v_sweep 3 4 5 6
	*foreach v_sweep 3.3
		save all
		alter @VSUPP[pwl] = [ 0 0 100u $v_sweep]
		*alter @IBIAS0[pwl] = [ 0 0 100us 0 150us 10e-6 ]
  		tran 10n 200u
  		plot vivdd#branch
		plot VDD
		plot VREF
		meas tran m_vref_up when VREF=0.5 rise=1
		let startup_t[run] = m_vref_up
		write tran.raw all
		let run = run + 1
		set appendwrite
		reset
	end
	print startup_t > tran.csv
else
	let startup_t = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"
		alter @v1[pwl] = [ 0 0 1u 0 10u 3]
		tran 100n 20m
		meas tran m_cur_up when i(visource)=5e-6 rise=1
		let startup_t[run] = m_cur_up
 		reset
		let run = run + 1
	end
	print startup_t > tran.csv
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
C {devices/lab_pin.sym} 450 -240 0 0 {name=p3 lab=VSS}
C {devices/lab_pin.sym} 470 -350 0 1 {name=p4 lab=VREF}
C {devices/lab_pin.sym} 160 -370 0 0 {name=p7 lab=VDD}
C {devices/lab_pin.sym} 260 -330 0 0 {name=p8 lab=VSS}
C {devices/isource.sym} 570 -290 0 0 {name=IBIAS0 value=10e-6}
C {devices/lab_pin.sym} 550 -240 0 0 {name=p14 lab=VSS}
C {devices/capa.sym} 470 -290 0 0 {name=C1
m=1
value=1f
footprint=1206
device="ceramic capacitor"}
C {bmbg.sym} 320 -350 0 0 {name=X1}
C {devices/ammeter.sym} 210 -370 3 0 {name=Vivdd savecurrent=true}
