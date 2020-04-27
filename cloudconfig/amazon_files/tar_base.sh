#!/bin/bash

cd /
rm -f base.tar.gz
tar -czpf base.tar.gz \
	/etc/ssh/sshd_config \
	/root/.ssh/authorized_keys \
	/root/.config/mc/ini \
	/root/.config/mc/panels.ini



