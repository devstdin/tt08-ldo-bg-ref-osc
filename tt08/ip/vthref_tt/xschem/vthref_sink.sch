v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 290 -330 290 -290 { lab=vm2}
N 290 -230 290 -140 { lab=VSS}
N 230 -360 250 -360 {
lab=VSINKT}
N 230 -260 250 -260 {
lab=VSINKB}
N 290 -430 290 -390 {
lab=ISINK}
N 290 -430 300 -430 {
lab=ISINK}
N 230 -140 290 -140 {
lab=VSS}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Lukas Baumann"}
C {devices/iopin.sym} 230 -140 2 0 {name=p1 lab=VSS
}
C {devices/ipin.sym} 300 -430 2 0 {name=p3 lab=ISINK}
C {sky130_fd_pr/nfet_g5v0d10v5.sym} 270 -360 0 0 {name=MMCB2
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
C {devices/lab_pin.sym} 290 -360 0 1 {name=l10 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 290 -260 0 1 {name=l20 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 270 -260 0 0 {name=MMB2
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
C {devices/lab_wire.sym} 290 -320 0 0 {name=l8 sig_type=std_logic lab=vm2}
C {devices/iopin.sym} 230 -360 0 1 {name=p7 lab=VSINKT}
C {devices/iopin.sym} 230 -260 0 1 {name=p8 lab=VSINKB}
