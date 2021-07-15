Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D94B3C9AAA
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:31:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 073DF3C9B58
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 10:31:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B87CB3C2E33
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:31:00 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id DD52A100117B
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 10:30:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7C3F522939;
 Thu, 15 Jul 2021 08:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626337859; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BISVZJJBAhf4am8Rw3PGOzwnAChYwsvoCiNQ4EZ6NUc=;
 b=QDI2GdOpFxjArvN26fLYIvO90MkaTZL4EzTeE56UE4KPjrEN245x96ha6qYlOhqm3OuqxA
 oYsfKS02XjraUvxZq8va9nExY7J/XJPY0Uwij4ujFv6jPjBqJKIWcO51/yFW5R4V90lc9x
 o+HuASpL4vzNRUU/d+h+MSEQ+xC/BcY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626337859;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BISVZJJBAhf4am8Rw3PGOzwnAChYwsvoCiNQ4EZ6NUc=;
 b=6O4RPQ9Jb1PYxLE9p7uSi76i34hFWFLO8c9TbRcz+0TzC0HUac6kQUwQGBOEIorcBVcjVS
 gn09Jy6RgdAGDeCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4BFB013C2E;
 Thu, 15 Jul 2021 08:30:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AK/lEEPy72BhdAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 15 Jul 2021 08:30:59 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 15 Jul 2021 10:30:49 +0200
Message-Id: <20210715083052.7138-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210715083052.7138-1-pvorel@suse.cz>
References: <20210715083052.7138-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v6 2/5] lib: Add script for running tests
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

Use sync to workaround mangled output on GitHub Actions where stdout and
stderr are probably block buffered and flushed at different times.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v5->v6:
* fix final error evaluation for C tests in runtest.sh

 lib/newlib_tests/runtest.sh | 182 ++++++++++++++++++++++++++++++++++++
 1 file changed, 182 insertions(+)
 create mode 100755 lib/newlib_tests/runtest.sh

diff --git a/lib/newlib_tests/runtest.sh b/lib/newlib_tests/runtest.sh
new file mode 100755
index 000000000..bd7995f3b
--- /dev/null
+++ b/lib/newlib_tests/runtest.sh
@@ -0,0 +1,182 @@
+#!/bin/sh
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+
+LTP_C_API_TESTS="${LTP_C_API_TESTS:-test05 test07 test09 test12 test15 test18
+tst_bool_expr test_exec test_timer tst_res_hexd tst_strstatus tst_fuzzy_sync02
+tst_fuzzy_sync03}"
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
+	local i res ret=0 tbrok tconf tfail tpass twarn vars
+
+	eval vars="\$LTP_${target}_API_TESTS"
+
+	runtest_res TINFO "=== Run $target tests ==="
+
+	for i in $vars; do
+		runtest_res TINFO "* $i"
+		./$i
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
+		sync
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
+	local ret
+
+	if [ "$builddir" ]; then
+		cd $builddir/lib/newlib_tests
+	fi
+
+	run_tests "C"
+	ret=$?
+
+	if [ "$builddir" ]; then
+		cd -
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
