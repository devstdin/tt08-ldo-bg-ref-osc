v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 180 -670 180 -630 {
lab=VDD}
N 380 -510 380 -480 {
lab=vt}
N 380 -510 600 -510 {
lab=vt}
N 600 -510 600 -480 {
lab=vt}
N 380 -420 380 -360 {
lab=vl}
N 600 -420 600 -360 {
lab=vr}
N 600 -300 600 -270 {
lab=VSS}
N 380 -300 380 -270 {
lab=VSS}
N 420 -330 560 -330 {
lab=vl}
N 380 -380 450 -380 {
lab=vl}
N 450 -380 450 -330 {
lab=vl}
N 180 -570 180 -540 {
lab=IB}
N 70 -540 180 -540 {
lab=IB}
N 250 -600 250 -540 {
lab=IB}
N 180 -540 250 -540 {
lab=IB}
N 70 -270 600 -270 {
lab=VSS}
N 490 -570 490 -510 {
lab=vt}
N 70 -670 490 -670 {
lab=VDD}
N 490 -670 490 -630 {
lab=VDD}
N 220 -600 450 -600 {
lab=IB}
N 420 -600 420 -540 {
lab=IB}
N 1130 -570 1130 -360 {
lab=VOUT}
N 1130 -670 1130 -630 {
lab=VDD}
N 1130 -300 1130 -270 {
lab=VSS}
N 1130 -470 1170 -470 {
lab=VOUT}
N 880 -380 880 -330 {
lab=vr}
N 880 -410 880 -380 {
lab=vr}
N 880 -330 1090 -330 {
lab=vr}
N 970 -600 1090 -600 {
lab=IB}
N 1070 -410 1130 -410 {
lab=VOUT}
N 880 -410 930 -410 {
lab=vr}
N 990 -410 1010 -410 {
lab=#net1}
N 600 -380 880 -380 {
lab=vr}
N 650 -600 970 -600 {
lab=IB}
N 640 -450 670 -450 {
lab=INP}
N 310 -450 340 -450 {
lab=INN}
N 420 -540 650 -540 {
lab=IB}
N 650 -600 650 -540 {
lab=IB}
N 490 -670 1130 -670 {
lab=VDD}
N 600 -270 1130 -270 {
lab=VSS}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Lukas Baumann"}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 620 -450 0 1 {name=MDR
L=1
W=20
nf=1
mult=8
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 600 -450 0 0 {name=l17 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 400 -330 0 1 {name=MMIRL
L=2
W=5
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 380 -330 0 0 {name=l4 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 580 -330 0 0 {name=MMIRR
L=2
W=5
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 600 -330 0 1 {name=l2 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 360 -450 0 0 {name=MDL
L=1
W=20
nf=1
mult=8
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 380 -450 0 1 {name=l3 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 470 -600 0 0 {name=MMIR2
L=2
W=5
nf=1
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 490 -600 0 1 {name=l5 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 200 -600 0 1 {name=MMIR1
L=2
W=5
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
C {devices/lab_pin.sym} 180 -600 0 0 {name=l6 sig_type=std_logic lab=VDD}
C {devices/iopin.sym} 670 -450 2 1 {name=p1 lab=INP

}
C {devices/iopin.sym} 310 -450 2 0 {name=p2 lab=INN

}
C {devices/iopin.sym} 1170 -470 2 1 {name=p3 lab=VOUT

}
C {devices/opin.sym} 70 -540 0 1 {name=p4 lab=IB}
C {devices/iopin.sym} 70 -670 2 0 {name=p5 lab=VDD

}
C {devices/iopin.sym} 70 -270 2 0 {name=p6 lab=VSS
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 1110 -330 0 0 {name=MO
L=2
W=5
nf=1
mult=4
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1110 -600 0 0 {name=MMIR3
L=2
W=5
nf=1
mult=3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 1130 -600 0 1 {name=l7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 1130 -330 0 1 {name=l8 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 960 -410 3 0 {name=R1
W=1.41
L=7
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 960 -390 1 1 {name=l9 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1040 -410 3 0 {name=C1 model=cap_mim_m3_1 W=16 L=30 MF=1 spiceprefix=X}
C {devices/lab_pin.sym} 490 -560 0 1 {name=l10 sig_type=std_logic lab=vt}
C {devices/lab_pin.sym} 380 -400 0 1 {name=l11 sig_type=std_logic lab=vl}
C {devices/lab_pin.sym} 600 -400 0 1 {name=l12 sig_type=std_logic lab=vr}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 120 -160 0 0 {name=MDL1
L=1
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 380 -160 0 1 {name=MDR1
L=1
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
C {devices/lab_pin.sym} 360 -160 0 0 {name=l13 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 360 -130 0 0 {name=l14 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 360 -190 0 0 {name=l15 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 100 -160 0 0 {name=l16 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 140 -190 0 1 {name=l18 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 140 -160 0 1 {name=l19 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 140 -130 0 1 {name=l20 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 400 -160 0 1 {name=l21 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 630 -160 0 1 {name=MMIRL1
L=2
W=5
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 780 -160 0 0 {name=MMIRR1
L=2
W=5
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
C {devices/lab_pin.sym} 800 -130 0 1 {name=l22 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 800 -160 0 1 {name=l23 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 800 -190 0 1 {name=l24 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 650 -160 0 1 {name=l25 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 610 -130 0 0 {name=l26 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 610 -160 0 0 {name=l27 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 610 -190 0 0 {name=l28 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 760 -160 0 0 {name=l29 sig_type=std_logic lab=VSS}
