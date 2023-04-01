# DIY CPU Simplified

A version of [DIY CPU](https://github.com/skagra/diy-cpu-meta) simplified to reduce the chip count and bus line count such that it is more straightforward to
implement physically on protoboard.

This repository contains:

* Documentation of [boards/pinouts](docs/boards.md) that make up the physical CPU.
* Designs and emulations using both [generic components](designs/generic/) and [`74HC` ICs](designs/74x/).
* [μcode](ucode) implementing a [subset](docs/implemented.md) of the 6502 instruction set which runs on both the emulated CPU (generic and 74xx) and the physical CPU.  The μcode is assembled using the [μcode-assembler](https://github.com/skagra/diy-cpu-uc-assembler) created for this project. 

Here's a photo showing the current, almost completed, physical implementation:

![Prototype](docs/Prototype.png)

Running this code:

```Assembly
            PROCESSOR 6502

POST1 = $FC
POST2 = $FD
MSG = $FE

; Code
            SEG entry
            ORG $00

; Main routine
main:       

; Zero out display values
            LDA #$00
            STA POST1
            STA POST2

; Register loading
            LDA #$50
            LDX #$22
            LDA #$00
            LDX #$00

; Register transfer
            LDA #$67
            TAX
            LDX #$56
            TXA

; Arithmetic
            LDA #$27
            ADC #$23 ; Result $4A
            STA POST1
            LDA #$69
            SBC #$33 ; Result $36
            STA POST2

; Looping BEQ
            LDX #$05
.nextbeq:   DEX
            BEQ .beqdone
            JMP .nextbeq
.beqdone

; Looping BNE
            LDX #$05
.nextbne:   DEX
            BNE .nextbne

; Indexed addressing and message out
            LDX #0
.nextbye:   LDA hello,X
            BEQ .halt
            STA MSG
            INX 
            JMP .nextbye
; Halt
.halt:      DC.B    0

hello:      DC    "Goodbye World! " 
            DC.B  0
```