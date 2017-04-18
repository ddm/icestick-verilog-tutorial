DOCKER_RUN := docker run -v ${CURDIR}:/tmp/ dimdm/icetools

default: clean blif txt bin

clean:
	$(DOCKER_RUN) rm -f rotate.{bin,txt,blif} a.out

blif: rotate.v
	$(DOCKER_RUN) yosys -p "synth_ice40 -blif rotate.blif" rotate.v

txt: rotate.blif leds.pcf
	$(DOCKER_RUN) arachne-pnr -d 1k -p leds.pcf rotate.blif -o rotate.txt

bin: rotate.txt
	$(DOCKER_RUN) icepack rotate.txt rotate.bin

test: rotate.v test.v
	$(DOCKER_RUN) iverilog rotate.v test.v && vvp a.out
