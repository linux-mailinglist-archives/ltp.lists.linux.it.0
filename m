Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F24BC9B7F8D
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2024 17:02:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2569A3CC3C9
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2024 17:02:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 373E03CBCC1
 for <ltp@lists.linux.it>; Thu, 31 Oct 2024 17:01:14 +0100 (CET)
Authentication-Results: in-2.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=andrea.cervesato@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 5A77A64ECC8
 for <ltp@lists.linux.it>; Thu, 31 Oct 2024 17:01:13 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0890A21C9A;
 Thu, 31 Oct 2024 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730390471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwnkJqd/QNH/5eVY5lyCOEbk7GJFRP9rwmvfYGBA4Ao=;
 b=mUhHnkoWJB9tUX7bENkR77LBOblY766pn1PeWZ+8CYr9TgSHelX98cBfXTDSMqrSE5ewqt
 3gMYJzkH4/Bgv89s3RDmCxdGKdfYw1eL2k/V2HlQMs7G199FO8lpR+5NV6NufsGN4lJomC
 YljOmRYbtp4RNofjWOFdKcULH9dgdAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730390471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwnkJqd/QNH/5eVY5lyCOEbk7GJFRP9rwmvfYGBA4Ao=;
 b=64iNYLBAGKzKme327FMriTjMCE3rksX6dqI9fqBInilEmrzgxZxaCgqndg9ziMcvciBZNy
 WzXTeAUNNQwsK6Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1730390471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwnkJqd/QNH/5eVY5lyCOEbk7GJFRP9rwmvfYGBA4Ao=;
 b=mUhHnkoWJB9tUX7bENkR77LBOblY766pn1PeWZ+8CYr9TgSHelX98cBfXTDSMqrSE5ewqt
 3gMYJzkH4/Bgv89s3RDmCxdGKdfYw1eL2k/V2HlQMs7G199FO8lpR+5NV6NufsGN4lJomC
 YljOmRYbtp4RNofjWOFdKcULH9dgdAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1730390471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OwnkJqd/QNH/5eVY5lyCOEbk7GJFRP9rwmvfYGBA4Ao=;
 b=64iNYLBAGKzKme327FMriTjMCE3rksX6dqI9fqBInilEmrzgxZxaCgqndg9ziMcvciBZNy
 WzXTeAUNNQwsK6Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CBECD13B01;
 Thu, 31 Oct 2024 16:01:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id CCJlL8apI2eNLAAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 31 Oct 2024 16:01:10 +0000
From: Andrea Cervesato <andrea.cervesato@suse.de>
Date: Thu, 31 Oct 2024 17:01:07 +0100
MIME-Version: 1.0
Message-Id: <20241031-generate_syscalls-v8-1-8e35a9d6783b@suse.com>
References: <20241031-generate_syscalls-v8-0-8e35a9d6783b@suse.com>
In-Reply-To: <20241031-generate_syscalls-v8-0-8e35a9d6783b@suse.com>
To: ltp@lists.linux.it
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730390470; l=8430;
 i=andrea.cervesato@suse.com; s=20240812; h=from:subject:message-id;
 bh=N7DPq7ijeVeAxFj0aLLt09pgN+QmlvvLFgRhSGTbv4c=;
 b=XjFdi6na7QIyR/cUQPrPvKhccZcC2okeC3Ivvl+BrF5eqi4/I3j/b4tANPvSBWCcjb445T9ZO
 xVVwnPsX5/OD28AM+0zH+OhTY5nmX9sDan/qSrJgF91sbOfdo1fEadn
X-Developer-Key: i=andrea.cervesato@suse.com; a=ed25519;
 pk=RG/nLJ5snb1tLKGwSORQXBJ5XA4juT0WF2Pc/lq9meo=
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCVD_TLS_ALL(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; FROM_EQ_ENVFROM(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email]
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v8 1/4] Refactor regen.sh script to generate syscalls
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

Rename regen.sh into a more meaningful generate_syscalls.sh name, rename
order into a more meaningful supported-syscalls.txt name and rewrite
part of the regen.sh script code in order to execute it from anywhere in
the filesystem, without need to be in its own folder. The new code is
also more clear and concise, using native sh features which are
simplifying the code.

Reviewed-by: Li Wang <liwang@redhat.com>
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
---
 configure.ac                                       |   2 +-
 include/lapi/syscalls/generate_syscalls.sh         | 109 +++++++++++++++++
 include/lapi/syscalls/regen.sh                     | 129 ---------------------
 .../lapi/syscalls/{order => supported-arch.txt}    |   0
 4 files changed, 110 insertions(+), 130 deletions(-)

diff --git a/configure.ac b/configure.ac
index d327974efa71f263d7f7f5aec9d2c5831d53dd0e..cd1233d19fad376973fc880d6689859845613fb0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -386,7 +386,7 @@ else
     AC_SUBST([WITH_REALTIME_TESTSUITE],["no"])
 fi
 
-AC_CONFIG_COMMANDS([syscalls.h], [cd ${ac_top_srcdir}/include/lapi/syscalls; ./regen.sh; cd - >/dev/null])
+AC_CONFIG_COMMANDS([syscalls.h], [cd ${ac_top_srcdir}/include/lapi/syscalls; ./generate_syscalls.sh ../syscalls.h; cd - >/dev/null])
 
 # custom functions
 # NOTE: don't create custom functions for simple checks, put them into this file
diff --git a/include/lapi/syscalls/generate_syscalls.sh b/include/lapi/syscalls/generate_syscalls.sh
new file mode 100755
index 0000000000000000000000000000000000000000..b17c72ddf09cff4f55b7ef80856cd97862ce1317
--- /dev/null
+++ b/include/lapi/syscalls/generate_syscalls.sh
@@ -0,0 +1,109 @@
+#!/bin/sh -eu
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Generate the syscalls.h file, merging all architectures syscalls input file
+# which are in the current folder and defined inside supported-arch.txt file.
+
+SYSCALLS_FILE="$1"
+
+if [ -z "${SYSCALLS_FILE}" ]; then
+	echo "Please provide the syscalls.h directory:"
+	echo ""
+	echo "$0 path/of/syscalls.h"
+	echo ""
+	exit 1
+fi
+
+SCRIPT_DIR="$(realpath $(dirname "$0"))"
+SUPPORTED_ARCH="${SCRIPT_DIR}/supported-arch.txt"
+
+echo '// SPDX-License-Identifier: GPL-2.0-or-later
+/************************************************
+ * GENERATED FILE: DO NOT EDIT/PATCH THIS FILE  *
+ *  change your arch specific .in file instead  *
+ ************************************************/
+
+/*
+ * Here we stick all the ugly *fallback* logic for linux
+ * system call numbers (those __NR_ thingies).
+ */
+
+#ifndef LAPI_SYSCALLS_H__
+#define LAPI_SYSCALLS_H__
+
+#include <errno.h>
+#include <sys/syscall.h>
+#include <asm/unistd.h>
+
+#ifdef TST_TEST_H__
+#define TST_SYSCALL_BRK__(NR, SNR) ({ \
+tst_brk(TCONF, \
+	"syscall(%d) " SNR " not supported on your arch", NR); \
+})
+#else
+inline static void dummy_cleanup(void) {}
+
+#define TST_SYSCALL_BRK__(NR, SNR) ({ \
+tst_brkm(TCONF, dummy_cleanup, \
+	"syscall(%d) " SNR " not supported on your arch", NR); \
+})
+#endif
+
+#define tst_syscall(NR, ...) ({ \
+intptr_t tst_ret; \
+if (NR == __LTP__NR_INVALID_SYSCALL) { \
+	errno = ENOSYS; \
+	tst_ret = -1; \
+} else { \
+	tst_ret = syscall(NR, ##__VA_ARGS__); \
+} \
+if (tst_ret == -1 && errno == ENOSYS) { \
+	TST_SYSCALL_BRK__(NR, #NR); \
+} \
+tst_ret; \
+})
+
+#define __LTP__NR_INVALID_SYSCALL -1' >${SYSCALLS_FILE}
+
+while IFS= read -r arch; do
+	(
+		echo
+		case ${arch} in
+		sparc64) echo "#if defined(__sparc__) && defined(__arch64__)" ;;
+		sparc) echo "#if defined(__sparc__) && !defined(__arch64__)" ;;
+		s390) echo "#if defined(__s390__) && !defined(__s390x__)" ;;
+		mips64n32) echo "#if defined(__mips__) && defined(_ABIN32)" ;;
+		mips64) echo "#if defined(__mips__) && defined(_ABI64)" ;;
+		mipso32) echo "#if defined(__mips__) && defined(_ABIO32) && _MIPS_SZLONG == 32" ;;
+		parisc) echo "#ifdef __hppa__" ;;
+		loongarch64) echo "#ifdef __loongarch__" ;;
+		arm64) echo "#ifdef __aarch64__" ;;
+		*) echo "#ifdef __${arch}__" ;;
+		esac
+
+		while read -r line; do
+			set -- ${line}
+			syscall_nr="__NR_$1"
+			shift
+
+			echo "# ifndef ${syscall_nr}"
+			echo "#  define ${syscall_nr} $*"
+			echo "# endif"
+		done <"${SCRIPT_DIR}/${arch}.in"
+		echo "#endif"
+		echo
+	) >>${SYSCALLS_FILE}
+done <${SUPPORTED_ARCH}
+
+(
+	echo
+	echo "/* Common stubs */"
+	for num in $(awk '{print $1}' "${SCRIPT_DIR}/"*.in | sort -u); do
+		syscall_nr="__NR_${num}"
+
+		echo "# ifndef ${syscall_nr}"
+		echo "#  define ${syscall_nr} __LTP__NR_INVALID_SYSCALL"
+		echo "# endif"
+	done
+	echo "#endif"
+) >>${SYSCALLS_FILE}
diff --git a/include/lapi/syscalls/regen.sh b/include/lapi/syscalls/regen.sh
deleted file mode 100755
index 663ce4458bbc67c3a9e8073dfe8359164a9da0ee..0000000000000000000000000000000000000000
--- a/include/lapi/syscalls/regen.sh
+++ /dev/null
@@ -1,129 +0,0 @@
-#!/bin/sh
-
-output="syscalls.h"
-rm -f "${output}".[1-9]*
-output_pid="${output}.$$"
-
-max_jobs=$(getconf _NPROCESSORS_ONLN 2>/dev/null)
-: ${max_jobs:=1}
-
-srcdir=${0%/*}
-
-err() {
-	echo "$*" 1>&2
-	exit 1
-}
-
-cat << EOF > "${output_pid}"
-/************************************************
- * GENERATED FILE: DO NOT EDIT/PATCH THIS FILE  *
- *  change your arch specific .in file instead  *
- ************************************************/
-
-/*
- * Here we stick all the ugly *fallback* logic for linux
- * system call numbers (those __NR_ thingies).
- *
- * Licensed under the GPLv2 or later, see the COPYING file.
- */
-
-#ifndef LAPI_SYSCALLS_H__
-#define LAPI_SYSCALLS_H__
-
-#include <errno.h>
-#include <sys/syscall.h>
-#include <asm/unistd.h>
-
-#ifdef TST_TEST_H__
-#define TST_SYSCALL_BRK__(NR, SNR) ({ \\
-	tst_brk(TCONF, \\
-		"syscall(%d) " SNR " not supported on your arch", NR); \\
-})
-#else
-inline static void dummy_cleanup(void) {}
-
-#define TST_SYSCALL_BRK__(NR, SNR) ({ \\
-	tst_brkm(TCONF, dummy_cleanup, \\
-		"syscall(%d) " SNR " not supported on your arch", NR); \\
-})
-#endif
-
-#define tst_syscall(NR, ...) ({ \\
-	intptr_t tst_ret; \\
-	if (NR == __LTP__NR_INVALID_SYSCALL) { \\
-		errno = ENOSYS; \\
-		tst_ret = -1; \\
-	} else { \\
-		tst_ret = syscall(NR, ##__VA_ARGS__); \\
-	} \\
-	if (tst_ret == -1 && errno == ENOSYS) { \\
-		TST_SYSCALL_BRK__(NR, #NR); \\
-	} \\
-	tst_ret; \\
-})
-
-EOF
-
-jobs=0
-for arch in $(cat "${srcdir}/order") ; do
-	(
-	echo "Generating data for arch $arch ... "
-
-	(
-	echo
-	case ${arch} in
-		sparc64) echo "#if defined(__sparc__) && defined(__arch64__)" ;;
-		sparc) echo "#if defined(__sparc__) && !defined(__arch64__)" ;;
-		s390) echo "#if defined(__s390__) && !defined(__s390x__)" ;;
-		mips_n32) echo "#if defined(__mips__) && defined(_ABIN32)" ;;
-		mips_n64) echo "#if defined(__mips__) && defined(_ABI64)" ;;
-		mips_o32) echo "#if defined(__mips__) && defined(_ABIO32) && _MIPS_SZLONG == 32" ;;
-		*) echo "#ifdef __${arch}__" ;;
-	esac
-	while read line ; do
-		set -- ${line}
-		nr="__NR_$1"
-		shift
-		if [ $# -eq 0 ] ; then
-			err "invalid line found: $line"
-		fi
-		echo "# ifndef ${nr}"
-		echo "#  define ${nr} $*"
-		echo "# endif"
-	done < "${srcdir}/${arch}.in"
-	echo "#endif"
-	echo
-	) >> "${output_pid}.${arch}"
-
-	) &
-
-	jobs=$(( jobs + 1 ))
-	if [ ${jobs} -ge ${max_jobs} ] ; then
-		wait || exit 1
-		jobs=0
-	fi
-done
-
-echo "Generating stub list ... "
-(
-echo
-echo "/* Common stubs */"
-echo "#define __LTP__NR_INVALID_SYSCALL -1" >> "${output_pid}"
-for nr in $(awk '{print $1}' "${srcdir}/"*.in | sort -u) ; do
-	nr="__NR_${nr}"
-	echo "# ifndef ${nr}"
-	echo "#  define ${nr} __LTP__NR_INVALID_SYSCALL"
-	echo "# endif"
-done
-echo "#endif"
-) >> "${output_pid}._footer"
-
-wait || exit 1
-
-printf "Combining them all ... "
-for arch in $(cat "${srcdir}/order") _footer ; do
-	cat "${output_pid}.${arch}"
-done >> "${output_pid}"
-mv "${output_pid}" "../${output}"
-rm -f "${output_pid}"*
-echo "OK!"
diff --git a/include/lapi/syscalls/order b/include/lapi/syscalls/supported-arch.txt
similarity index 100%
rename from include/lapi/syscalls/order
rename to include/lapi/syscalls/supported-arch.txt

-- 
2.43.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
