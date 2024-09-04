v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 300 -960 400 -960 {
lab=DVDD}
N 400 -960 400 -900 {
lab=DVDD}
N 400 -840 400 -810 {
lab=#net1}
N 400 -810 420 -810 {
lab=#net1}
N 320 -840 320 -790 {
lab=#net2}
N 320 -790 420 -790 {
lab=#net2}
N 320 -930 320 -900 {
lab=AVDD}
N 300 -930 320 -930 {
lab=AVDD}
N 220 -730 420 -730 {
lab=#net3}
N 260 -660 260 -650 {
lab=VSS}
N 240 -650 260 -650 {
lab=VSS}
N 110 -730 160 -730 {
lab=VOUT}
N 110 -660 110 -650 {
lab=VSS}
N 90 -650 110 -650 {
lab=VSS}
N 90 -730 110 -730 {
lab=VOUT}
N 190 -380 190 -360 {
lab=OSC_RST}
N 190 -390 190 -380 {
lab=OSC_RST}
N 90 -410 420 -410 {
lab=OSC_EN}
N 190 -390 420 -390 {
lab=OSC_RST}
N 260 -730 260 -720 {
lab=#net3}
N 110 -730 110 -720 {
lab=VOUT}
N 90 -410 90 -170 {
lab=OSC_EN}
N 90 -210 110 -210 {
lab=OSC_EN}
C {devices/title.sym} 160 -30 0 0 {name=l1 author=""}
C {devices/lab_pin.sym} 300 -960 0 0 {name=p1 lab=DVDD}
C {devices/lab_pin.sym} 420 -770 0 0 {name=p2 lab=VSS}
C {devices/vsource.sym} 970 -440 0 0 {name=V1 value="PWL(0 0 100us 3.3)"}
C {devices/lab_pin.sym} 970 -410 0 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 970 -470 0 0 {name=p6 lab=AVDD}
C {devices/ammeter.sym} 400 -870 0 0 {name=Vid}
C {devices/ammeter.sym} 320 -870 0 0 {name=Via}
C {devices/vsource.sym} 1105 -300 1 0 {name=V2 value=0
}
C {devices/lab_pin.sym} 1075 -300 0 0 {name=p9 lab=0
}
C {devices/lab_pin.sym} 1135 -300 0 1 {name=p10 lab=VSS}
C {devices/code.sym} 910 -210 0 0 {name=LIB_CORNER
only_toplevel=true
format="tcleval( @value )"
value="
.csparam TB_ID=\\\\$::TB_ID\\\\
.csparam MC_RUNS=\\\\$::MC_RUNS\\\\
.csparam EXIT_NGSPICE=\\\\$::EXIT_NGSPICE\\\\
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice \\\\$::CORNER\\\\
"}
C {devices/lab_pin.sym} 970 -310 0 0 {name=p12 lab=VSS}
C {devices/lab_pin.sym} 970 -370 0 0 {name=p13 lab=TEMPERATURE}
C {devices/vsource_arith.sym} 970 -340 0 0 {name=E1 VOL=temper}
C {devices/code.sym} 1060 -210 0 0 {name=NGSPICE
only_toplevel=true
*format="tcleval( @value )"
value="* this experimental option enables mos model bin 
* selection based on W/NF instead of W
.option wnflag=0

.control
* option savecurrents
* save all


* dummy block for goto
if (1)
if TB_ID = 0
	goto TRAN_STARTUP
end
if TB_ID = 1
	goto TRAN_STARTUP
end
if TB_ID = 2
	goto TRAN_OSC
end

****************************************
label TRAN_STARTUP
****************************************
if MC_RUNS = 0
	let veclen=9
	let max_i_a = vector(veclen)
	let max_i_d = vector(veclen)
	let ldo_out_over = vector(veclen)
	let ldo_out_end = vector(veclen)
	let temp = vector(veclen)
	let t_supup = vector(veclen)
	let run = 0

	foreach te -40 20 140
	*foreach te 20
		foreach t_supup 50us 100us 150us
		*foreach t_supup 150us
			
			.include tt08_tran_startup_ops.inc

			reset
			let run = run + 1			
		end
	end
	set nobreak
	set width=300
	print temp, t_supup, max_i_a, max_i_d, ldo_out_over, ldo_out_end > tran.csv
else
	let max_i_a = vector(MC_RUNS)
	let max_i_d = vector(MC_RUNS)
	let ldo_out_over = vector(MC_RUNS)
	let ldo_out_end = vector(MC_RUNS)
	let temp = vector(MC_RUNS)
	let t_supup = vector(MC_RUNS)
	let run=0

	set t_supup = 50us
	set te = 20

	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"
		
		.include tt08_tran_startup_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print temp, t_supup, max_i_a, max_i_d, ldo_out_over, ldo_out_end > tran.csv
end
goto done

****************************************
label TRAN_OSC
****************************************
if MC_RUNS = 0
	let veclen=3
	let temp = vector(veclen)
	let first_high = vector(veclen)
	let first_period = vector(veclen)
	let first_dutycycle_percent = vector(veclen)
	let last_high = vector(veclen)
	let run = 0

	foreach te -40 20 140
	*foreach te 20
		
		.include tt08_tran_osc_ops.inc

		reset
		let run = run + 1

	end
	set nobreak
	set width=300
	print temp, first_high, first_period, first_dutycycle_percent > tran.csv
else
	let temp = vector(MC_RUNS)
	let first_high = vector(MC_RUNS)
	let first_period = vector(MC_RUNS)
	let first_dutycycle_percent = vector(MC_RUNS)
	let last_high = vector(MC_RUNS)
	let run=0

	set te = 20

	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"
		
		.include tt08_tran_osc_ops.inc

 		reset
		let run = run + 1
	end
	set nobreak
	set width=300
	print temp, first_high, first_period, first_dutycycle_percent > tran.csv
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
C {tt08.sym} 570 -510 0 0 {name=x1}
C {devices/vsource.sym} 970 -550 0 0 {name=V3 value="PWL(0 0 100us 1.8)"}
C {devices/lab_pin.sym} 970 -520 0 0 {name=p11 lab=VSS}
C {devices/lab_pin.sym} 970 -580 0 0 {name=p14 lab=DVDD}
C {devices/lab_pin.sym} 300 -930 0 0 {name=p15 lab=AVDD}
C {devices/res.sym} 190 -730 1 0 {name=R1
value=500
footprint=1206
device=resistor
m=1}
C {devices/capa.sym} 260 -690 0 0 {name=C1
m=1
value=5p
footprint=1206
device="ceramic capacitor"}
C {devices/capa.sym} 110 -690 0 0 {name=C2
m=1
value=10p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_pin.sym} 240 -650 0 0 {name=p3 lab=VSS}
C {devices/lab_pin.sym} 90 -650 0 0 {name=p4 lab=VSS}
C {devices/lab_pin.sym} 90 -730 0 0 {name=p7 lab=VOUT}
C {devices/lab_pin.sym} 720 -410 0 1 {name=p8 lab=OSC_OUT}
C {devices/vsource.sym} 90 -140 0 0 {name=V4 value="PWL(0 0 900us 0 901us 1.8 902us 1.8 903us 0 904us 0 905us 1.8 906us 1.8 907us 1.8 908us 0)"}
C {devices/vsource.sym} 190 -330 0 0 {name=V5 value="PWL(0 1.8 800us 1.8 810us 0)"}
C {devices/lab_pin.sym} 90 -110 0 0 {name=p16 lab=VSS}
C {devices/lab_pin.sym} 190 -300 0 0 {name=p17 lab=VSS}
C {devices/lab_pin.sym} 90 -410 0 0 {name=p18 lab=OSC_EN}
C {devices/lab_pin.sym} 190 -390 0 0 {name=p19 lab=OSC_RST}
C {devices/res.sym} 140 -210 1 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {devices/lab_pin.sym} 170 -210 0 1 {name=p20 lab=VSS}
