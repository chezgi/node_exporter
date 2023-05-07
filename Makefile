GOPKG_BASE=github.com/prometheus/node_exporter
NXVERSION=1.5
GOFLAGS := -ldflags "-s -w -extldflags=-static" -tags osusergo,netgo,sqlite_omit_load_extension
cistore_soodaros=minio/soodar-cistore/soodaros/x86-64
cistore_soodaros_arm64=minio/soodar-cistore/soodaros/aarch64

#--------------------------------------  build
build: force
	mkdir .build/ || true
	go build $(GOFLAGS) -o .build/node_exporter $(GOPKG_BASE)
	GOARCH=arm64 go build $(GOFLAGS) -o .build/node_exporter-aarch64 $(GOPKG_BASE)
	mc cp ./build/node_exporter  $(cistore_soodaros)/node_exporter-$(NXVERSION)
	mc cp ./build/node_exporter-aarch64  $(cistore_soodaros_arm64)/node_exporter-$(NXVERSION)

.PHONY: force
force:


# build -tags: 
# noarp
# nobcache
# nobonding
# noboottime
# nobtrfs
# nobuddyinfo
# noconntrack
# nocpu
# nodevstat
# nodiskstats
# nodrbd
# noedac
# noentropy
# noethtool
# noexec
# nofibrechannel
# nofilefd
# nofilesystem
# nohwmon
# noinfiniband
# nointerrupts
# noipvs
# noksmd
# nokvm
# noloadavg
# nologind
# nomdadm
# nomeminfo
# nomeminfo_numa
# nomountstats
# nonetclass
# nonetdev
# nonetstat
# nonetworkroute
# nonfs
# nonfsd
# nontp
# nonvme
# noperf
# nopowersupplyclass
# nopressure
# noprocesses
# noqdisc
# norapl
# norunit
# noshedstat
# nosockstat
# nosoftnet
# nostat
# nosupervisord
# nosystemd
# notapestats
# notcpstat
# notextfile
# nothermalzone
# notime
# notimex
# noudp_queues
# nouname
# novmstat
# nowifi
# noxfs
# nozfs

