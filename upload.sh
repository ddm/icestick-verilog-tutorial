#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  sudo kextunload -v -b com.apple.driver.AppleUSBFTDI
fi
yosys -p "synth_ice40 -blif rotate_leds.blif" rotate_leds.v
arachne-pnr -d 1k -p leds.pcf rotate_leds.blif -o rotate_leds.txt
icepack rotate_leds.txt rotate_leds.bin
iceprog rotate_leds.bin
if [[ "$OSTYPE" == "darwin"* ]]; then
  sudo kextload -v -b com.apple.driver.AppleUSBFTDI
fi
