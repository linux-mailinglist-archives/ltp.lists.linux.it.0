Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F629B7F8A
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2024 17:01:41 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DE80C3CC3B2
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2024 17:01:40 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1DB713CC36E
 for <ltp@lists.linux.it>; Thu, 31 Oct 2024 17:01:13 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 2A62F1A007AB
 for <ltp@lists.linux.it>; Thu, 31 Oct 2024 17:01:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5324221CDA;
 Thu, 31 Oct 2024 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730390471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tRtkMZ2i9ChgzdboYaCmVLq9DgOXLoAaFiHWw8TeRA=;
 b=NeuqgSJG34o+FVd9/l0LYA7vTCky2taFXfwAI6J5AeqLFcQIUfJT02hm2Tg20SupsvHHj4
 2HIzk36sM5fqjAAuUyoK9n0uXGoG6G8AD424dhX+/VvPEUXgIs3YvqHav13CK42aIO4TFg
 n4IbnaXLryqVvO8XNVmlMI5G72BL1P4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730390471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tRtkMZ2i9ChgzdboYaCmVLq9DgOXLoAaFiHWw8TeRA=;
 b=Eq8HR6r6cSDVTWBqg4osBm4c1JVQ/z1X9OuWV4ogMA79ko/jeJa9VYrBCP1TbxpNSwShgy
 K4EgPB+Li3VJWiBg==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NeuqgSJG;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Eq8HR6r6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730390471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tRtkMZ2i9ChgzdboYaCmVLq9DgOXLoAaFiHWw8TeRA=;
 b=NeuqgSJG34o+FVd9/l0LYA7vTCky2taFXfwAI6J5AeqLFcQIUfJT02hm2Tg20SupsvHHj4
 2HIzk36sM5fqjAAuUyoK9n0uXGoG6G8AD424dhX+/VvPEUXgIs3YvqHav13CK42aIO4TFg
 n4IbnaXLryqVvO8XNVmlMI5G72BL1P4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730390471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/tRtkMZ2i9ChgzdboYaCmVLq9DgOXLoAaFiHWw8TeRA=;
 b=Eq8HR6r6cSDVTWBqg4osBm4c1JVQ/z1X9OuWV4ogMA79ko/jeJa9VYrBCP1TbxpNSwShgy
 K4EgPB+Li3VJWiBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1C1BC13A53;
 Thu, 31 Oct 2024 16:01:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id KNgyBMepI2eNLAAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 31 Oct 2024 16:01:11 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Thu, 31 Oct 2024 17:01:08 +0100
MIME-Version: 1.0
Message-Id: <20241031-generate_syscalls-v8-2-8e35a9d6783b@suse.com>
References: <20241031-generate_syscalls-v8-0-8e35a9d6783b@suse.com>
In-Reply-To: <20241031-generate_syscalls-v8-0-8e35a9d6783b@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730390470; l=8240;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=gII/U+XXh0j+9NpVoxV9uIay1M59y6YrHtbAjmp2oQk=;
 b=45vCpRwjE3y3dhhFU+YGFhR8x7U7h2/HEhUJr9qkzO7hZ2sv2tXkd5Cz2Mu1WkhmDJywGGZEO
 Ct4sdLPqoiSCR4xs2OvPRW/irRHl5+EMO+8qaP3Vswn8YNCyB51Jw19
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Rspamd-Queue-Id: 5324221CDA
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FROM_HAS_DN(0.00)[];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; TO_DN_SOME(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 RCPT_COUNT_THREE(0.00)[4];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v8 2/4] Add script to generate arch(s) dependant
 syscalls
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

From: Andrea Cervesato <andrea.cervesato@suse.com>

Add generate_arch.sh script which can be used to generate arch(s)
dependant syscalls file. The way it works is pretty simple: for each
architecture defined into supported-arch.txt, compile kernel headers,
extract the list of syscalls and generate a .in file containing all of
them, associated with their own syscall's number.
The way syscalls files are generated, passes through a C application
which is automatically checking the availability of the syscalls in
the user space environment.

Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 include/lapi/syscalls/{aarch64.in => arm64.in}     |   0
 include/lapi/syscalls/generate_arch.sh             | 206 +++++++++++++++++++++
 .../lapi/syscalls/{loongarch.in => loongarch64.in} |   0
 include/lapi/syscalls/{mips_n64.in => mips64.in}   |   0
 .../lapi/syscalls/{mips_n32.in => mips64n32.in}    |   0
 include/lapi/syscalls/{mips_o32.in => mipso32.in}  |   0
 include/lapi/syscalls/{hppa.in => parisc.in}       |   0
 include/lapi/syscalls/supported-arch.txt           |  12 +-
 8 files changed, 212 insertions(+), 6 deletions(-)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/arm64.in
similarity index 100%
rename from include/lapi/syscalls/aarch64.in
rename to include/lapi/syscalls/arm64.in
diff --git a/include/lapi/syscalls/generate_arch.sh b/include/lapi/syscalls/generate_arch.sh
new file mode 100755
index 0000000000000000000000000000000000000000..e4daf6b40b6d5fa554f7abd544ed2f4a53e7d283
--- /dev/null
+++ b/include/lapi/syscalls/generate_arch.sh
@@ -0,0 +1,206 @@
+#!/bin/sh -eu
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# This is an adaptation of the update-tables.sh script, included in the
+# syscalls-table project (https://github.com/hrw/syscalls-table) and released
+# under the MIT license.
+#
+# Author: Andrea Cervesato <andrea.cervesato@suse.com>
+
+if [ "$#" -eq "0" ]; then
+	echo "Please provide kernel sources:"
+	echo ""
+	echo "$0 path/to/Linux/kernel/sources"
+	echo ""
+	exit 1
+fi
+
+KERNELSRC="$1"
+
+# to keep sorting in order
+export LC_ALL=C
+
+if [ ! -d "$KERNELSRC" ]; then
+	echo "$KERNELSRC is not a directory"
+	exit 1
+fi
+
+if [ ! -e "${KERNELSRC}/Makefile" ]; then
+	echo "No Makefile in $KERNELSRC directory"
+	exit 1
+fi
+
+TEMP="$(mktemp -d)"
+KVER="$(make -C ${KERNELSRC} kernelversion -s)"
+
+SCRIPT_DIR="$(realpath $(dirname "$0"))"
+SUPPORTED_ARCH="${SCRIPT_DIR}/supported-arch.txt"
+LINUX_HEADERS="${TEMP}/headers"
+
+grab_syscall_names_from_tables() {
+	for tbl_file in $(find ${KERNELSRC}/arch -name syscall*.tbl); do
+		grep -E -v "(^#|^$|sys_ni_syscall)" $tbl_file |
+			awk '{ print $3 }' >>${TEMP}/syscall-names.tosort
+	done
+
+	drop_bad_entries
+}
+
+grab_syscall_names_from_unistd_h() {
+	grep -E -h "^#define __NR_" \
+		${LINUX_HEADERS}/usr/include/asm/unistd*.h \
+		${LINUX_HEADERS}/usr/include/asm-generic/unistd.h \
+		>${TEMP}/syscall-names.tosort
+
+	drop_bad_entries
+}
+
+drop_bad_entries() {
+	grep -E -v "(unistd.h|NR3264|__NR_syscall|__SC_COMP|__NR_.*Linux|__NR_FAST)" \
+		${TEMP}/syscall-names.tosort |
+		grep -E -v "(__SYSCALL|SYSCALL_BASE|SYSCALL_MASK)" |
+		sed -e "s/#define\s*__NR_//g" -e "s/\s.*//g" |
+		sort -u >${TEMP}/syscall-names.txt
+}
+
+generate_table() {
+	echo "- $arch"
+
+	if [ "$bits" -eq "32" ]; then
+		extraflags="${extraflags} -D__BITS_PER_LONG=32"
+	fi
+
+	local uppercase_arch=$(echo "$arch" | tr '[:lower:]' '[:upper:]')
+
+	# ignore any error generated by gcc. We want to obtain all the
+	# available architecture syscalls for the current platform and to handle
+	# only supported architectures later on
+	gcc ${TEMP}/list-syscalls.c -U__LP64__ -U__ILP32__ -U__i386__ \
+		-D${uppercase_arch} \
+		-D__${arch}__ ${extraflags} \
+		-I ${LINUX_HEADERS}/usr/include/ \
+		-o ${TEMP}/list-syscalls || true
+
+	${TEMP}/list-syscalls >"${TEMP}/${arch}.in.tosort"
+
+	sort -k2,2n "${TEMP}/${arch}.in.tosort" >"${TEMP}/${arch}.in"
+}
+
+generate_list_syscalls_c() {
+	(
+		echo
+		echo "
+		#include <stdio.h>
+		#include <asm/unistd.h>
+
+		int main(void)
+		{
+		"
+		for syscall in $(cat ${TEMP}/syscall-names.txt); do
+			echo "
+		#ifdef __NR_$syscall
+			printf(\"$syscall %d\\\n\", __NR_$syscall);
+		#endif
+		"
+		done
+		echo " return 0;
+		}"
+	) >${TEMP}/list-syscalls.c
+}
+
+export_headers() {
+	make -s -C ${KERNELSRC} ARCH=${arch} O=${LINUX_HEADERS} \
+		headers_install >/dev/null 2>&1
+}
+
+do_all_tables() {
+	for archdir in ${KERNELSRC}/arch/*; do
+		arch=$(basename $archdir)
+
+		bits=64
+		extraflags=
+
+		case ${arch} in
+		Kconfig)
+			continue
+			;;
+		um)
+			continue
+			;;
+		esac
+
+		export_headers
+		grab_syscall_names_from_unistd_h
+
+		case ${arch} in
+		arm)
+			bits=32
+			arch=armoabi extraflags= generate_table
+			arch=arm extraflags=-D__ARM_EABI__ generate_table
+			;;
+		loongarch)
+			# 32-bit variant of loongarch may appear
+			arch=loongarch64 extraflags=-D_LOONGARCH_SZLONG=64 generate_table
+			;;
+		mips)
+			arch=mips64 extraflags=-D_MIPS_SIM=_MIPS_SIM_ABI64 generate_table
+			bits=32
+			arch=mipso32 extraflags=-D_MIPS_SIM=_MIPS_SIM_ABI32 generate_table
+			arch=mips64n32 extraflags=-D_MIPS_SIM=_MIPS_SIM_NABI32 generate_table
+			;;
+		powerpc)
+			generate_table
+			arch=powerpc64 generate_table
+			;;
+		riscv)
+			arch=riscv64 extraflags=-D__LP64__ generate_table
+			bits=32
+			arch=riscv32 extraflags=-D__SIZEOF_POINTER__=4 generate_table
+			;;
+		s390)
+			bits=32
+			generate_table
+			bits=64
+			arch=s390x generate_table
+			;;
+		sparc)
+			bits=32
+			extraflags=-D__32bit_syscall_numbers__ generate_table
+			bits=64
+			arch=sparc64 extraflags=-D__arch64__ generate_table
+			;;
+		x86)
+			arch=x86_64 extraflags=-D__LP64__ generate_table
+			bits=32
+			arch=i386 generate_table
+			arch=x32 extraflags=-D__ILP32__ generate_table
+			;;
+		arc | csky | hexagon | m68k | microblaze | nios2 | openrisc | sh | xtensa)
+			bits=32 generate_table
+			;;
+		*)
+			generate_table
+			;;
+		esac
+	done
+}
+
+copy_supported_arch() {
+	while IFS= read -r arch; do
+		if [ -f "${TEMP}/${arch}.in" ]; then
+			echo "- ${arch}"
+			cp "${TEMP}/${arch}.in" "${SCRIPT_DIR}/${arch}.in"
+		fi
+	done <${SUPPORTED_ARCH}
+}
+
+echo "Temporary directory ${TEMP}"
+echo "Extracting syscalls"
+
+grab_syscall_names_from_tables
+generate_list_syscalls_c
+
+do_all_tables
+
+echo "Copying supported syscalls"
+copy_supported_arch
diff --git a/include/lapi/syscalls/loongarch.in b/include/lapi/syscalls/loongarch64.in
similarity index 100%
rename from include/lapi/syscalls/loongarch.in
rename to include/lapi/syscalls/loongarch64.in
diff --git a/include/lapi/syscalls/mips_n64.in b/include/lapi/syscalls/mips64.in
similarity index 100%
rename from include/lapi/syscalls/mips_n64.in
rename to include/lapi/syscalls/mips64.in
diff --git a/include/lapi/syscalls/mips_n32.in b/include/lapi/syscalls/mips64n32.in
similarity index 100%
rename from include/lapi/syscalls/mips_n32.in
rename to include/lapi/syscalls/mips64n32.in
diff --git a/include/lapi/syscalls/mips_o32.in b/include/lapi/syscalls/mipso32.in
similarity index 100%
rename from include/lapi/syscalls/mips_o32.in
rename to include/lapi/syscalls/mipso32.in
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/parisc.in
similarity index 100%
rename from include/lapi/syscalls/hppa.in
rename to include/lapi/syscalls/parisc.in
diff --git a/include/lapi/syscalls/supported-arch.txt b/include/lapi/syscalls/supported-arch.txt
index c18aa38cf4546cdf3ac8c89a45bd1b202ffa7711..c5c5191ac08482d89f0a8c39dfae936538f58f7f 100644
--- a/include/lapi/syscalls/supported-arch.txt
+++ b/include/lapi/syscalls/supported-arch.txt
@@ -1,13 +1,13 @@
-aarch64
 arc
+arm64
 arm
-hppa
 i386
 ia64
-loongarch
-mips_n32
-mips_n64
-mips_o32
+loongarch64
+mips64n32
+mips64
+mipso32
+parisc
 powerpc64
 powerpc
 s390x

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
