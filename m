Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 149C93DDE9D
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:36:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7720B3C8AF5
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:36:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 450CF3C8A2B
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8E4201A0099B
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:54 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC5E71FFD2;
 Mon,  2 Aug 2021 17:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627925753; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uqNt34F0ef+jLVeWFgx0PDzxsnMBY7w1ZZsidt3I0RE=;
 b=NIvMdbhEhq1/ihklCe+v5x7A9q/4WbDACU7lGooIhdc1lGZNt0BJqgBDG24Pn4slXU4sy6
 PcTsfu77AYVI5y8HYnJEY6eASK1mQHw3wAWVXZj18infjJi3GAFBsHlrUwRUE20YGrzST8
 TdZsKvm9mIMhos/fJNha9y+welqFuWE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627925753;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=uqNt34F0ef+jLVeWFgx0PDzxsnMBY7w1ZZsidt3I0RE=;
 b=9NpK9bsyC7fcTISmNUBTD6RqrmuYDlzxPHXvcls0ldsQpvL/dAAw8WkrcZr4Ao+hcY39fp
 r6TakUqyd7ULx+BA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 7554413B47;
 Mon,  2 Aug 2021 17:35:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id NQImF/gsCGHmLAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 17:35:52 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 19:35:29 +0200
Message-Id: <20210802173536.19525-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v7 0/7] Run tests in CI
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

Hi,

changes v6->v7:
* new commit: test/test_zero_hugepage.sh: Skip test on read-only file system
* new commit: ci: Install iproute2
* Added test_zero_hugepage.sh (required to have look on source directory,
because we use scripts for running C API (required for out-of-tree
builds).

Tested:
https://github.com/pevik/ltp/actions/runs/1091097653

Kind regards,
Petr

Diff to v6:

diff --git ci/debian.sh ci/debian.sh
index a609da887..e929452ff 100755
--- ci/debian.sh
+++ ci/debian.sh
@@ -22,6 +22,7 @@ $apt \
 	clang \
 	gcc \
 	git \
+	iproute2 \
 	libacl1 \
 	libacl1-dev \
 	libaio-dev \
diff --git ci/fedora.sh ci/fedora.sh
index 959f3af20..dc1293aa5 100755
--- ci/fedora.sh
+++ ci/fedora.sh
@@ -13,6 +13,7 @@ $yum \
 	gcc \
 	git \
 	findutils \
+	iproute \
 	numactl-devel \
 	libtirpc \
 	libtirpc-devel \
diff --git ci/tumbleweed.sh ci/tumbleweed.sh
index ab622e05c..f1e7252f2 100755
--- ci/tumbleweed.sh
+++ ci/tumbleweed.sh
@@ -13,6 +13,7 @@ $zyp \
 	gcc \
 	git \
 	gzip \
+	iproute2 \
 	make \
 	kernel-default-devel \
 	keyutils-devel \
diff --git lib/newlib_tests/runtest.sh lib/newlib_tests/runtest.sh
index bd7995f3b..70fbffb6c 100755
--- lib/newlib_tests/runtest.sh
+++ lib/newlib_tests/runtest.sh
@@ -3,7 +3,7 @@
 
 LTP_C_API_TESTS="${LTP_C_API_TESTS:-test05 test07 test09 test12 test15 test18
 tst_bool_expr test_exec test_timer tst_res_hexd tst_strstatus tst_fuzzy_sync02
-tst_fuzzy_sync03}"
+tst_fuzzy_sync03 test_zero_hugepage.sh}"
 
 LTP_SHELL_API_TESTS="${LTP_SHELL_API_TESTS:-shell/tst_check_driver.sh shell/net/*.sh}"
 
@@ -71,7 +71,8 @@ runtest_brk()
 run_tests()
 {
 	local target="$1"
-	local i res ret=0 tbrok tconf tfail tpass twarn vars
+	local srcdir="$2"
+	local dir i res ret=0 tbrok tconf tfail tpass twarn vars
 
 	eval vars="\$LTP_${target}_API_TESTS"
 
@@ -79,7 +80,15 @@ run_tests()
 
 	for i in $vars; do
 		runtest_res TINFO "* $i"
-		./$i
+		if [ -f "$i" ]; then
+			dir="."
+		elif [ "$srcdir" -a -f "$srcdir/$i" ]; then
+			dir="$srcdir"
+		else
+			runtest_brk TBROK "Error: $i file not found (PWD: $PWD)"
+		fi
+
+		$dir/$i 1>&2
 		res=$?
 
 		[ $res -ne 0 -a $res -ne 32 ] && ret=1
@@ -94,7 +103,6 @@ run_tests()
 			*) runtest_brk TBROK "Error: unknown failure, exit code: $res";;
 		esac
 		runtest_res
-		sync
 	done
 
 	runtest_res TINFO "=== $target TEST RESULTS ==="
@@ -110,17 +118,17 @@ run_tests()
 
 run_c_tests()
 {
-	local ret
+	local ret srcdir="$PWD"
 
 	if [ "$builddir" ]; then
 		cd $builddir/lib/newlib_tests
 	fi
 
-	run_tests "C"
+	run_tests "C" "$srcdir"
 	ret=$?
 
 	if [ "$builddir" ]; then
-		cd -
+		cd "$srcdir"
 	fi
 
 	return $ret
diff --git lib/newlib_tests/test_zero_hugepage.sh lib/newlib_tests/test_zero_hugepage.sh
index 10113006b..8a462478e 100755
--- lib/newlib_tests/test_zero_hugepage.sh
+++ lib/newlib_tests/test_zero_hugepage.sh
@@ -1,12 +1,16 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2021 Yang Xu <xuyang2018.jy@fujitsu.com>
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
 
 echo "Testing .request_hugepages = TST_NO_HUGEPAGES"
 
 orig_value=`cat /proc/sys/vm/nr_hugepages`
 
-echo "128" > /proc/sys/vm/nr_hugepages
+if ! echo "128" > /proc/sys/vm/nr_hugepages; then
+	echo "TCONF: failed to open /proc/sys/vm/nr_hugepages"
+	exit 32
+fi
 
 ./test_zero_hugepage
 

Petr Vorel (7):
  lib: Print Summary: into stderr
  test/test_zero_hugepage.sh: Skip test on read-only file system
  lib: Add script for running tests
  make: Add make test{, -c, -shell} targets
  build.sh: Add support for make test{,-c,-shell}
  CI: Run also make test-c, test-shell
  ci: Install iproute2

 .github/workflows/ci.yml               |  10 ++
 Makefile                               |  23 +++
 build.sh                               |  24 +++-
 ci/debian.sh                           |   1 +
 ci/fedora.sh                           |   1 +
 ci/tumbleweed.sh                       |   1 +
 lib/newlib_tests/runtest.sh            | 190 +++++++++++++++++++++++++
 lib/newlib_tests/test_zero_hugepage.sh |   6 +-
 lib/tst_test.c                         |  12 +-
 9 files changed, 260 insertions(+), 8 deletions(-)
 create mode 100755 lib/newlib_tests/runtest.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
