MAKEFLAGS = --no-builtin-rules --no-builtin-variables --always-make
.DEFAULT_GOAL := help

SHELL  = /usr/bin/env bash

alp:
	#sudo alp -r --sum --limit=1000 -f $(file) --aggregates "/iine\S+,/photo\S+,/tag\S+,/article\S+,/member\S+,/update\S+,/profileupdate\S+"
	sudo alp -r --sum --limit=1000 -f $(file)

restart:
	sh scripts/restart.sh

rotate:
	sh scripts/rotate_alplog.sh

bench:
	cd bench && ./bench -remotes localhost:80
