v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1010 -390 1030 -390 {
lab=VSS}
N 310 -100 340 -100 {
lab=VSS}
N 100 -500 100 -480 {
lab=VREF}
N 840 -500 840 -470 {
lab=VLDO}
N 310 -200 310 -180 {
lab=#net1}
N 310 -120 310 -100 {
lab=VSS}
N 840 -410 840 -390 {
lab=VSS}
N 750 -410 750 -390 {
lab=VSS}
N 750 -500 750 -470 {
lab=VLDO}
N 710 -500 750 -500 {
lab=VLDO}
N 750 -500 840 -500 {
lab=VLDO}
N 640 -500 650 -500 {
lab=#net2}
N 640 -520 1030 -520 {
lab=#net3}
N 100 -500 520 -500 {
lab=VREF}
N 460 -460 520 -460 {
lab=#net4}
N 280 -460 400 -460 {
lab=lprobe}
N 380 -460 380 -440 {
lab=lprobe}
N 200 -460 220 -460 {
lab=#net5}
N 200 -480 200 -460 {
lab=#net5}
N 200 -480 520 -480 {
lab=#net5}
N 1030 -520 1030 -470 {
lab=#net3}
N 1030 -410 1030 -390 {
lab=VSS}
N 840 -500 920 -500 {
lab=VLDO}
N 920 -500 920 -470 {
lab=VLDO}
N 920 -410 920 -390 {
lab=VSS}
N 740 -390 920 -390 {
lab=VSS}
C {devices/title.sym} 160 -30 0 0 {name=l1 author=""}
C {devices/vsource.sym} 310 -230 0 0 {name=VSUPP value="DC 5 AC 0"}
C {devices/lab_pin.sym} 310 -100 0 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 310 -260 0 0 {name=p6 lab=VDD}
C {devices/vsource.sym} 365 -100 1 0 {name=V2 value=0
}
C {devices/lab_pin.sym} 395 -100 0 1 {name=p9 lab=0
}
C {devices/code.sym} 780 -220 0 0 {name=LIB_CORNER
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
C {devices/code.sym} 930 -220 0 0 {name=NGSPICE
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
	goto TRAN_LOAD
end
if TB_ID = 1
	goto TRAN_CURVE_TEMP
end
if TB_ID = 2
	goto TRAN_CURVE_VDD
end
if TB_ID = 3
	goto TRAN_CURVE_ILOAD
end
if TB_ID = 4
	goto VLDO_NOISE
end
if TB_ID = 5
	goto AC_PSRR
end
if TB_ID = 6
	goto TRAN_LINE
end
if TB_ID = 7
	goto TRAN_LOAD
end
if TB_ID = 8
	goto AC_LOOPGAIN
end

****************************************
label TRAN_CURVE_TEMP
save all
****************************************
if MC_RUNS = 0
	let veclen=3
	let vldo_pp = vector(veclen)
	let vldo_t20 = vector(veclen)
	let vldo_tc20 = vector(veclen)
	let vldo_mean = vector(veclen)
	let vsup = vector(veclen)
	let isup = vector(veclen)
	let run = 0

	foreach v_sweep 3 4 5
	*foreach v_sweep 4

		.include ldo_tran_curve_temp_ops.inc

		reset
		let run = run + 1
	end

	set nobreak
	set width=300
	print isup, vsup, vldo_pp, vldo_mean, vldo_t20, vldo_tc20 > ldo_tran_temp.csv

else
	let vldo_pp = vector(MC_RUNS)
	let vldo_t20 = vector(MC_RUNS)
	let vldo_tc20 = vector(MC_RUNS)
	let vldo_mean = vector(MC_RUNS)
	let vsup = vector(MC_RUNS)
	let isup = vector(MC_RUNS)
	let run = 0
	set v_sweep = 3

	dowhile run < MC_RUNS
		echo MC-RUN: $&run

		.include ldo_tran_curve_temp_ops.inc

 		reset
		let run = run + 1
	end

	set nobreak
	set width=300
	print isup, vsup, vldo_pp, vldo_mean, vldo_t20, vldo_tc20 > ldo_tran_temp.csv
end
goto done

****************************************
label TRAN_CURVE_VDD
save all
****************************************
if MC_RUNS = 0
	let veclen=3
	let vldo_pp = vector(veclen)
	let vldo_3v3 = vector(veclen)
	let vldo_tc3v3 = vector(veclen)
	let vldo_mean = vector(veclen)
	let te = vector(veclen)
	let isup = vector(veclen)
	let run = 0

	foreach t_sweep -40 20 140
	*foreach t_sweep 20

		.include ldo_tran_curve_vdd_ops.inc

		let run = run + 1		
	end

	set nobreak
	set width=300
	print isup, te, vldo_pp, vldo_mean, vldo_3v3, vldo_tc3v3 > ldo_tran_vdd.csv

else
	let vldo_pp = vector(MC_RUNS)
	let vldo_3v3 = vector(MC_RUNS)
	let vldo_tc3v3 = vector(MC_RUNS)
	let vldo_mean = vector(MC_RUNS)
	let te = vector(MC_RUNS)
	let isup = vector(MC_RUNS)
	let run = 0
	set t_sweep = 20

	dowhile run < MC_RUNS
		echo MC-RUN: $&run

		.include ldo_tran_curve_vdd_ops.inc

 		reset
		let run = run + 1
	end

	set nobreak
	set width=300
	print isup, te, vldo_pp, vldo_mean, vldo_3v3, vldo_tc3v3 > ldo_tran_vdd.csv
end
goto done

****************************************
label TRAN_CURVE_ILOAD
save all
****************************************
if MC_RUNS = 0
	let veclen=3
	let vldo_pp = vector(veclen)
	let vldo_100u = vector(veclen)
	let vldo_tc100u = vector(veclen)
	let vldo_mean = vector(veclen)
	let te = vector(veclen)
	let isup = vector(veclen)
	let run = 0

	foreach t_sweep -40 20 140
	*foreach t_sweep 20

		.include ldo_tran_curve_iload_ops.inc

		reset
		let run = run + 1		
	end

	set nobreak
	set width=300
	print isup, te, vldo_pp, vldo_mean, vldo_100u, vldo_tc100u > ldo_tran_iload.csv

else
	let vldo_pp = vector(MC_RUNS)
	let vldo_100u = vector(MC_RUNS)
	let vldo_tc100u = vector(MC_RUNS)
	let vldo_mean = vector(MC_RUNS)
	let te = vector(MC_RUNS)
	let isup = vector(MC_RUNS)
	let run = 0
	set t_sweep = 20

	dowhile run < MC_RUNS
		echo MC-RUN: $&run

		.include ldo_tran_curve_iload_ops.inc

 		reset
		let run = run + 1
	end

	set nobreak
	set width=300
	print isup, te, vldo_pp, vldo_mean, vldo_100u, vldo_tc100u > ldo_tran_iload.csv
end
goto done

****************************************
label VLDO_NOISE
****************************************
noise v(vldo) VSUPP dec 10 1 100e3 1
setplot noise2
print onoise_total
setplot noise1
if EXIT_NGSPICE = 0
	plot onoise_spectrum
end
write ldo_ac_noise.raw all

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
print col f0, n_f0, f1, n_f1 > ldo_ac_noise.csv

goto done

****************************************
label AC_PSRR
save all
****************************************
if MC_RUNS = 0
	let psrr_p_10Hz = vector(MC_RUNS+1)
	let psrr_p_10MHz = vector(MC_RUNS+1)
	let run=0

	.include ldo_ac_psrr_ops.inc

	set nobreak
	set width=300
	print col psrr_p_10Hz, psrr_p_10MHz > ldo_ac_psrr.csv
else
	let psrr_p_10Hz = vector(MC_RUNS)
	let psrr_p_10MHz = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		.include ldo_ac_psrr_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print psrr_p_10Hz, psrr_p_10MHz > ldo_ac_psrr.csv
end
goto done

****************************************
label TRAN_LINE
save all
****************************************
if MC_RUNS = 0
	let line_tran_pp = vector(MC_RUNS+1)
	let run=0

	.include ldo_tran_line_ops.inc

	set nobreak
	set width=300
	print col line_tran_pp > ldo_tran_line.csv
else
	let line_tran_pp = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		.include ldo_tran_line_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print line_tran_pp > ldo_tran_line.csv
end
goto done

****************************************
label TRAN_LOAD
save all
****************************************
if MC_RUNS = 0
	let load_tran_pp = vector(MC_RUNS+1)
	let run=0

	.include ldo_tran_load_ops.inc

	set nobreak
	set width=300
	print col load_tran_pp > ldo_tran_load.csv
else
	let load_tran_pp = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		.include ldo_tran_load_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print load_tran_pp > ldo_tran_load.csv
end
goto done

****************************************
label AC_LOOPGAIN
save all
****************************************
if MC_RUNS = 0
	let loop_pm = vector(MC_RUNS+1)
	let run = 0

	.include ldo_ac_loopgain_ops.inc

	set nobreak
	set width=300
	print col loop_pm > ldo_ac_loop.csv

else
	let loop_pm = vector(MC_RUNS)
	let run = 0

	dowhile run < MC_RUNS
		echo MC-RUN: $&run

		.include ldo_ac_loopgain_ops.inc

 		reset
		let run = run + 1
	end

	set nobreak
	set width=300
	print col loop_pm > ldo_ac_loop.csv
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
C {devices/lab_pin.sym} 740 -390 0 0 {name=p3 lab=VSS}
C {devices/lab_pin.sym} 920 -500 0 1 {name=p4 lab=VLDO}
C {devices/lab_pin.sym} 520 -520 0 0 {name=p7 lab=VDD}
C {devices/lab_pin.sym} 520 -440 0 0 {name=p8 lab=VSS}
C {devices/isource.sym} 1030 -440 2 0 {name=I0 value=10e-6}
C {devices/lab_pin.sym} 1010 -390 0 0 {name=p14 lab=VSS}
C {devices/capa.sym} 920 -440 0 0 {name=CLOAD
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/vsource.sym} 100 -450 0 0 {name=VRF value="DC 1.2 AC 0"}
C {devices/lab_pin.sym} 100 -420 0 0 {name=p1 lab=VSS}
C {devices/lab_pin.sym} 100 -500 0 0 {name=p2 lab=VREF}
C {devices/isource.sym} 840 -440 0 0 {name=IL value=50e-6}
C {devices/vsource.sym} 310 -150 0 0 {name=VSUPTRAN value=0}
C {devices/isource.sym} 750 -440 0 0 {name=ILTRAN value=0
}
C {devices/ammeter.sym} 680 -500 3 1 {name=Viload}
C {devices/vsource.sym} 430 -460 3 1 {name=VLOOP1 value="DC 0 AC 0"}
C {devices/vsource.sym} 250 -460 1 0 {name=VLOOP2 value="DC 0 AC 0"}
C {devices/isource.sym} 380 -410 2 0 {name=ILOOP1 value=0
}
C {devices/lab_pin.sym} 380 -380 0 0 {name=p10 lab=VSS}
C {devices/lab_pin.sym} 300 -460 3 0 {name=p11 lab=lprobe}
C {ldo.sym} 580 -500 0 0 {name=X1}
