# .PHONY: deps compile
.PHONY: deps compile test

# default: deps compile
default: deps compile test


deps:
	scripts/dep.sh Olical aniseed origin/master

compile:
	# rm -rf lua
	deps/aniseed/scripts/compile.sh

	# compile fennel directly with fennel compiler
	./fennel --compile ./ftplugin/obse.fnl >./ftplugin/obse.lua

	# Remove this if you only want Aniseed at compile time.
	deps/aniseed/scripts/embed.sh aniseed obluavim

test:
	# rm -rf test/lua
	deps/aniseed/scripts/test.sh
