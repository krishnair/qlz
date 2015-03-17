CC = gcc
CFLAGS = -c -Wall -DDEBUG -g
LDFLAGS =
CP = cp
COMMON_SOURCES = quicklz.c
COMP_SOURCES = compress_file.c
DECOMP_SOURCES = decompress_file.c 
COMMON_OBJECTS = $(COMMON_SOURCES:.c=.o)
COMP_OBJECTS = $(COMP_SOURCES:.c=.o)
DECOMP_OBJECTS = $(DECOMP_SOURCES:.c=.o)
COMP_EXECUTABLE = qcomp 
DECOMP_EXECUTABLE = qdecomp

.PHONY: all comp decomp 

all: comp decomp

comp: $(COMP_EXECUTABLE)

decomp: $(DECOMP_EXECUTABLE)

$(COMP_EXECUTABLE): $(COMMON_OBJECTS) $(COMP_OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

$(DECOMP_EXECUTABLE): $(COMMON_OBJECTS) $(DECOMP_OBJECTS)
	$(CC) $(LDFLAGS) $^ -o $@

.c.o:
	$(CC) $(CFLAGS) $< -o $@

install: all
	sudo $(CP) $(COMP_EXECUTABLE) /usr/bin
	sudo $(CP) $(DECOMP_EXECUTABLE) /usr/bin

clean: 
	rm $(COMP_EXECUTABLE) $(DECOMP_EXECUTABLE) *.o
