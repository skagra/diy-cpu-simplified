# Board Pin Outs

# 8 Bit Bus IN/OUT

|     |     |     |     |
| --- | --- | --- | --- |
| `7` | `6` | `5` | `4` |
| `3` | `2` | `1` | `0` |

# Power

|       |       |
| ----- | ----- |
| `+5V` | `GND` |

# Register (ACC, X and MBR)

## Layout

|          |           |                 |         |
| -------- | --------- | --------------- | ------- |
| `Bus-In` | `Bus-Out` | `Control-Lines` | `Power` |

## Control lines

|       |      |       |
| ----- | ---- | ----- |
| `CLK` | `LD` | `OUT` |

# ALU

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

# P

## Layout

|                 |      |       |         |
| --------------- | ---- | ----- | ------- |
| `Control-Lines` | `In` | `Out` | `Power` |

## Control Lines

|       |       |       |       |     |       |       |       |       |     |        |        |        |        |
| ----- | ----- | ----- | ----- | --- | ----- | ----- | ----- | ----- | --- | ------ | ------ | ------ | ------ |
| *X*   | *X*   | *X*   | `CLK` |     | *X*   | *X*   | *X*   | *X*   |     | *X*    | *X*    | *X*    | *X*    |
| `LD3` | `LD2` | `LD1` | `LD0` |     | `IN3` | `IN2` | `IN1` | `IN0` |     | `OUT3` | `OUT2` | `OUT1` | `OUT0` |

# Zero

## Layout 1

|          |           |         |
| -------- | --------- | ------- |
| `Bus-In` | `Bus-Out` | `Power` |
|          |           | `ZOUT`  |

## Layout 2

|          |        |         |
| -------- | ------ | ------- |
| `Bus-In` | `ZOUT` | `Power` |

# Carry (Fake)

## Layout

|                 |         |
| --------------- | ------- |
| `Control-Lines` | `Power` |

## Control Lines

|          |          |        |
| -------- | -------- | ------ |
| `OP1IN`  | `OP0IN`  | *X*    |
| `OP1OUT` | `OP0OUT` | `COUT` |

# Zero Selection

# MBR

|           |           |            |            |       |
| --------- | --------- | ---------- | ---------- | ----- |
| `LDCDATA` | `LDXDATA` | `OUTCDATA` | `OUTXDATA` | `CLK` |

# Bus Bridge

# Program ROM

# Glossary
