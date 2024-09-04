v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 760 -500 760 -480 {
lab=VCM}
N 740 -480 760 -480 {
lab=VCM}
N 670 -590 760 -590 {
lab=OPOUT}
N 100 -520 100 -480 {
lab=#net1}
N 710 -730 710 -590 {
lab=OPOUT}
N 510 -570 580 -570 {
lab=VINP}
N 510 -570 510 -510 {
lab=VINP}
N 220 -420 220 -380 {
lab=#net2}
N 100 -610 100 -580 {
lab=VINN}
N 220 -510 220 -480 {
lab=VINP}
N 760 -590 890 -590 {
lab=OPOUT}
N 850 -500 850 -480 {
lab=VCM}
N 760 -480 850 -480 {
lab=VCM}
N 360 -530 360 -510 {
lab=VINP}
N 220 -510 510 -510 {
lab=VINP}
N 760 -590 760 -560 {
lab=OPOUT}
N 850 -590 850 -560 {
lab=OPOUT}
N 360 -610 360 -590 {
lab=#net3}
N 290 -610 580 -610 {
lab=#net3}
N 100 -610 230 -610 {
lab=VINN}
N 310 -220 310 -180 {
lab=VCM}
N 310 -200 350 -200 {
lab=VCM}
N 710 -730 760 -730 {
lab=OPOUT}
N 800 -750 800 -740 {
lab=#net4}
N 630 -750 800 -750 {
lab=#net4}
N 510 -750 510 -610 {
lab=#net3}
N 510 -750 570 -750 {
lab=#net3}
C {devices/title.sym} 160 -30 0 0 {name=l1 author=""}
C {devices/lab_pin.sym} 310 -210 0 0 {name=p5 lab=VCM}
C {devices/lab_pin.sym} 310 -280 0 0 {name=p6 lab=VDD}
C {devices/vsource.sym} 375 -200 1 0 {name=V2 value=0
}
C {devices/code.sym} 770 -330 0 0 {name=LIB_CORNER
only_toplevel=true
format="tcleval( @value )"
value="
.csparam TB_ID=\\\\$::TB_ID\\\\
.csparam MC_RUNS=\\\\$::MC_RUNS\\\\
.csparam EXIT_NGSPICE=\\\\$::EXIT_NGSPICE\\\\
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice \\\\$::CORNER\\\\
"}
C {devices/lab_pin.sym} 160 -120 0 0 {name=p12 lab=VCM}
C {devices/lab_pin.sym} 160 -180 0 0 {name=p13 lab=TEMPERATURE}
C {devices/vsource_arith.sym} 160 -150 0 0 {name=E1 VOL=temper}
C {devices/code.sym} 920 -330 0 0 {name=NGSPICE
only_toplevel=true
*format="tcleval( @value )"
value="* this experimental option enables mos model bin 
* selection based on W/NF instead of W
.option wnflag=0

.control
* option savecurrents

* dummy block for goto
if (1)
if TB_ID = 0
	goto AC_OL
end
if TB_ID = 1
	goto AC_OL
end
if TB_ID = 2
	goto AC_CMRR_PSRR
end
if TB_ID = 3
	goto TRAN_OUTRNG
end
if TB_ID = 4
	goto TRAN_CMINP
end
if TB_ID = 5
	goto TRAN_SLEW
end
if TB_ID = 6
	goto AC_INOISE
end
if TB_ID = 7
	goto TRAN_THD
end

* Helper Functions
******************
define aunif(nom, avar) (nom+avar*sunif(0))
define agauss(nom, avar, sig) (nom + avar / sig * sgauss (0))

****************************************
label AC_OL
save all
****************************************
if MC_RUNS = 0
	let olgain_1hz = vector(MC_RUNS+1)
	let pm = vector(MC_RUNS+1)
	let ugbw = vector(MC_RUNS+1)
	let f1_3db = vector(MC_RUNS+1)
	let f2_3db = vector(MC_RUNS+1)
	let run=0

	.include ac_ol_ops.inc

	set nobreak
	set width=300
	print col olgain_1hz, pm, ugbw, f1_3db, f2_3db > ac_ol.csv
else
	let olgain_1hz = vector(MC_RUNS)
	let pm = vector(MC_RUNS)
	let ugbw = vector(MC_RUNS)
	let f1_3db = vector(MC_RUNS)
	let f2_3db = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"
	
		.include ac_ol_ops.inc	

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print olgain_1hz, pm, ugbw, f1_3db, f2_3db > ac_ol.csv
end
goto done

****************************************
label AC_CMRR_PSRR
save all
****************************************
if MC_RUNS = 0
	let cmrr_10Hz = vector(MC_RUNS+1)
	let cmrr_10MHz = vector(MC_RUNS+1)
	let psrr_p_10Hz = vector(MC_RUNS+1)
	let psrr_p_10MHz = vector(MC_RUNS+1)
	let psrr_n_10Hz = vector(MC_RUNS+1)
	let psrr_n_10MHz = vector(MC_RUNS+1)
	let run=0

	.include ac_cmrr_psrr_ops.inc

	set nobreak
	set width=300
	print col cmrr_10Hz, cmrr_10MHz, psrr_p_10Hz, psrr_p_10MHz, psrr_n_10Hz, psrr_n_10MHz > ac_cmrr_psrr.csv
else
	let cmrr_10Hz = vector(MC_RUNS)
	let cmrr_10MHz = vector(MC_RUNS)
	let psrr_p_10Hz = vector(MC_RUNS)
	let psrr_p_10MHz = vector(MC_RUNS)
	let psrr_n_10Hz = vector(MC_RUNS)
	let psrr_n_10MHz = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		.include ac_cmrr_psrr_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print cmrr_10Hz, cmrr_10MHz, psrr_p_10Hz, psrr_p_10MHz, psrr_n_10Hz, psrr_n_10MHz > ac_cmrr_psrr.csv
end
goto done

****************************************
label TRAN_OUTRNG
save all
****************************************
if MC_RUNS = 0
	let neg_out_comp = vector(MC_RUNS+1)
	let pos_out_comp = vector(MC_RUNS+1)
	let run=0

	.include tran_outrng_ops.inc

	set nobreak
	set width=300
	print col neg_out_comp, pos_out_comp > tran_outrng.csv
else
	let neg_out_comp = vector(MC_RUNS)
	let pos_out_comp = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		.include tran_outrng_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print neg_out_comp, pos_out_comp > tran_outrng.csv
end
goto done

****************************************
label TRAN_CMINP
save all
****************************************
if MC_RUNS = 0
	let pos_cm_bound = vector(MC_RUNS+1)
	let neg_cm_bound = vector(MC_RUNS+1)
	let run=0

	.include tran_cminp_ops.inc

	set nobreak
	set width=300
	print col pos_cm_bound, neg_cm_bound > tran_inprng.csv
else
	let pos_cm_bound = vector(MC_RUNS)
	let neg_cm_bound = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		.include tran_cminp_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print pos_cm_bound, neg_cm_bound > tran_inprng.csv
end
goto done

****************************************
label TRAN_SLEW
save all
****************************************
if MC_RUNS = 0
	let inp_offset = vector(MC_RUNS+1)
	let slew_pos = vector(MC_RUNS+1)
	let slew_neg = vector(MC_RUNS+1)
	let run=0

	.include tran_slew_ops.inc

	set nobreak
	set width=300
	print col inp_offset, slew_pos, slew_neg > tran_slew.csv
else
	let inp_offset = vector(MC_RUNS)
	let slew_pos = vector(MC_RUNS)
	let slew_neg = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		.include tran_slew_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print inp_offset, slew_pos, slew_neg > tran_slew.csv
end
goto done

****************************************
label AC_INOISE
****************************************
alter vsupp dc = 2.5
alter vsupp ac = 0
alter vsupn dc = 2.5
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rinn ac = 100e12
alter rcm resistance = 100e12
alter rcm ac = 100e12
alter rfb resistance = 0
alter rfb ac = 0.01

noise v(opout) vinpac dec 10 1 100e6 1
print noise2.onoise_total noise2.inoise_total
plot noise1.onoise_spectrum
plot noise1.inoise_spectrum
setplot noise1
write noise1_opout.raw all

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
label TRAN_THD
save all
****************************************
if MC_RUNS = 0
	let thd = vector(MC_RUNS+1)
	let run=0

	.include tran_thd_ops.inc

	set nobreak
	set width=300
	print col thd > tran_thd.csv
else
	let thd = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"

		reset

		.include tran_thd_ops.inc

		let run = run + 1
	end
	set nobreak
	set width=300
	print thd > tran_thd.csv
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
C {bmbgota.sym} 610 -590 0 0 {name=X1}
C {devices/lab_pin.sym} 740 -480 0 0 {name=p3 lab=VCM}
C {devices/lab_pin.sym} 890 -590 0 1 {name=p4 lab=OPOUT}
C {devices/lab_pin.sym} 580 -660 0 0 {name=p7 lab=VDD}
C {devices/lab_pin.sym} 580 -540 0 0 {name=p8 lab=VSS}
C {devices/isource.sym} 520 -150 0 0 {name=IBIAS value=10e-6}
C {devices/lab_pin.sym} 520 -120 0 0 {name=p14 lab=VCM}
C {devices/capa.sym} 760 -530 0 0 {name=COUT
m=1
value=10f
footprint=1206
device="ceramic capacitor"}
C {devices/vsource.sym} 100 -450 0 0 {name=VINNDC value=0}
C {devices/lab_pin.sym} 100 -420 0 0 {name=p2 lab=VCM}
C {devices/vsource.sym} 100 -550 0 0 {name=VINNAC value="DC 0 AC 0"}
C {devices/lab_pin.sym} 100 -610 0 0 {name=p16 lab=VINN}
C {devices/lab_pin.sym} 520 -180 0 0 {name=p17 lab=IB}
C {devices/lab_pin.sym} 580 -640 0 0 {name=p18 lab=IB}
C {devices/vsource.sym} 220 -350 0 0 {name=VINPDC value=0}
C {devices/lab_pin.sym} 220 -320 0 0 {name=p1 lab=VCM}
C {devices/vsource.sym} 220 -450 0 0 {name=VINPAC value="DC 0 AC 0"}
C {devices/lab_pin.sym} 220 -510 0 0 {name=p20 lab=VINP}
C {devices/res.sym} 850 -530 2 0 {name=ROUT
value=100G
footprint=1206
device=resistor
m=1}
C {devices/vsource.sym} 310 -250 0 0 {name=VSUPP value="DC 2.5 AC 0"}
C {devices/res.sym} 600 -750 3 0 {name=RFB
value=100G
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 260 -610 3 0 {name=RINN
value=100G
footprint=1206
device=resistor
m=1}
C {devices/res.sym} 360 -560 2 0 {name=RCM
value=100G
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 310 -120 0 0 {name=p15 lab=VSS}
C {devices/vsource.sym} 310 -150 0 0 {name=VSUPN value="DC 2.5 AC 0"}
C {devices/lab_pin.sym} 405 -200 0 1 {name=p10 lab=0
}
C {devices/vcvs.sym} 800 -710 0 0 {name=E2 value=1}
C {devices/lab_pin.sym} 760 -690 0 0 {name=p9 lab=VSS}
C {devices/lab_pin.sym} 800 -680 0 0 {name=p11 lab=VSS}
