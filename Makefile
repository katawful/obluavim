# .PHONY: deps compile
.PHONY: deps compile test

# default: deps compile
default: deps compile test


deps:
	deps/aniseed/scripts/dep.sh Olical aniseed origin/master
	deps/aniseed/scripts/dep.sh katawful katcros-fnl origin/main

compile:
	rm -rf lua/obluavim
	deps/aniseed/scripts/compile.sh
	# compile fennel directly with fennel compiler
	./fennel --compile ./ftplugin/obse.fnl >./ftplugin/obse.lua
	# Remove this if you only want Aniseed at compile time.
	deps/aniseed/scripts/embed.sh aniseed obluavim
	deps/aniseed/scripts/embed.sh katcros-fnl obluavim
	deps/aniseed/scripts/embed.sh aniseed obluavim

test:
	# rm -rf test/lua
	deps/aniseed/scripts/test.sh
