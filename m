Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B5D3DDE9F
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:36:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDF183C8B5D
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 19:36:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id E75F33C8A2B
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:55 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7511110005A2
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 19:35:55 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2C0FE1FFF2;
 Mon,  2 Aug 2021 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1627925755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkWfAWQHBvqycrq04c9JPR3QdWapSj9R0Mh9PQ+0bYY=;
 b=qWjTabNwDwDSVHYAmtULLBPydwn/t+B0hOXA7gFi5kqBM24A4z+OwFlctZjT6O8sX+WtEF
 ucYrf3CdIzNqyPcn1IkZ3hAFfVyF3b3nzgJW0I5YVL6lo4x9IGZTqe5pkgRjWLGJR1GkX0
 Ux4So9QBucQeaf75ZsShrQ3AjL48d4o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1627925755;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WkWfAWQHBvqycrq04c9JPR3QdWapSj9R0Mh9PQ+0bYY=;
 b=8Vem75kYoM8JqNQDGF0WV+Pi802iAz9GkgIwvwu0EV+BDY+pEz2rKDtiBouCYooQI1344Z
 58WOi+Hxw3NvTADA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E950A13B47;
 Mon,  2 Aug 2021 17:35:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id wIl5N/osCGHmLAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Mon, 02 Aug 2021 17:35:54 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  2 Aug 2021 19:35:32 +0200
Message-Id: <20210802173536.19525-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802173536.19525-1-pvorel@suse.cz>
References: <20210802173536.19525-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v7 3/7] lib: Add script for running tests
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

For now run only tests which TPASS or TCONF.

tst_fuzzy_sync01: sporadically fails, thus disabled:

../../include/tst_fuzzy_sync.h:685: TINFO: Exceeded execution loops, requesting exit
tst_fuzzy_sync01.c:227: TFAIL: acs:3  act:1  art:1  | =:23   -:46   +:2999931
...
Summary:
passed   21
failed   3

Redirect stderr to stdout to workaround mangled output on GitHub Actions
where stdout and stderr are probably block buffered and flushed at
different times.

NOTE: test_zero_hugepage.sh is testing C API, thus added in
LTP_C_API_TESTS. Using shell tests also in C API tests i.e.
test_zero_hugepage.sh (helpers to setup environment tests) requires
to search file also in src directory (required for out-of-tree builds).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Changes v6->v7:
* have look on source directory, because we use scripts for running C
API (test_zero_hugepage.sh), required for out-of-tree

 lib/newlib_tests/runtest.sh | 190 ++++++++++++++++++++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100755 lib/newlib_tests/runtest.sh

diff --git a/lib/newlib_tests/runtest.sh b/lib/newlib_tests/runtest.sh
new file mode 100755
index 000000000..70fbffb6c
--- /dev/null
+++ b/lib/newlib_tests/runtest.sh
@@ -0,0 +1,190 @@
+#!/bin/sh
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+
+LTP_C_API_TESTS="${LTP_C_API_TESTS:-test05 test07 test09 test12 test15 test18
+tst_bool_expr test_exec test_timer tst_res_hexd tst_strstatus tst_fuzzy_sync02
+tst_fuzzy_sync03 test_zero_hugepage.sh}"
+
+LTP_SHELL_API_TESTS="${LTP_SHELL_API_TESTS:-shell/tst_check_driver.sh shell/net/*.sh}"
+
+cd $(dirname $0)
+PATH="$PWD/../../testcases/lib/:$PATH"
+
+. tst_ansi_color.sh
+
+usage()
+{
+	cat << EOF
+Usage: $0 [-b DIR ] [-c|-s]
+-b DIR  build directory (required for out-of-tree build)
+-c      run C API tests only
+-s      run shell API tests only
+-h      print this help
+EOF
+}
+
+tst_flag2mask()
+{
+	case "$1" in
+	TPASS) return 0;;
+	TFAIL) return 1;;
+	TBROK) return 2;;
+	TWARN) return 4;;
+	TINFO) return 16;;
+	TCONF) return 32;;
+	esac
+}
+
+runtest_res()
+{
+	if [ $# -eq 0 ]; then
+		echo >&2
+		return
+	fi
+
+	local res="$1"
+	shift
+
+	tst_color_enabled
+	local color=$?
+
+	printf "runtest " >&2
+	tst_print_colored $res "$res: " >&2
+	echo "$@" >&2
+
+}
+
+runtest_brk()
+{
+	local res="$1"
+	shift
+
+	tst_flag2mask "$res"
+	local mask=$?
+
+	runtest_res
+	runtest_res $res $@
+
+	exit $mask
+}
+
+run_tests()
+{
+	local target="$1"
+	local srcdir="$2"
+	local dir i res ret=0 tbrok tconf tfail tpass twarn vars
+
+	eval vars="\$LTP_${target}_API_TESTS"
+
+	runtest_res TINFO "=== Run $target tests ==="
+
+	for i in $vars; do
+		runtest_res TINFO "* $i"
+		if [ -f "$i" ]; then
+			dir="."
+		elif [ "$srcdir" -a -f "$srcdir/$i" ]; then
+			dir="$srcdir"
+		else
+			runtest_brk TBROK "Error: $i file not found (PWD: $PWD)"
+		fi
+
+		$dir/$i 1>&2
+		res=$?
+
+		[ $res -ne 0 -a $res -ne 32 ] && ret=1
+
+		case $res in
+			0) tpass="$tpass $i";;
+			1) tfail="$tfail $i";;
+			2) tbrok="$tbrok $i";;
+			4) twarn="$twarn $i";;
+			32) tconf="$tconf $i";;
+			127) runtest_brk TBROK "Error: file not found (wrong PATH? out-of-tree build without -b?), exit code: $res";;
+			*) runtest_brk TBROK "Error: unknown failure, exit code: $res";;
+		esac
+		runtest_res
+	done
+
+	runtest_res TINFO "=== $target TEST RESULTS ==="
+	runtest_res TINFO "$(echo $tpass | wc -w)x TPASS:$tpass"
+	runtest_res TINFO "$(echo $tfail | wc -w)x TFAIL:$tfail"
+	runtest_res TINFO "$(echo $tbrok | wc -w)x TBROK:$tbrok"
+	runtest_res TINFO "$(echo $twarn | wc -w)x TWARN:$twarn"
+	runtest_res TINFO "$(echo $tconf | wc -w)x TCONF:$tconf"
+	runtest_res
+
+	return $ret
+}
+
+run_c_tests()
+{
+	local ret srcdir="$PWD"
+
+	if [ "$builddir" ]; then
+		cd $builddir/lib/newlib_tests
+	fi
+
+	run_tests "C" "$srcdir"
+	ret=$?
+
+	if [ "$builddir" ]; then
+		cd "$srcdir"
+	fi
+
+	return $ret
+}
+
+run_shell_tests()
+{
+	run_tests "SHELL"
+}
+
+
+print_result()
+{
+	local target="$1"
+	local res="$2"
+
+
+	if [ -z "$res" ]; then
+		runtest_res TCONF "$target tests skipped"
+	elif [ $res -eq 0 ]; then
+		runtest_res TPASS "All $target tests TCONF/TPASS"
+	else
+		runtest_res TFAIL "Some $target test(s) TBROK/TFAIL/TWARN"
+	fi
+}
+
+builddir=
+c_fail=
+run=
+shell_fail=
+
+while getopts b:chs opt; do
+	case $opt in
+		'h') usage; exit 0;;
+		'b') builddir=$OPTARG; PATH="$builddir/testcases/lib:$PATH";;
+		'c') run="c";;
+		's') run="s";;
+		*) usage; runtest_brk TBROK "Error: invalid option";;
+	esac
+done
+
+runtest_res TINFO "PATH='$PATH'"
+
+if [ -z "$run" -o "$run" = "c" ]; then
+	run_c_tests
+	c_fail=$?
+fi
+
+if [ -z "$run" -o "$run" = "s" ]; then
+	run_shell_tests
+	shell_fail=$?
+fi
+
+runtest_res TINFO "=== FINAL TEST RESULTS ==="
+
+print_result "C" "$c_fail"
+print_result "shell" "$shell_fail"
+
+exit $((c_fail|shell_fail))
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
