
TOPTARGETS := all clean

SUBDIRS := ucode examples

$(TOPTARGETS): $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
	
.PHONY: $(TOPTARGETS) $(SUBDIRS)