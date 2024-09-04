v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 510 -410 510 -340 { lab=ISOURCE}
N 690 -470 690 -440 { lab=cn_isource}
N 690 -470 830 -470 { lab=cn_isource}
N 830 -470 830 -440 { lab=cn_isource}
N 690 -380 690 -350 { lab=VSS}
N 690 -350 830 -350 { lab=VSS}
N 830 -380 830 -350 { lab=VSS}
N 690 -280 690 -250 { lab=cn_isink}
N 690 -280 830 -280 { lab=cn_isink}
N 830 -280 830 -250 { lab=cn_isink}
N 690 -190 690 -160 { lab=VSS}
N 690 -160 830 -160 { lab=VSS}
N 830 -190 830 -160 { lab=VSS}
N 360 -410 510 -410 {
lab=ISOURCE}
N 360 -390 430 -390 {
lab=ISINK}
N 430 -430 430 -390 {
lab=ISINK}
N 430 -440 430 -430 {
lab=ISINK}
N 180 -410 200 -410 {
lab=#net1}
N 100 -410 120 -410 {
lab=VIN}
C {devices/title.sym} 160 -30 0 0 {name=l1 author=""}
C {vthref.sym} 280 -390 0 0 {name=X1}
C {devices/lab_pin.sym} 100 -410 0 0 {name=p1 lab=VIN}
C {devices/lab_pin.sym} 200 -310 0 0 {name=p2 lab=VSS}
C {devices/lab_pin.sym} 510 -410 0 1 {name=p3 lab=ISOURCE}
C {devices/lab_pin.sym} 430 -430 0 1 {name=p4 lab=ISINK}
C {devices/vsource.sym} 280 -190 0 0 {name=V1 value=3.3}
C {devices/lab_pin.sym} 280 -160 0 0 {name=p5 lab=VSS}
C {devices/lab_pin.sym} 280 -220 0 0 {name=p6 lab=VDD}
C {devices/ammeter.sym} 430 -470 0 0 {name=Visink}
C {devices/ammeter.sym} 510 -310 0 0 {name=Visource}
C {devices/lab_pin.sym} 430 -500 0 0 {name=p7 lab=VDD}
C {devices/lab_pin.sym} 510 -280 0 0 {name=p8 lab=VSS}
C {devices/vsource.sym} 395 -150 1 0 {name=V2 value=0
}
C {devices/lab_pin.sym} 365 -150 0 0 {name=p9 lab=0
}
C {devices/lab_pin.sym} 425 -150 0 1 {name=p10 lab=VSS}
C {devices/code.sym} 50 -600 0 0 {name=LIB_CORNER
only_toplevel=true
format="tcleval( @value )"
value="
.csparam TB_ID=\\\\$::TB_ID\\\\
.csparam MC_RUNS=\\\\$::MC_RUNS\\\\
.csparam EXIT_NGSPICE=\\\\$::EXIT_NGSPICE\\\\
.lib \\\\$::SKYWATER_MODELS\\\\/sky130.lib.spice \\\\$::CORNER\\\\
"}
C {devices/lab_pin.sym} 690 -350 0 0 {name=p11 lab=VSS}
C {devices/capa.sym} 830 -410 0 0 {name=C1
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_wire.sym} 770 -470 0 0 {name=l2 sig_type=std_logic lab=cn_isource}
C {devices/lab_pin.sym} 690 -160 0 0 {name=p14 lab=VSS}
C {devices/capa.sym} 830 -220 0 0 {name=C2
m=1
value=1p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_wire.sym} 770 -280 0 0 {name=l3 sig_type=std_logic lab=cn_isink}
C {devices/ccvs.sym} 690 -410 0 0 {name=H1 vnam=Visource value=1}
C {devices/ccvs.sym} 690 -220 0 0 {name=H2 vnam=Visink value=1}
C {devices/lab_pin.sym} 160 -160 0 0 {name=p12 lab=VSS}
C {devices/lab_pin.sym} 160 -220 0 0 {name=p13 lab=TEMPERATURE}
C {devices/vsource_arith.sym} 160 -190 0 0 {name=E1 VOL=temper}
C {devices/code.sym} 200 -600 0 0 {name=NGSPICE
only_toplevel=true
*format="tcleval( @value )"
value="* this experimental option enables mos model bin 
* selection based on W/NF instead of W
.option wnflag=0

Vac1 VIN VDD 0.0 AC 1

.control
* option savecurrents
save all


* dummy block for goto
if (1)
if TB_ID = 0
	goto DC
end
if TB_ID = 1
	goto DC
end
if TB_ID = 2
	goto SINK_NOISE
end
if TB_ID = 3
	goto SOURCE_NOISE
end
if TB_ID = 4
	goto DC_PEX 
end
if TB_ID = 5
	goto TRAN_STARTUP 
end

****************************************
label DC
save all @b.x1.xrref1.xsky130_fd_pr__res_xhigh_po_1p41.brend[i] @b.x1.xrref1.xsky130_fd_pr__res_xhigh_po_1p41.brbody[i] @b.x1.xrsu.xsky130_fd_pr__res_xhigh_po_0p69.brend[i] @b.x1.xrsu.xsky130_fd_pr__res_xhigh_po_0p69.brbody[i] @m.x1.xmvth.msky130_fd_pr__nfet_01v8[vdsat] @m.x1.xmvth.msky130_fd_pr__nfet_01v8[vds] @m.x1.xmfb.msky130_fd_pr__nfet_g5v0d10v5[vdsat] @m.x1.xmfb.msky130_fd_pr__nfet_g5v0d10v5[vds] @m.x1.xmmir1l.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xmmir1l.msky130_fd_pr__pfet_01v8[vds] @m.x1.xmmir1r.msky130_fd_pr__pfet_01v8[vdsat] @m.x1.xmmir1r.msky130_fd_pr__pfet_01v8[vds]
label DC_PEX
save all
****************************************
if MC_RUNS = 0
	let veclen=4
	let source_pp = vector(veclen)
	let sink_pp = vector(veclen)
	let myvdd = vector(veclen)
	let idx = 0
	foreach v_sweep 3 4 5 6
	*foreach v_sweep 3.3
  		alter v1=$v_sweep
  		dc temp -40 140 1
  		plot visource#branch
  		plot visink#branch
  		plot x1.vth
  		plot x1.vp
  		plot x1.vm
		plot -1*@b.x1.xrref1.xsky130_fd_pr__res_xhigh_po_1p41.brend[i]
		plot -1*@b.x1.xrref1.xsky130_fd_pr__res_xhigh_po_1p41.brbody[i]
		plot -1*@b.x1.xrsu.xsky130_fd_pr__res_xhigh_po_0p69.brend[i]
		plot -1*@b.x1.xrsu.xsky130_fd_pr__res_xhigh_po_0p69.brbody[i]
		let source_pp[idx] = maximum(visource#branch)-minimum(visource#branch)
		let sink_pp[idx] = maximum(visink#branch)-minimum(visink#branch)
		let myvdd[idx] = $v_sweep
		let idx = idx + 1
		*echo ISOURCE span: "$&source_pp[idx]"
		*echo ISINK span: "$&sink_pp[idx]"
		write dc.raw all
		set appendwrite
	end
	print myvdd, source_pp, sink_pp > dc.csv
else
	let source_pp = vector(MC_RUNS)
	let sink_pp = vector(MC_RUNS)
	let run=0
	dowhile run < MC_RUNS
		echo MC-RUN: "$&run"
		dc temp -40 140 1
		let source_pp[run] = maximum(visource#branch)-minimum(visource#branch)
		let sink_pp[run] = maximum(visink#branch)-minimum(visink#branch)
  		*plot visource#branch
		*plot visink#branch
		*write dc_CID_\{$&CORNER_ID\}_MC_\{$&run\}.raw all
 		reset
		let run = run + 1
	end
	print source_pp, sink_pp > dc.csv
end
goto done

****************************************
label SOURCE_NOISE
****************************************
noise v(cn_isource) Vac1 dec 10 1 100e3 1
setplot noise2
print onoise_total
setplot noise1
plot onoise_spectrum
write noise1_isource.raw all
goto done

****************************************
label SINK_NOISE
****************************************
noise v(cn_isink) Vac1 dec 10 1 100e3 1
setplot noise2
print onoise_total
setplot noise1
plot onoise_spectrum
write noise1_isink.raw all
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
		alter @v1[pwl] = [ 0 0 1u 0 10u $v_sweep]
  		tran 100n 20m
  		plot visource#branch
  		plot visink#branch
		plot VDD
		meas tran m_cur_up when i(visource)=5e-6 rise=1
		let startup_t[run] = m_cur_up
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
C {devices/ammeter.sym} 150 -410 3 0 {name=Viin}
