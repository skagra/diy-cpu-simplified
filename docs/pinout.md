# Board Pinouts

* [8 Bit Bus](#8-bit-bus)
* [Power](#power)
* [Registers](#registers)
  * [Accumulator](#acc)
  * [X](#x)
  * [MAR](#mar)
* [ALU](#alu)
* [Status Register](#p)
* [Zero](#zero)
* [Carry](#carry)
* [Zero Selection](#zero-selection)
* [MBR](#mbr)
* [Bus Bridge](#bus-bridge)
* [Program ROM](#program-rom)

# 8 Bit Bus 

All 8-bit bus connections have this layout where `0` => LSB and `7` => MSB.

{| class="wikitable" style="margin:auto"
|+ Caption text
|-
! Header text !! Header text !! Header text
|-
| Example || Example || Example
|-
| Example || Example || Example
|-
| Example || Example || Example
|}

| {   |
| --- | --- | --- | --- |
| `7` | `6` | `5` | `4` |
| `3` | `2` | `1` | `0` |
| }   |

# Power

All boards have power connections as follows:

|       |       |
| ----- | ----- |
| `+5V` | `GND` |

# Registers

A common board is used for `ACC` (Accumulator), `X` (X Register) and `MAR` (Memory Address Register).

## Layout

|          |           |                 |         |
| -------- | --------- | --------------- | ------- |
| `Bus-In` | `Bus-Out` | `Control-Lines` | `Power` |

## Control lines

|       |      |       |
| ----- | ---- | ----- |
| `CLK` | `LD` | `OUT` |

## Connections

### ACC

The accumulator.

```
Bus-In  -> CDATA

Bus-Out -> CDATA

CLK     -> CLOCK_OUT 
LD      -> A_LD_CDATA from the Control Unit
OUT     -> A_OUT_CDATA from the Control Unit
```

### X

General purpose `X` register.

```
Bus-In  -> CDATA

Bus-Out -> CDATA

CLK     -> CLOCK_OUT
LD      -> X_LD_CDATA from the Control Unit
OUT     -> X_OUT_CDATA from the Control Unit
```

### MAR

The *Memory Address Register* (`MAR` ) holds the address of data to be retrieved by the CPU from memory.

```
Bus-In  -> CADDR

Bus-Out -> XADDR

CLK     -> CLOCK_OUT
LD      -> MAR_LD_CDATA from the Control Unit
OUT     -> HIGH
```

# ALU

The *Arithmetic Logic Unit* (`ALU`) implements add, subtract, increment and decrement function.

# Layout

|                                 |            |                            |                            |
| ------------------------------- | ---------- | -------------------------- | -------------------------- |
| `A-In-Bus`                      | `B-In-Bus` | `Control-Lines`            | `Power`                    |
|                                 |            | `A-Out-Bus` *(unbuffered)* | `B-Out-Bus` *(unbuffered)* |
| `Result-Out-Bus`                |            |                            |                            |
| `Result-Out-Bus` *(unbuffered)* |            |                            |                            |

## Control Lines

|       |       |       |       |
| ----- | ----- | ----- | ----- |
| `LDA` | `LDB` | `CIN` | *X*   |
| `OP1` | `OP0` | `OUT` | `CLK` |

## Operations

| Operation | OP1 | OP0 |
| --------- | --- | --- |
| `ADD`     | `0` | `0` |
| `SUB`     | `0` | `1` |
| `INC`     | `1` | `0` |
| `DEC`     | `1` | `1` |

## Connections

```
A-Bus-In                    -> CDATA

B-Bus-In                    -> CDATA

A-Out-Bus (unbuffered)      -> N/A

B-Out-Bus (unbuffered)      -> N/A

Result-Out-Bus              -> 

Result-Out-Bus (unbuffered) ->

LDA                         -> ALUA_LD_CDATA
LDB                         -> ALUB_LD_CDATA
CIN                         -> COUT from the carry board
OP1                         -> ALUOP_1 via the carry board
OP0                         -> ALUOP_0 via the carry board
OUT                         -> ALUR_OUT_CDATA
CLK                         -> CLOCK_OUT
```

# P

The status register (`P`) holds up to 4 CPU status flags, currently only a zero `Z` flag is stored.

## Layout

|                 |      |       |         |
| --------------- | ---- | ----- | ------- |
| `Control-Lines` | `In` | `Out` | `Power` |

## Control Lines

|       |       |       |       |     |       |       |       |       |     |        |        |        |        |
| ----- | ----- | ----- | ----- | --- | ----- | ----- | ----- | ----- | --- | ------ | ------ | ------ | ------ |
| *X*   | *X*   | *X*   | `CLK` |     | *X*   | *X*   | *X*   | *X*   |     | *X*    | *X*    | *X*    | *X*    |
| `LD3` | `LD2` | `LD1` | `LD0` |     | `IN3` | `IN2` | `IN1` | `IN0` |     | `OUT3` | `OUT2` | `OUT1` | `OUT0` |

## Connections

```
CLK  -> CLOCK_OUT
LD3  -> N/A
LD2  -> N/A
LD1  -> N/A
LD0  ->

IN3  -> N/A
IN2  -> N/A
IN1  -> N/A
IN0  -> 

OUT3 -> N/A
OUT2 -> N/A
OUT1 -> N/A
OUT0 ->
```

# Zero

The `zero` boards simply test whether an 8 bit input is equal to zero.

There are two slightly different board layouts.

## Layout 1

|          |           |         |
| -------- | --------- | ------- |
| `Bus-In` | `Bus-Out` | `Power` |
|          |           | `ZOUT`  |

## Layout 2

|          |        |         |
| -------- | ------ | ------- |
| `Bus-In` | `ZOUT` | `Power` |

## Connections #1

```
Bus-In  ->

Bus-Out ->

ZOUT    ->
```

## Connections #2

```
Bus-In  ->

Bus-Out ->

ZOUT    ->
```

# Carry

The CPU does not currently have a full implementation of a carry flag.  However the `ALU` requires a carry input for correct operations.   The carry board fakes up a carry flag based on the arithmetic operation - subtraction causes carry to be set.  The board also has a passes through the lines defining the arithmetic operation for easy chaining to the ALU.  

## Layout

|                 |         |
| --------------- | ------- |
| `Control-Lines` | `Power` |

## Control Lines

|          |          |        |
| -------- | -------- | ------ |
| `OP1IN`  | `OP0IN`  | *X*    |
| `OP1OUT` | `OP0OUT` | `COUT` |

## Connections

```
OP1IN  -> ALUOP_1 from the Control Unit
OP0IN  -> ALUOP_0 from the Control Unit
OP1OUT -> OP1 on the ALU board
OP0OUT -> OP0 on the ALU board
COUT   -> CIN on the ALU board
```

# Zero Selection

# MBR

The Memory Buffer Register (`MBR`) holds data to be written memory to or that has been read from memory.

## Layout

|                |                |                  |         |
| -------------- | -------------- | ---------------- | ------- |
| `Bus-In-Out-A` | `Bus-B-In-Out` | `Control-Lines ` | `Power` |
|                |

## Control Lines

|       |       |        |        |       |
| ----- | ----- | ------ | ------ | ----- |
| `LDA` | `LDB` | `OUTA` | `OUTB` | `CLK` |

## Connections

```
Bus-A-In-Out -> CDATA

Bus-B-In-Out -> XDATA

LDA          -> MBR_LD_CDATA from the Control Unit
LDB          -> MBR_LD_XDATA from the Control Unit
OUTA         -> MBR_OUT_DATA from the Control Unit
OUTB         -> MBR_OUT_XDATA from the Control Unit
CLK          -> CLOCK_OUT
```

# Bus Bridge

The *Bus Bridge* allows the `CDATA` bus to be connected to the `CADDR` bus.

## Layout

|          |           |                 |         |
| -------- | --------- | --------------- | ------- |
| `Bus-In` | `Bus-Out` | `Control Lines` | `Power` |

## Control Lines

|       |
| ----- |
| `OUT` |

## Connections

```
Bus-In  -> CDATA

Bus-Out -> CADDR

OUT     -> CDATA_TO_CADDR from the Control Unit
```

# Program ROM

## Layout

## Control Lines

## Connections

# Glossary
