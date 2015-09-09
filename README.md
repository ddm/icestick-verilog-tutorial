# iCEstick Verilog Tutorial

## Prerequisites

- [IceStorm](http://www.clifford.at/icestorm/)
- [arachne-pnr](https://github.com/cseed/arachne-pnr)
- [Yosys](http://www.clifford.at/yosys/)
- [Icarus Verilog](http://iverilog.icarus.com/)

Tested on OS X and Debian Jessie.

## Simulation

    > simulate.sh

Run `test_bench.v` against `rotate_leds.v` using Icarus Verilog.

`CTRL-C` interrupts the simulation. Type `finish` to exit `iverilog`.

## Flash to iCEstick

    > upload.sh

## Credits
Rotating LEDs Verilog example stolen from [the arachne-pnr project](https://github.com/cseed/arachne-pnr/tree/master/examples/rot).

Pin definitions stolen from [Al Williams](https://github.com/wd5gnr/icestick/blob/master/icestickfull.pcf).
