#
# Makefile fragment for mips tests
#

TARGETCC=mips-harvard-os161-gcc
TARGETFLAGS=-O2 -Wall -W -Werror -nostdinc -nostdlib \
	-T $T/ldscript -Ttext 0x80000000 -G 0 -fno-pic -mno-abicalls \
        -I$T
SYS161=../build-trace161/trace161
SYS161FLAGS=-tkujtxi -c$T/sys161.conf

T=$S/mipseb/tests

all:
	$(MAKE) check
	$(MAKE) bins
	$(MAKE) run

clean:
	rm -f img-* log-*

check:
	[ -x "$(SYS161)" ]

rules:
	@echo Making rules...
	@(cd $T/src && ls t*.S) | $T/makerules.sh > rules.mk

depend:
	$(MAKE) rules
	$(MAKE) realdepend

realdepend:
	$(TARGETCC) $(TARGETFLAGS) -M $T/src/t*.S |\
	   sed 's/^\([^:]*\).o:/img-\1:/' > depend.mk

include rules.mk
include depend.mk
