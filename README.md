# DIY CPU Simplified

A version of [DIY CPU](https://github.com/skagra/diy-cpu-meta) simplified to reduce the chip count and bus line count such that it is more straightforward to
implement physically on protoboard.

The repository contains:

* Documentation of [boards/pinouts](docs/boards.md) that make up the physical CPU.
* Designs and emulations of the both with [generic components](designs/generic/) and with [`74HC` ICs](designs/74x/).
* [μcode](ucode) implementing a [subset](docs/implemented.md) of the 6502 instruction set which runs on both the emulated CPU (generic and 74xx) and the physical CPU.  The μcode is assembled using the [μcode-assembler](https://github.com/skagra/diy-cpu-uc-assembler) created for this project. 

Here's a photo of current state of the physical implementation:

![Prototype](docs/Prototype.png)

