all:
	lt-comp lr apertium-tha.tha.dix tha.automorf.bin
	lt-comp rl apertium-tha.tha.dix tha.autogen.bin

clean:
	rm *.bin
