## Local definitions for the project. Adapt to your own project.
LIBDIR		:= myLib
TOP		:= g1_sim
TAGSDIR		:= .tags

help:
	@echo '"make" does intentionally nothing. Type:'
	@echo '  "make help" to see this help message'
	@echo '  "make all" to compile all the VHDL source files'
	@echo '  "make sim" to compile and simulate in batch mode'
	@echo '  "make simi" to compile and simulate interactively'
	@echo '  "make clean" to remove the generated files and restore the original distribution'

## Dependencies of the project. If file foo.vhd depends on file bar.vhd (that
## is, bar.vhd must be compiled before foo.vhd), add a line:
## $(TAGSDIR)/foo.tag: $(TAGSDIR)/bar.tag
## If foo.vhd depends on several files bar1.vhd and bar2.vhd, add a line:
## $(TAGSDIR)/foo.tag: $(TAGSDIR)/bar1.tag $(TAGSDIR)/bar2.tag
$(TAGSDIR)/g1_sim.tag: $(TAGSDIR)/g1.tag

## Standard definitions. You shouldn't need to edit anything below this line,
## unless you have a very good reason and you know exactly what you're doing.
MKLIB		:= vlib
MAP		:= vmap
CONFIG		:= modelsim.ini
COM		:= vcom
COMFLAGS	:= -ignoredefaultbinding -pedanticerrors -O0
SIM		:= vsim
SIMFLAGS	:=
SRCS		:= $(wildcard *.vhd)
TAGS		:= $(patsubst %.vhd,$(TAGSDIR)/%.tag,$(SRCS))

.PHONY: help all sim simi clean

all: $(TAGSDIR)/$(TOP).tag

simi: SIMFLAGS += -do "add wave /*; run -all"
simi: $(TAGSDIR)/$(TOP).tag
	$(SIM) $(SIMFLAGS) $(TOP)

sim: SIMFLAGS += -c -do "run -all; quit"
sim: $(TAGSDIR)/$(TOP).tag
	$(SIM) $(SIMFLAGS) $(TOP)

$(CONFIG):
	$(MKLIB) $(LIBDIR); \
	$(MAP) WORK $(LIBDIR); \
	mkdir -p $(TAGSDIR)

$(TAGSDIR)/%.tag: %.vhd $(CONFIG)
	$(COM) $(COMFLAGS) $<; \
	touch $@

## Cleaning target.
clean:
	rm -rf $(TAGSDIR) $(CONFIG) $(LIBDIR) transcript vsim.wlf
