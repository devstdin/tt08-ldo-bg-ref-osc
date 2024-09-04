* TRAN_THD_OPS
**************
alter vsupp dc = 3
alter vsupp ac = 0
alter vsupn dc = 3
alter vsupn ac = 0
alter vinnac ac = 0
alter vinndc dc = 0
alter vinpac ac = 0
alter vinpdc dc = 0
alter rinn resistance = 100e12
alter rinn ac = 100e12
alter rcm resistance = 100e12
alter rcm ac = 100e12
alter rfb resistance = 0
alter rfb ac = 0.01
alter @vinpdc[sin] = [ 0.0 1.0 100e3 0.0 0.0 0.0  ]

save all
tran 1n 100u
fourier 100e3 opout

* https://sourceforge.net/p/ngspice/discussion/133842/thread/a115d95a92/ - Frank Cornelis - 2021-12-02 
let idx = 2
let sum_mag_square = 0
let fourier_run = run+1
while idx < 10
	let mag = fourier{$&fourier_run}1[1][idx]
	let sum_mag_square = sum_mag_square + mag * mag
	let idx = idx + 1
end
let root_sum_mag_square = sqrt(sum_mag_square)
let m_thd = root_sum_mag_square / fourier{$&fourier_run}1[1][1] * 100

if MC_RUNS = 0
	print m_thd
	if EXIT_NGSPICE = 0
		plot vinp opout
	end
end

let thd[run] = m_thd

