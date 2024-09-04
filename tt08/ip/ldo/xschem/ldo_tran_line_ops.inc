* TRAN_LINE
***********
alter vsupp dc = 4
alter vsupp ac = 0

alter @vsuptran[pwl] = [ 0 0 1u 0 5u 1 10u 1 15u 0 ]

save all

tran 100n 20u

let vout = vldo
let vin = vdd

if MC_RUNS = 0
	if EXIT_NGSPICE = 0
		plot vdd x1.vro x1.vfb
		plot vldo
	end
	
	write ldo_tran_line.raw vout vin
	set appendwrite
end

let line_tran_pp[run] = maximum(vldo)-minimum(vldo)

