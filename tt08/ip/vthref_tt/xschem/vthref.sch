v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 70 -130 520 -130 { lab=VSS}
N 320 -450 480 -450 { lab=vp}
N 320 -450 320 -430 { lab=vp}
N 70 -690 520 -690 { lab=VDD}
N 520 -690 740 -690 { lab=VDD}
N 520 -130 740 -130 { lab=VSS}
N 740 -400 800 -400 { lab=VSINKT}
N 800 -400 800 -350 { lab=VSINKT}
N 780 -350 850 -350 { lab=VSINKT}
N 740 -130 890 -130 { lab=VSS}
N 890 -490 890 -380 { lab=ISINK}
N 890 -490 900 -490 { lab=ISINK}
N 820 -180 1010 -180 { lab=VSINKB}
N 1010 -240 1010 -180 { lab=VSINKB}
N 1010 -240 1030 -240 { lab=VSINKB}
N 1070 -210 1070 -130 { lab=VSS}
N 890 -130 1070 -130 { lab=VSS}
N 740 -690 1070 -690 { lab=VDD}
N 1210 -590 1210 -500 { lab=ISOURCE}
N 1210 -500 1220 -500 { lab=ISOURCE}
N 1070 -690 1210 -690 { lab=VDD}
N 320 -430 320 -420 { lab=vp}
N 360 -390 520 -390 { lab=vth}
N 360 -620 480 -620 { lab=vm}
N 440 -560 520 -560 { lab=vm}
N 440 -620 440 -560 { lab=vm}
N 320 -590 320 -450 { lab=vp}
N 520 -590 520 -480 { lab=vm}
N 520 -540 660 -540 { lab=vm}
N 660 -620 660 -540 { lab=vm}
N 660 -620 700 -620 { lab=vm}
N 740 -320 740 -280 { lab=VSINKB}
N 890 -320 890 -280 { lab=vm2}
N 740 -220 740 -130 { lab=VSS}
N 890 -220 890 -130 { lab=VSS}
N 780 -250 850 -250 { lab=VSINKB}
N 820 -250 820 -180 { lab=VSINKB}
N 1070 -320 1070 -270 { lab=vm3}
N 1070 -590 1070 -380 { lab=VSOURCE}
N 1000 -350 1030 -350 { lab=VSINKT}
N 1000 -350 1000 -300 { lab=VSINKT}
N 820 -300 1000 -300 { lab=VSINKT}
N 820 -350 820 -300 { lab=VSINKT}
N 740 -300 800 -300 { lab=VSINKB}
N 800 -300 800 -250 { lab=VSINKB}
N 1210 -690 1210 -650 { lab=VDD}
N 1070 -690 1070 -650 { lab=VDD}
N 740 -690 740 -650 { lab=VDD}
N 520 -690 520 -650 { lab=VDD}
N 320 -690 320 -650 { lab=VDD}
N 120 -690 120 -640 { lab=VDD}
N 120 -150 120 -130 { lab=VSS}
N 160 -180 240 -180 { lab=vp}
N 240 -440 240 -180 { lab=vp}
N 520 -160 520 -130 { lab=VSS}
N 740 -590 740 -380 { lab=VSINKT}
N 1150 -620 1150 -460 {
lab=VSOURCE}
N 1150 -460 1220 -460 {
lab=VSOURCE}
N 1010 -180 1220 -180 {
lab=VSINKB}
N 1000 -300 1220 -300 {
lab=VSINKT}
N 120 -440 150 -440 {
lab=vs}
N 210 -440 240 -440 {
lab=vp}
N 1150 -620 1170 -620 {
lab=VSOURCE}
N 1110 -620 1130 -620 {
lab=VSOURCE}
N 1130 -620 1130 -560 {
lab=VSOURCE}
N 1070 -560 1130 -560 {
lab=VSOURCE}
N 1130 -620 1150 -620 {
lab=VSOURCE}
N 240 -440 320 -440 {
lab=vp}
N 120 -580 120 -440 {
lab=vs}
N 120 -440 120 -300 {
lab=vs}
N 120 -300 120 -210 {
lab=vs}
N 320 -360 320 -130 {
lab=VSS}
N 520 -420 520 -220 {
lab=vth}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Lukas Baumann"}
C {devices/iopin.sym} 70 -130 2 0 {name=p1 lab=VSS
}
C {devices/iopin.sym} 70 -690 2 0 {name=p2 lab=VDD

}
C {devices/ipin.sym} 900 -490 2 0 {name=p3 lab=ISINK}
C {devices/opin.sym} 1220 -500 0 0 {name=p4 lab=ISOURCE}
C {devices/lab_pin.sym} 320 -390 0 0 {name=l4 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 500 -450 0 0 {name=MFB
L=5
W=9
nf=1
mult=10
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 520 -450 0 1 {name=l5 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 760 -350 0 1 {name=MMCB1
L=2
W=10
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 740 -350 0 0 {name=l9 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 870 -350 0 0 {name=MMCB2
L=2
W=10
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 890 -350 0 1 {name=l10 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1070 -240 0 1 {name=l11 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1090 -620 0 1 {name=MSOTL
L=10
W=20
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 1070 -620 0 0 {name=l12 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1190 -620 0 0 {name=MSOTR
L=10
W=20
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 1210 -620 0 1 {name=l13 sig_type=std_logic lab=VDD}
C {devices/lab_wire.sym} 420 -390 0 0 {name=l14 sig_type=std_logic lab=vth}
C {devices/lab_wire.sym} 420 -450 0 0 {name=l15 sig_type=std_logic lab=vp}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 500 -620 0 0 {name=MMIR1R
L=10
W=20
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 340 -620 0 1 {name=MMIR1L
L=10
W=20
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 320 -620 0 0 {name=l17 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 520 -620 0 1 {name=l18 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 720 -620 0 0 {name=MSIT
L=10
W=20
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 740 -620 0 1 {name=l2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 740 -250 0 0 {name=l19 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 890 -250 0 1 {name=l20 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 1050 -350 0 0 {name=MMCB3
L=2
W=10
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 1070 -350 0 1 {name=l21 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 340 -390 0 1 {name=MVTH
L=5
W=9
nf=1
mult=20
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 760 -250 0 1 {name=MMB1
L=20
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 870 -250 0 0 {name=MMB2
L=20
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1050 -240 0 0 {name=MMB3
L=20
W=10
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 120 -180 0 0 {name=p5 lab=VSS}
C {devices/lab_wire.sym} 120 -450 0 0 {name=l24 sig_type=std_logic lab=vs
}
C {sky130_fd_pr/lvsdiode.sym} 180 -440 1 1 {name=DSU
model=diode_pd2nw_11v0
area=1e+12
}
C {devices/lab_pin.sym} 100 -610 0 0 {name=l25 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 140 -180 0 1 {name=MSUL
L=2
W=20
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 120 -610 0 0 {name=RSU
W=0.69
L=140
model=res_xhigh_po_0p69
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 520 -190 0 0 {name=RREF1
W=1.41
L=40
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 500 -190 0 0 {name=l3 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 1070 -280 0 0 {name=l7 sig_type=std_logic lab=vm3}
C {devices/lab_wire.sym} 890 -310 0 0 {name=l8 sig_type=std_logic lab=vm2}
C {devices/iopin.sym} 1220 -460 0 0 {name=p6 lab=VSOURCE}
C {devices/iopin.sym} 1220 -300 0 0 {name=p7 lab=VSINKT}
C {devices/iopin.sym} 1220 -180 0 0 {name=p8 lab=VSINKB}
C {devices/lab_wire.sym} 520 -500 0 0 {name=l6 sig_type=std_logic lab=vm}
