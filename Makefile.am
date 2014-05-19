###############################################################################
## Makefile for apertium-tha
###############################################################################

RELEASE=0.1
VERSION=0.1.0
LANG1=tha
BASENAME=apertium-$(LANG1)

TARGETS_COMMON = $(LANG1).automorf.bin $(LANG1).autogen.bin \
	$(LANG1).automorf.att.gz $(LANG1).autogen.att.gz \
        $(LANG1).rlx.bin

# This include defines goals for install-modes, .deps/.d and .mode files:
@ap_include@

###############################################################################
## Thai transducer
###############################################################################

$(LANG1).autogen.bin: $(BASENAME).$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp rl $< $@

$(LANG1).automorf.bin: $(BASENAME).$(LANG1).dix
	apertium-validate-dictionary $<
	lt-comp lr $< $@

$(LANG1).autogen.att.gz: $(LANG1).autogen.bin
	lt-print $< | gzip -9 -c > $@

$(LANG1).automorf.att.gz: $(LANG1).automorf.bin
	lt-print $< | gzip -9 -c > $@

###############################################################################
## Disambiguation rules
###############################################################################

$(LANG1).rlx.bin: $(BASENAME).$(LANG1).rlx
	cg-comp $< $@

###############################################################################
## Distribution
###############################################################################
EXTRA_DIST=$(BASENAME).$(LANG1).dix \
           $(BASENAME).$(LANG1).rlx \
	   modes.xml

###############################################################################
## Installation stuff
###############################################################################
#
#   apertium_tha_libdir: This is where the compiled binaries go
#   apertium_tha_srcdir: This is where the source files go

apertium_thadir=$(prefix)/lib/apertium/$(BASENAME)/
apertium_tha_srcdir=$(prefix)/share/apertium/$(BASENAME)/

apertium_tha_DATA=$(TARGETS_COMMON)

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = $(BASENAME).pc

noinst_DATA=modes/$(LANG1)-morph.mode

install-data-local: install-modes
	test -d $(DESTDIR)$(apertium_tha_srcdir) || mkdir -p $(DESTDIR)$(apertium_tha_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).dix $(DESTDIR)$(apertium_tha_srcdir)
	$(INSTALL_DATA) $(BASENAME).$(LANG1).rlx $(DESTDIR)$(apertium_nob_srcdir)

CLEANFILES = $(TARGETS_COMMON)
clean-local:
	-rm -rf .deps modes