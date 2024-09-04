v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 530 -450 530 -410 {
lab=vr}
N 530 -410 630 -410 {
lab=vr}
N 410 -610 590 -610 {
lab=vt}
N 1270 -250 1290 -250 {
lab=VSS}
N 570 -610 570 -550 {
lab=vt}
N 1260 -610 1260 -550 {
lab=vt}
N 1260 -610 1290 -610 {
lab=vt}
N 1330 -480 1350 -480 {
lab=VREF}
N 630 -200 1190 -200 {
lab=VSS}
N 370 -220 370 -200 {
lab=VSS}
N 410 -250 430 -250 {
lab=VSS}
N 430 -250 430 -200 {
lab=VSS}
N 630 -320 630 -280 {
lab=#net1}
N 1190 -300 1190 -280 {
lab=#net1}
N 1110 -300 1110 -280 {
lab=#net1}
N 1030 -300 1030 -280 {
lab=#net1}
N 950 -300 950 -280 {
lab=#net1}
N 870 -300 870 -280 {
lab=#net1}
N 790 -300 790 -280 {
lab=#net1}
N 710 -300 710 -280 {
lab=#net1}
N 1190 -220 1190 -200 {
lab=VSS}
N 1110 -220 1110 -200 {
lab=VSS}
N 1030 -220 1030 -200 {
lab=VSS}
N 950 -220 950 -200 {
lab=VSS}
N 870 -220 870 -200 {
lab=VSS}
N 790 -220 790 -200 {
lab=VSS}
N 710 -220 710 -200 {
lab=VSS}
N 630 -220 630 -200 {
lab=VSS}
N 570 -250 590 -250 {
lab=VSS}
N 570 -250 570 -200 {
lab=VSS}
N 670 -250 750 -250 {
lab=VSS}
N 910 -250 990 -250 {
lab=VSS}
N 990 -250 1070 -250 {
lab=VSS}
N 1070 -250 1150 -250 {
lab=VSS}
N 1330 -220 1330 -200 {
lab=VSS}
N 1190 -200 1330 -200 {
lab=VSS}
N 1270 -250 1270 -200 {
lab=VSS}
N 1330 -320 1330 -280 {
lab=#net2}
N 570 -550 1260 -550 {
lab=vt}
N 630 -690 1330 -690 {
lab=VDD}
N 460 -450 460 -430 {
lab=IB}
N 950 -300 1190 -300 {
lab=#net1}
N 590 -250 670 -250 {
lab=VSS}
N 830 -250 910 -250 {
lab=VSS}
N 870 -300 950 -300 {
lab=#net1}
N 630 -300 790 -300 {
lab=#net1}
N 750 -250 830 -250 {
lab=VSS}
N 790 -300 870 -300 {
lab=#net1}
N 490 -450 490 -410 {
lab=vl}
N 370 -410 490 -410 {
lab=vl}
N 310 -430 460 -430 {
lab=IB}
N 50 -200 630 -200 {
lab=VSS}
N 120 -250 120 -200 {
lab=VSS}
N 160 -610 220 -610 {
lab=vt}
N 120 -360 180 -360 {
lab=vsu}
N 220 -550 440 -550 {
lab=vt}
N 440 -610 440 -550 {
lab=vt}
N 220 -330 220 -200 {
lab=VSS}
N 120 -690 120 -640 {
lab=VDD}
N 370 -690 370 -640 {
lab=VDD}
N 630 -690 630 -640 {
lab=VDD}
N 1330 -690 1330 -640 {
lab=VDD}
N 220 -610 220 -550 {
lab=vt}
N 120 -690 630 -690 {
lab=VDD}
N 50 -690 120 -690 {
lab=VDD}
N 510 -610 510 -540 {
lab=vt}
N 120 -580 120 -310 {
lab=vsu}
N 1330 -580 1330 -380 {
lab=VREF}
N 370 -580 370 -530 {
lab=#net3}
N 370 -470 370 -280 {
lab=vl}
N 630 -580 630 -520 {
lab=#net4}
N 630 -460 630 -380 {
lab=vr}
N 220 -550 220 -380 {
lab=vt}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Lukas Baumann"}
C {devices/iopin.sym} 50 -200 2 0 {name=p1 lab=VSS
}
C {devices/iopin.sym} 50 -690 2 0 {name=p2 lab=VDD

}
C {devices/opin.sym} 1350 -480 0 0 {name=p4 lab=VREF}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 390 -610 0 1 {name=MSIT
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
C {devices/lab_pin.sym} 370 -610 0 0 {name=l2 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pnp_05v5.sym} 390 -250 0 1 {name=Q1
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} 610 -250 0 0 {name=Q2
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {bmbgota.sym} 510 -480 3 0 {name=X1}
C {devices/lab_pin.sym} 440 -450 0 0 {name=l4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 560 -450 0 1 {name=l6 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 610 -610 0 0 {name=MSIT1
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
C {devices/lab_pin.sym} 630 -610 0 1 {name=l8 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pnp_05v5.sym} 1310 -250 0 0 {name=Q3
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1310 -610 0 0 {name=MSIT2
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
C {devices/lab_pin.sym} 1330 -610 0 1 {name=l9 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pnp_05v5.sym} 690 -250 0 0 {name=Q4
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} 770 -250 0 0 {name=Q5
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} 850 -250 0 0 {name=Q6
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} 930 -250 0 0 {name=Q7
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} 1010 -250 0 0 {name=Q8
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} 1090 -250 0 0 {name=Q9
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {sky130_fd_pr/pnp_05v5.sym} 1170 -250 0 0 {name=Q10
model=pnp_05v5_W3p40L3p40
spiceprefix=X
}
C {devices/opin.sym} 310 -430 2 0 {name=p3 lab=IB}
C {devices/lab_pin.sym} 630 -430 0 1 {name=l5 sig_type=std_logic lab=vr}
C {devices/lab_pin.sym} 370 -450 0 0 {name=l10 sig_type=std_logic lab=vl}
C {devices/lab_pin.sym} 510 -580 0 0 {name=l11 sig_type=std_logic lab=vt}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 1330 -350 0 0 {name=RREF1
W=1.41
L=67
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 630 -350 0 0 {name=RREF2
W=1.41
L=7
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 610 -350 0 0 {name=l3 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1310 -350 0 0 {name=l14 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/res_xhigh_po_0p69.sym} 120 -280 0 0 {name=RSU
W=0.69
L=203
model=res_xhigh_po_0p69
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 100 -280 0 0 {name=l7 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 140 -610 0 1 {name=MSIT3
L=1
W=20
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 120 -610 0 0 {name=l12 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 200 -360 0 0 {name=MSIT4
L=0.5
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
C {devices/lab_pin.sym} 220 -360 0 1 {name=l17 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 120 -480 0 1 {name=l13 sig_type=std_logic lab=vsu}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 550 -120 0 0 {name=RREF3
W=1.41
L=7
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 750 -120 0 0 {name=RREF4
W=1.41
L=7
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 530 -120 0 0 {name=l15 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 550 -150 0 0 {name=l16 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 550 -90 0 0 {name=l18 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 730 -120 0 0 {name=l19 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 750 -150 0 0 {name=l20 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 750 -90 0 0 {name=l21 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 1430 -120 0 0 {name=RREF5
W=1.41
L=6.7
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 1640 -120 0 0 {name=RREF6
W=1.41
L=6.7
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 1430 -150 0 0 {name=l22 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1410 -120 0 0 {name=l23 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1430 -90 0 0 {name=l24 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1640 -150 0 0 {name=l25 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1620 -120 0 0 {name=l26 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1640 -90 0 0 {name=l27 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 170 -120 0 1 {name=MSIT5
L=1
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
C {devices/lab_pin.sym} 150 -90 0 0 {name=l28 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 150 -120 0 0 {name=l29 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 150 -150 0 0 {name=l30 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 190 -120 0 1 {name=l31 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 330 -120 0 0 {name=MSIT6
L=1
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
C {devices/lab_pin.sym} 350 -120 0 1 {name=l32 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 350 -150 0 1 {name=l33 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 350 -90 0 1 {name=l34 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 310 -120 0 0 {name=l35 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 630 -490 0 0 {name=RREF7
W=1.41
L=21
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 370 -500 0 1 {name=RREF8
W=1.41
L=21
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 610 -490 0 0 {name=l36 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 390 -500 0 1 {name=l37 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 940 -120 0 0 {name=RREF9
W=1.41
L=7
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 1130 -120 0 0 {name=RREF10
W=1.41
L=7
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 1110 -120 0 0 {name=l38 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 920 -120 0 0 {name=l39 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 940 -150 0 0 {name=l40 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 940 -90 0 0 {name=l41 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1130 -150 0 0 {name=l42 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1130 -90 0 0 {name=l43 sig_type=std_logic lab=VSS}
