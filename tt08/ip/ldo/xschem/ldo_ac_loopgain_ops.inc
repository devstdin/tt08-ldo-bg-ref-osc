* AC_LOOPGAIN
*************
* http://education.ingenazure.com/ac-stability-analysis-ngspice/

alter cload=50p
alter @vloop1[acmag]=1
alter @iloop1[acmag]=0

ac dec 20 0.01 1G

alter cload=50p
alter @vloop1[acmag]=0
alter @iloop1[acmag]=1

ac dec 20 0.01 1G

let ip11 = ac1.i(vloop1)
let ip12 = ac1.i(vloop2)
let ip21 = ac2.i(vloop1)
let ip22 = ac2.i(vloop2)
let vprb1 = ac1.lprobe
let vprb2 = ac2.lprobe

let mb = 1/(vprb1+ip22)-1

let av = 1/(1/(2*(ip11*vprb2-vprb1*ip21)+vprb1+ip21)-1)

*let phase=180/PI*vp(av)
*let phase_mb = 180/PI*vp(mb)
let phase=180/PI*cph(v(av))
let phase_mb = 180/PI*cph(v(mb))

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		*plot vdb(av)
		*plot phase
		*plot vdb(mb)
		*plot phase_mb
		*plot vdb(mb) vdb(av)
		plot vdb(av) phase
	end
	
	write ldo_ac_loop.raw vdb(av) phase
	set appendwrite
end

*meas ac gm_db find vdb(av) when vp(av)=0
meas ac pm_deg find phase when vdb(av)=0
*meas ac 3db_f when phase=135
*meas ac f_0db when vdb(av)=0
*meas ac dc_gain find vdb(av) at=0.01
*meas ac m6dB when vdB(av)=-6

let loop_pm[run] = 180-abs(pm_deg)

