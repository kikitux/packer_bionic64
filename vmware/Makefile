default: all

all: bionic64.ova

output-bionic64-vmware/bionic64-vmware.vmx: bionic64.json ../scripts/packages.sh http/preseed.cfg
	packer validate bionic64.json
	packer build bionic64.json


bionic64.ova: output-bionic64-vmware/bionic64-vmware.vmx
	"/Applications//VMware Fusion.app/Contents/Library/VMware OVF Tool/ovftool" $< $@

.PHONY: clean
clean:
	-rm -fr output-*/ *.ova
