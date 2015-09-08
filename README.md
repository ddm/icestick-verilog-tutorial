# iCEstick Verilog Tutorial

## Prerequisites

Tested on OS X and Debian Jessie.

- [IceStorm](http://www.clifford.at/icestorm/)
- [arachne-pnr](https://github.com/cseed/arachne-pnr)
- [Yosys](http://www.clifford.at/yosys/)
- [Icarus Verilog](http://iverilog.icarus.com/)

## Simulation

    > simulate.sh

Run `test_bench.v` against `rotate_leds.v` using Icarus Verilog].

`CTRL-C` interrupts the simulation. Type `finish` to exit `iverilog`.

## Flash to iCEstick

    > upload.sh

## Credits
Rotating LEDs Verilog example stolen from [the arachne-pnr project](https://github.com/cseed/arachne-pnr/tree/master/examples/rot).


