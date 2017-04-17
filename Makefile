default: blif txt bin

blif:
	docker run -v `pwd`:/tmp/ dimdm/icetools yosys -p "synth_ice40 -blif rotate.blif" rotate.v

txt: rotate.blif
	docker run -v `pwd`:/tmp/ dimdm/icetools arachne-pnr -d 1k -p leds.pcf rotate.blif -o rotate.txt

bin: rotate.txt
	docker run -v `pwd`:/tmp/ dimdm/icetools icepack rotate.txt rotate.bin

test: rotate.v test.v
	docker run -v `pwd`:/tmp/ dimdm/icetools iverilog rotate.v test.v && vvp a.out
