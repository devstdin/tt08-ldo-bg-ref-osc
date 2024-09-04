v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 280 -290 280 -250 { lab=VDD}
N 280 -190 280 -150 {
lab=ISOURCE}
N 280 -150 290 -150 {
lab=ISOURCE}
N 220 -290 280 -290 {
lab=VDD}
N 220 -220 240 -220 {
lab=VSOURCE}
C {devices/title.sym} 160 -30 0 0 {name=l1 author="Lukas Baumann"}
C {devices/iopin.sym} 220 -290 2 0 {name=p2 lab=VDD

}
C {devices/opin.sym} 290 -150 0 0 {name=p4 lab=ISOURCE}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} 260 -220 0 0 {name=MSOTR
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
C {devices/lab_pin.sym} 280 -220 0 1 {name=l13 sig_type=std_logic lab=VDD}
C {devices/iopin.sym} 220 -220 0 1 {name=p6 lab=VSOURCE}
