folders = $(shell find . -name main.rs | xargs -n1 dirname | sed 's|^\./||')
executables = $(patsubst %, %/main, $(folders))

.PHONY: no_default $(folders) $(debug_targets)
no_default:

$(folders): %:%/main
	@ if [ -f $@/input ]; then cat $@/input | $@/main; else $@/main; fi

$(executables): %:%.rs
	@ rustc $@.rs -g -o $@
