Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D3F3C6E49
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:58 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 455083C8764
	for <lists+linux-ltp@lfdr.de>; Tue, 13 Jul 2021 12:14:58 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 60CEE3C8773
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:46 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1F3501A00CA3
 for <ltp@lists.linux.it>; Tue, 13 Jul 2021 12:13:46 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D224D2008F;
 Tue, 13 Jul 2021 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1626171225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaUyTk7QgzdxlzQQO1UeVvIaEizrDqShBf1FzqSrBBs=;
 b=zNBMd7dId9LAQA8SYoN6cx+lk9ihbFA84h+IIQJL9Q5O3jZ0+2i/axuR3AXFTRQpmkXuZo
 EJIA1CEfqygTFG/ui5Lu81yw7Wtece5lWxKIrhGHMtvTrXKUxLvEGgx3jaMi61vnHUiukp
 p16m5TI0PcRNjYgCxn/LPJX1ilCVlrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1626171225;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FaUyTk7QgzdxlzQQO1UeVvIaEizrDqShBf1FzqSrBBs=;
 b=qomdr1hU8/KW+cK+7kTTWPF7AGrkJqbnicwsRi3WDcoxA/qtEOgTQRs1mVcDVU3PGsrhqT
 maoZjXmwTDJKpmAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9681813AE3;
 Tue, 13 Jul 2021 10:13:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IOdTIlln7WCaYAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 13 Jul 2021 10:13:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 13 Jul 2021 12:13:35 +0200
Message-Id: <20210713101338.6985-5-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713101338.6985-1-pvorel@suse.cz>
References: <20210713101338.6985-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v4 4/7] lib: Add script for running tests
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

For now run only tests which TPASS or TCONF.

Disabled also problematic tests:

* tst_bool_expr: for some reason killed after testing:

/__w/ltp/ltp/lib/newlib_tests/tst_bool_expr.c:41: TINFO: Parsing 'A ( B )'
A ( B )

Summary:
passed   24
failed   0
broken   0
skipped  0
warnings 0
PATH: '/__w/ltp/ltp/../ltp-build/testcases/lib:/__w/ltp/ltp/lib/newlib_tests/../../testcases/lib/:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'
DEBUG: 0
/__w/ltp/ltp/lib/tst_test.c:1363: TBROK: Test killed by SIGSEGV!

* tst_fuzzy_sync01: sporadically fails:
../../include/tst_fuzzy_sync.h:685: TINFO: Exceeded execution loops, requesting exit
tst_fuzzy_sync01.c:227: TFAIL: acs:3  act:1  art:1  | =:23   -:46   +:2999931
...
Summary:
passed   21
failed   3

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Partly rewritten since v3.

 lib/newlib_tests/runtest.sh | 148 ++++++++++++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)
 create mode 100755 lib/newlib_tests/runtest.sh

diff --git a/lib/newlib_tests/runtest.sh b/lib/newlib_tests/runtest.sh
new file mode 100755
index 000000000..80bba00e9
--- /dev/null
+++ b/lib/newlib_tests/runtest.sh
@@ -0,0 +1,148 @@
+#!/bin/sh
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+
+LTP_C_API_TESTS="${LTP_C_API_TESTS:-test05 test07 test09 test12 test15 test18
+test_exec test_timer tst_res_hexd tst_strstatus tst_fuzzy_sync02 tst_fuzzy_sync03}"
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
+# custom version
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
+# custom version
+tst_res()
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
+# custom version
+tst_brk()
+{
+	local res="$1"
+	shift
+
+	tst_flag2mask "$res"
+	local mask=$?
+
+	tst_res
+	tst_res $res $@
+
+	exit $mask
+}
+
+run_tests()
+{
+	local target="$1"
+	local i ret tconf tpass vars
+
+	eval vars="\$LTP_${target}_API_TESTS"
+
+	tst_res TINFO "=== Run $target tests ==="
+
+	for i in $vars; do
+		tst_res TINFO "* $i"
+		./$i
+		ret=$?
+
+		case $ret in
+			0) tpass="$tpass $i";;
+			1) tst_brk TFAIL "$i failed with TFAIL";;
+			2) tst_brk TFAIL "$i failed with TBROK";;
+			4) tst_brk TFAIL "$i failed with TWARN";;
+			32) tconf="$tconf $i";;
+			127) tst_brk TBROK "Error: file not found (wrong PATH? out-of-tree build without -b?), exit code: $ret";;
+			*) tst_brk TBROK "Error: unknown failure, exit code: $ret";;
+		esac
+		tst_res
+	done
+
+	[ -z "$tpass" ] && tpass=" none"
+	[ -z "$tconf" ] && tconf=" none"
+
+	tst_res TINFO "=== $target TEST RESULTS ==="
+	tst_res TINFO "Tests exited with TPASS:$tpass"
+	tst_res TINFO "Tests exited with TCONF:$tconf"
+	tst_res
+}
+
+run_c_tests()
+{
+	if [ "$builddir" ]; then
+		cd $builddir/lib/newlib_tests
+	fi
+
+	run_tests "C"
+
+	if [ "$builddir" ]; then
+		cd -
+	fi
+}
+
+run_shell_tests()
+{
+	run_tests "SHELL"
+}
+
+builddir=
+run=
+while getopts b:chs opt; do
+	case $opt in
+		'h') usage; exit 0;;
+		'b') builddir=$OPTARG; PATH="$builddir/testcases/lib:$PATH";;
+		'c') run="c";;
+		's') run="s";;
+		*) usage; tst_brk TBROK "Error: invalid option";;
+	esac
+done
+
+tst_res TINFO "PATH='$PATH'"
+
+if [ -z "$run" -o "$run" = "c" ]; then
+	run_c_tests
+fi
+
+if [ -z "$run" -o "$run" = "s" ]; then
+	run_shell_tests
+fi
+
+tst_res TPASS "No test failed"
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
