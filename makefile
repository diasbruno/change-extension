.DEFAULT_GOAL:=all

CC?=clang

DEST=/usr/local/bin

PROJECT=change-extension

$(PROJECT): $(PROJECT).c
	$(CC) -g -o $@ $<

tests: clean $(PROJECT)
	bash test.bash

clean:
	rm -rf $(PROJECT)

install:
	install -m0555 $(PROJECT) $(DEST)

.PHONY: all
all: tests
