include ../build-conf/vars.mk
include ../build-conf/rules.mk

TARGETS = $(BIN)/simple.bin $(BIN)/board.bin $(BIN)/test.bin

all: all-asm

all-asm: $(BIN) $(TARGETS)

bin: 
	mkdir $(BIN)

clean:
	rmdir /S /Q $(BIN)