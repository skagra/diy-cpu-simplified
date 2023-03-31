            PROCESSOR 6502

POST1 = $FC
POST2 = $FD
MSG = $FE

; Code
            SEG entry
            ORG $00

; Main routine
main:       

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

; Indexed addressing
            LDX #0
.nexthel:   LDA hello,X
            BEQ .donehel
            STA MSG
            INX 
            JMP .nexthel
.donehel:   DC.B    0

hello:      DC    "Goodbye" 
            DC.B  0