## Local definitions for the project. Adapt to your own project.
LIBDIR		:= myLib
TOP		:= g1_sim
TAGSDIR		:= .tags
SYNSRC		:= g1.vhd
SYNTOP		:= g1

help:
	@echo '"make" does intentionally nothing. Type:'
	@echo '  "make help" to see this help message'
	@echo '  "make all" to compile all the VHDL source files'
	@echo '  "make sim" to compile and simulate in batch mode'
	@echo '  "make simi" to compile and simulate interactively'
	@echo '  "make syn" to synthesize and generate reports'
	@echo '  "make gui" to launch the Design Compiler GUI (and synthesize first if needed)'
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
SYN		:= dc_shell
SYNFLAGS	:= -x 'source ../syn.tcl'
GUIFLAGS	:= -x 'source ../gui.tcl'

.PHONY: help all sim simi syn gui clean

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

syn: $(SYNTOP).dc-syn/$(SYNTOP).v

gui: syn gui.tcl
	cd $(SYNTOP).dc-syn; \
	$(SYN) $(GUIFLAGS)

$(SYNTOP).dc-syn/$(SYNTOP).v: $(SYNSRC) syn.tcl
	@stamp=`date +'%s'`; \
	syndir="$(SYNTOP).dc-syn.$$stamp"; \
	mkdir $$syndir; \
	cd $$syndir; \
	$(SYN) $(SYNFLAGS); \
	cd ..; \
	syndir_link="$(SYNTOP).dc-syn"; \
	rm -f $$syndir_link; \
	ln -s $$syndir $$syndir_link; \
	echo "--------------------------------------------------------------------------------"; \
	echo "Results stored in $$syndir (linked to $$syndir_link)"; \
	echo "--------------------------------------------------------------------------------"

## Cleaning target.
clean:
	rm -rf $(TAGSDIR) $(CONFIG) $(LIBDIR) transcript vsim.wlf
	rm -rf *~ $(SYNTOP).dc-syn $(SYNTOP).dc-syn.*
