.DEFAULT_GOAL:=all

CC?=clang

change-extension: change-extension.c
	$(CC) -g -o $@ $<

tests: clean change-extension
	bash test.bash

clean:
	rm -rf change-extension

.PHONY: all
all: tests
