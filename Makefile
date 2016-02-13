TARGET = h264encx
SRC = main.c h264encx.c ve.c
CFLAGS = -Wall -O3
LDFLAGS = -lpthread
LIBS =
CC = gcc

MAKEFLAGS += -rR --no-print-directory

DEP_CFLAGS = -MD -MP -MQ $@

OBJ = $(addsuffix .o,$(basename $(SRC)))
DEP = $(addsuffix .d,$(basename $(SRC)))

.PHONY: clean all

all: $(TARGET)
$(TARGET): $(OBJ)
	$(CC) $(OBJ) $(LIBS) -o $@ $(LDFLAGS) 

clean:
	rm -f $(OBJ)
	rm -f $(DEP)
	rm -f $(TARGET)

%.o: %.c
	$(CC) $(DEP_CFLAGS) $(CFLAGS) -c $< -o $@

include $(wildcard $(DEP))
