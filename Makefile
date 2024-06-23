# Compiler flags
CFLAGS = -O3 -static -Iraylib/src -Iraygui/src -Lraylib/src -lraylib -Wall -Wextra -Wpedantic
CFLAGS_RELEASE := -s

# Detect operating system
# TODO: add logic for debug mode to remove -mwindows
ifeq ($(OS),Windows_NT)
    CFLAGS +=  -lgdi32 -lwinmm
	CFLAGS_RELEASE += -mwindows
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Linux)
        CFLAGS += 
    endif
    ifeq ($(UNAME_S),Darwin)
        CFLAGS += 
    endif
endif

# Target for raylib
raylib: raylib/src/libraylib.a

# Check for libraylib.a existence and build if not found
raylib/src/libraylib.a:
	@echo [libraylib.a not found. building...]
	cd raylib/src && make

# Main targets
all: release

# Asset Packer
assetpack: raylib
	gcc assetpack.c -o assetpack $(CFLAGS)

# Target for game
debug: raylib
	@echo [debug mode]
	gcc main.c -o bin/UltimatePong $(CFLAGS) -DDEBUG=1

release: raylib
	@echo [release mode]
	gcc main.c -o bin/UltimatePong $(CFLAGS) $(CFLAGS_RELEASE)

# Clean up build files
clean:
	@echo [clean]
	rm -f bin/editor bin/TacticalToiletSimulator1998
	cd raylib/src && make clean

run:
	./bin/UltimatePong

# Phony targets to prevent conflicts with files named 'all', 'clean', etc.
.PHONY: all editor game clean raylib