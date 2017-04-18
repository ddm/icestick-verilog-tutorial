RUN := docker run -v ${CURDIR}:/tmp/ dimdm/icetools

default: clean synthesis place_and_route bitstream

clean:
	$(RUN) rm -f rotate.{bin,txt,blif} a.out

synthesis: rotate.v
	$(RUN) yosys -p "synth_ice40 -blif rotate.blif" rotate.v

place_and_route: rotate.blif pins.pcf
	$(RUN) arachne-pnr -d 1k -p pins.pcf rotate.blif -o rotate.txt

bitstream: rotate.txt
	$(RUN) icepack rotate.txt rotate.bin

simulation: rotate.v test.v
	$(RUN) iverilog rotate.v test.v && vvp a.out
