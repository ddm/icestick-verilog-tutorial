#!/usr/bin/env bash

iverilog rotate_leds.v test_bench.v
vvp a.out

