v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 350 -680 470 -680 {
lab=#net1}
N 450 -680 450 -630 {
lab=#net1}
N 450 -630 510 -630 {
lab=#net1}
N 510 -650 510 -580 {
lab=#net1}
N 780 -680 890 -680 {
lab=#net2}
N 800 -680 800 -630 {
lab=#net2}
N 740 -630 800 -630 {
lab=#net2}
N 740 -650 740 -580 {
lab=#net2}
N 1240 -730 1240 -600 {
lab=VDD}
N 930 -730 930 -710 {
lab=VDD}
N 740 -730 740 -710 {
lab=VDD}
N 510 -730 510 -710 {
lab=VDD}
N 310 -730 310 -710 {
lab=VDD}
N 510 -520 510 -500 {
lab=#net3}
N 510 -500 740 -500 {
lab=#net3}
N 740 -520 740 -500 {
lab=#net3}
N 630 -500 630 -450 {
lab=#net3}
N 1240 -390 1240 -260 {
lab=VSS}
N 930 -280 930 -260 {
lab=VSS}
N 310 -280 310 -260 {
lab=VSS}
N 350 -310 390 -310 {
lab=#net4}
N 390 -370 390 -310 {
lab=#net4}
N 310 -370 390 -370 {
lab=#net4}
N 390 -310 890 -310 {
lab=#net4}
N 530 -420 530 -360 {
lab=IB}
N 530 -360 1110 -360 {
lab=IB}
N 1240 -540 1240 -450 {
lab=VOUT}
N 930 -570 1200 -570 {
lab=vot}
N 1240 -490 1300 -490 {
lab=VOUT}
N 50 -730 1240 -730 {
lab=VDD}
N 50 -260 1240 -260 {
lab=VSS}
N 110 -390 110 -260 {
lab=VSS}
N 40 -490 110 -490 {
lab=IB}
N 110 -490 110 -450 {
lab=IB}
N 150 -420 190 -420 {
lab=IB}
N 190 -490 190 -420 {
lab=IB}
N 110 -490 190 -490 {
lab=IB}
N 190 -420 590 -420 {
lab=IB}
N 1110 -360 1180 -360 {
lab=IB}
N 1180 -420 1180 -360 {
lab=IB}
N 1180 -420 1200 -420 {
lab=IB}
N 1050 -520 1100 -520 {
lab=#net5}
N 1160 -520 1240 -520 {
lab=VOUT}
N 440 -550 470 -550 {
lab=INP}
N 780 -550 810 -550 {
lab=INN}
N 930 -650 930 -340 {
lab=vot}
N 310 -650 310 -340 {
lab=#net4}
N 930 -520 990 -520 {
lab=vot}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Lukas Baumann"}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 490 -680 0 0 {name=MMIRL
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
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 760 -680 0 1 {name=MMIRR
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
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 760 -550 0 1 {name=MDR
L=2
W=20
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 490 -550 0 0 {name=MDL
L=2
W=20
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 610 -420 0 0 {name=MMIR2
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 910 -680 0 0 {name=MO
L=2
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 330 -680 0 1 {name=MMIRL1
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
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 330 -310 0 1 {name=MMIRL2
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 910 -310 0 0 {name=MMIR3
L=2
W=20
nf=1
mult=5
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 1220 -570 0 0 {name=MOT
L=0.5
W=20
nf=1
mult=20
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 1220 -420 0 0 {name=MOB
L=2
W=20
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
C {devices/ipin.sym} 40 -490 0 0 {name=p7 lab=IB}
C {devices/iopin.sym} 50 -730 2 0 {name=p8 lab=VDD

}
C {devices/iopin.sym} 50 -260 2 0 {name=p9 lab=VSS
}
C {sky130_fd_pr/cap_mim_m3_1.sym} 1020 -520 1 0 {name=C1 model=cap_mim_m3_1 W=20 L=20 MF=16 spiceprefix=X}
C {devices/lab_pin.sym} 630 -390 0 0 {name=l13 sig_type=std_logic lab=VSS}
C {devices/iopin.sym} 440 -550 0 1 {name=p10 lab=INP

}
C {devices/iopin.sym} 810 -550 0 0 {name=p11 lab=INN

}
C {devices/iopin.sym} 1300 -490 2 1 {name=p12 lab=VOUT

}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 130 -420 0 1 {name=MMIR1
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
C {devices/lab_pin.sym} 110 -420 0 0 {name=l14 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 310 -310 0 0 {name=l15 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1240 -420 0 1 {name=l16 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 930 -310 0 1 {name=l18 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 630 -420 0 1 {name=l19 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 510 -550 0 1 {name=l20 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 740 -550 0 0 {name=l21 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1240 -570 0 1 {name=l22 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 930 -680 0 1 {name=l23 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 510 -680 0 1 {name=l24 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 740 -680 0 0 {name=l25 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 310 -680 0 0 {name=l26 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 1130 -520 1 0 {name=R1
W=1.41
L=2
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 1130 -540 0 0 {name=l2 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 930 -610 0 1 {name=l3 sig_type=std_logic lab=vot}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 330 -830 0 1 {name=MMIRL3
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
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 490 -830 0 0 {name=MMIRL4
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
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_pin.sym} 510 -830 0 1 {name=l4 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 510 -860 0 1 {name=l5 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 510 -800 0 1 {name=l6 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 350 -830 0 1 {name=l7 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 310 -860 0 0 {name=l8 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 310 -830 0 0 {name=l9 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 310 -800 0 0 {name=l10 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 760 -830 0 1 {name=MMIRR1
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
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 910 -830 0 0 {name=MO1
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
model=pfet_g5v0d10v5
spiceprefix=X
}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 910 -170 0 0 {name=MMIR4
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 330 -170 0 1 {name=MMIRL5
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 490 -170 0 0 {name=MDL1
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 760 -170 0 1 {name=MDR1
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
C {devices/lab_pin.sym} 510 -170 0 1 {name=l11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 510 -200 0 1 {name=l12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 510 -140 0 1 {name=l17 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 780 -170 0 1 {name=l27 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 740 -200 0 0 {name=l28 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 740 -170 0 0 {name=l29 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 740 -140 0 0 {name=l30 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 470 -170 0 0 {name=l31 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 350 -170 0 1 {name=l32 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 890 -170 0 0 {name=l33 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 310 -200 0 0 {name=l34 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 310 -170 0 0 {name=l35 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 310 -140 0 0 {name=l36 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 930 -200 0 1 {name=l37 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 930 -170 0 1 {name=l38 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 930 -140 0 1 {name=l39 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 470 -830 0 0 {name=l40 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 780 -830 0 1 {name=l41 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 930 -860 0 1 {name=l42 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 930 -830 0 1 {name=l43 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 930 -800 0 1 {name=l44 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 740 -860 0 0 {name=l45 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 740 -830 0 0 {name=l46 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 740 -800 0 0 {name=l47 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 890 -830 0 0 {name=l48 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 120 -170 0 1 {name=MMIR5
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
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 1220 -170 0 0 {name=MOB1
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
C {devices/lab_pin.sym} 140 -170 0 1 {name=l49 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1240 -200 0 1 {name=l50 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1240 -170 0 1 {name=l51 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1240 -140 0 1 {name=l52 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1200 -170 0 0 {name=l53 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 100 -200 0 0 {name=l54 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 100 -170 0 0 {name=l55 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 100 -140 0 0 {name=l56 sig_type=std_logic lab=VSS}
