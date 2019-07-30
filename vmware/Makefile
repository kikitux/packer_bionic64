
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	OVFTOOL=ovftool
endif
ifeq ($(UNAME_S),Darwin)
	OVFTOOL="/Applications//VMware Fusion.app/Contents/Library/VMware OVF Tool/ovftool"
endif

TEMPLATES := $(wildcard bionic64-*.json)
#OUTPUTS := $(TEMPLATES:.json=)
OVAS := $(TEMPLATES:.json=.ova)

all: $(OVAS)
.PHONY: all
default: all

#vpath %.vmx $(OUTPUTS)
#vpath %.sh ../scripts

output-bionic64-vmware/bionic64.vmx: bionic64.json ../scripts/packages.sh http/preseed.cfg
	-rm -fr output-bionic64-vmware
	packer validate bionic64.json
	packer build bionic64.json

%.ova: %.json output-bionic64-vmware/bionic64.vmx
	@-rm -fr output-$(basename $@)/
	packer validate $<
	packer build $<
	@-rm $@
	$(OVFTOOL) output-$(basename $@)/$(basename $@).vmx $@
	-rm -fr output-$(basename $@)/

kitchen: output-bionic64-vmware/bionic64.vmx bionic64-client/bionic64-client.vmx 
	bundle exec kitchen test

.PHONY: clean cleanall echovar

clean:
	-rm -fr $(OUTPUTS)
	-rm $(OVAS)

cleanall:
	-rm -fr output-*/ *.ova


echovar:
	echo $(TEMPLATES)
	echo $(OUTPUTS)
	echo $(OVAS)
	echo $(OVFTOOL)
