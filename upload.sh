#!/usr/bin/env bash

# See https://stackoverflow.com/questions/28461433/unable-to-open-a-connection-to-an-ftdi-device
if [[ "$OSTYPE" == "darwin"* ]]; then
  sudo kextunload -v -b com.apple.driver.AppleUSBFTDI
  sudo kextunload -v -b com.FTDI.driver.FTDIUSBSerialDriver
fi
yosys -p "synth_ice40 -blif rotate_leds.blif" rotate_leds.v
arachne-pnr -d 1k -p leds.pcf rotate_leds.blif -o rotate_leds.txt
icepack rotate_leds.txt rotate_leds.bin
iceprog rotate_leds.bin
if [[ "$OSTYPE" == "darwin"* ]]; then
  sudo kextload -v -b com.apple.driver.AppleUSBFTDI
  sudo kextload -v -b com.FTDI.driver.FTDIUSBSerialDriver
fi
