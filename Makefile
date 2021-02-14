TARGETS := $(shell ls scripts | grep -vE 'clean')

.dapper:
	cp _/dapper .dapper

$(TARGETS): .dapper
	./.dapper $@ 2>&1 | tee $@.log

shell-bind: .dapper
	./.dapper -m bind -s

kernel-config: .dapper
	./.dapper config-kernel

clean:
	@./scripts/clean

.DEFAULT_GOAL := ci

.PHONY: $(TARGETS)
