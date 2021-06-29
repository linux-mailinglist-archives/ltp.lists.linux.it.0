Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3333B7A13
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:49:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E18C93C8D87
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Jun 2021 23:49:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7C7493C9398
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:15 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 8AE676008F0
 for <ltp@lists.linux.it>; Tue, 29 Jun 2021 23:48:15 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 44FAF20424;
 Tue, 29 Jun 2021 21:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/e1nTlDYp3DxHrb2c7dD52UEtXVolP8DrZqzRS+HDC8=;
 b=SX8ECHBXa7zYoaF3KtAKOaE5iQx15+f19+1UXc4L2wf6Sznr8kvr5aNPRsxGolF/RQ7kae
 35hSp/DGOYX4GH9kpD2RY/9J+7Ybhnn749fk2s2VZyODZ6VIPngE2YFYu47YJfiWLbW8aL
 Qx8DPBZPsX0t08Hk8v7IrYn5WPWSAQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/e1nTlDYp3DxHrb2c7dD52UEtXVolP8DrZqzRS+HDC8=;
 b=+So+LW+lAF92+V2M029ycF/452uAhlkLkDAXFPiqyo1OG1nML51WwU5v4hnIpPynM4rZSH
 4JkmxNa8l8X5viDw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id F28AE11906;
 Tue, 29 Jun 2021 21:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1625003295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/e1nTlDYp3DxHrb2c7dD52UEtXVolP8DrZqzRS+HDC8=;
 b=SX8ECHBXa7zYoaF3KtAKOaE5iQx15+f19+1UXc4L2wf6Sznr8kvr5aNPRsxGolF/RQ7kae
 35hSp/DGOYX4GH9kpD2RY/9J+7Ybhnn749fk2s2VZyODZ6VIPngE2YFYu47YJfiWLbW8aL
 Qx8DPBZPsX0t08Hk8v7IrYn5WPWSAQI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1625003295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/e1nTlDYp3DxHrb2c7dD52UEtXVolP8DrZqzRS+HDC8=;
 b=+So+LW+lAF92+V2M029ycF/452uAhlkLkDAXFPiqyo1OG1nML51WwU5v4hnIpPynM4rZSH
 4JkmxNa8l8X5viDw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id GLm9OR6V22AcSAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Tue, 29 Jun 2021 21:48:14 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue, 29 Jun 2021 23:48:05 +0200
Message-Id: <20210629214808.18760-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629214808.18760-1-pvorel@suse.cz>
References: <20210629214808.18760-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 2/5] lib: Add script for running tests
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
Cc: Xiao Yang <yangx.jy@cn.fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

For now run only tests which TPASS or TCONF.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

not sure if using same name for custom versions is a good idea.
Maybe I should have just used echo, but I plan to add other features to
runtest.sh, thus I try to keep usage similar to normal tests.
Maybe it's a wrong approach, making things less readable for new
contributors who will try to figure out why their change in test API
failed.

Kind regards,
Petr

 lib/newlib_tests/runtest.sh | 120 ++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100755 lib/newlib_tests/runtest.sh

diff --git a/lib/newlib_tests/runtest.sh b/lib/newlib_tests/runtest.sh
new file mode 100755
index 000000000..b110a5876
--- /dev/null
+++ b/lib/newlib_tests/runtest.sh
@@ -0,0 +1,120 @@
+#!/bin/sh
+# Copyright (c) 2021 Petr Vorel <pvorel@suse.cz>
+
+LTP_C_API_TESTS="${LTP_C_API_TESTS:-test05 test07 test09 test12 test15 test16 test18
+test_exec test_timer tst_bool_expr tst_res_hexd tst_strstatus tst_fuzzy_sync02}"
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
+	echo "Usage: $0 [-c|-s]"
+	echo "-c    run C API tests only"
+	echo "-s    run shell API tests only"
+	echo "-h    print this help"
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
+	tst_res
+	tst_res $res $@
+
+	exit $(tst_flag2mask $res)
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
+run=
+while getopts chs opt; do
+	case $opt in
+		'h') usage; exit 0;;
+		'c') run="c";;
+		's') run="s";;
+		*) usage; tst_brk TBROK "Error: invalid option";;
+	esac
+done
+
+tst_res TINFO "PATH='$PATH'"
+
+if [ -z "$run" -o "$run" = "c" ]; then
+	run_tests "C"
+fi
+
+if [ -z "$run" -o "$run" = "s" ]; then
+	run_tests "SHELL"
+fi
+
+tst_res TPASS "No test failed"
-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
