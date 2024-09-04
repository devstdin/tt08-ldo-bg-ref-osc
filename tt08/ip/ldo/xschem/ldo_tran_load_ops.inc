* TRAN_LOAD
***********

alter @iltran[pwl] = [ 0 0 1u 0 5u 200e-6 10u 200e-6 15u 0 ]

save all

tran 100n 20u

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		*plot vdd x1.vro x1.vfb
		*plot viload#branch
		plot vldo
	end
	
	write ldo_tran_load.raw vldo vdd
	set appendwrite
end

let load_tran_pp[run] = maximum(vldo)-minimum(vldo)

