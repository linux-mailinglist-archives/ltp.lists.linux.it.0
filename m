Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D67D3CCC
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:55:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 596313C2274
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 11:55:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 0CFE33C1452
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:54:54 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 2ADBA1401189
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 11:54:54 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9F468B15A;
 Fri, 11 Oct 2019 09:54:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 11 Oct 2019 11:54:40 +0200
Message-Id: <20191011095442.10541-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191011095442.10541-1-pvorel@suse.cz>
References: <20191011095442.10541-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v5 3/5] shell: Add timeout shell API tests
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

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/newlib_tests/shell/test_timeout.sh | 36 ++++++++++++++++++++++++++
 lib/newlib_tests/shell/timeout01.sh    | 13 ++++++++++
 lib/newlib_tests/shell/timeout02.sh    | 13 ++++++++++
 3 files changed, 62 insertions(+)
 create mode 100755 lib/newlib_tests/shell/test_timeout.sh
 create mode 100755 lib/newlib_tests/shell/timeout01.sh
 create mode 100755 lib/newlib_tests/shell/timeout02.sh

diff --git a/lib/newlib_tests/shell/test_timeout.sh b/lib/newlib_tests/shell/test_timeout.sh
new file mode 100755
index 000000000..2cbc66412
--- /dev/null
+++ b/lib/newlib_tests/shell/test_timeout.sh
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+PATH="$(dirname $0)/../../../testcases/lib/:$PATH"
+
+DATA="
+timeout01.sh||0
+timeout02.sh||0
+timeout02.sh|foo|32
+timeout02.sh|2|0
+timeout02.sh|1.1|0
+timeout02.sh|-10|32
+"
+
+echo "Testing timeout in shell API"
+echo
+
+failed=0
+for i in $DATA; do
+	file=$(echo $i | cut -d'|' -f1)
+	timeout=$(echo $i | cut -d'|' -f2)
+	exp_exit=$(echo $i | cut -d'|' -f3)
+
+	echo "=== $test (LTP_TIMEOUT_MUL='$timeout') ==="
+	LTP_TIMEOUT_MUL=$timeout ./$file
+	ret=$?
+	if [ $ret -ne $exp_exit ]; then
+		echo "FAILED (exit code: $ret, expected $exp_exit)"
+		failed=$((failed+1))
+	else
+		echo "PASSED"
+	fi
+	echo
+done
+
+echo "Failed tests: $failed"
+exit $failed
diff --git a/lib/newlib_tests/shell/timeout01.sh b/lib/newlib_tests/shell/timeout01.sh
new file mode 100755
index 000000000..ab7428a2d
--- /dev/null
+++ b/lib/newlib_tests/shell/timeout01.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+TST_TESTFUNC=do_test
+
+TST_TIMEOUT=-1
+. tst_test.sh
+
+do_test()
+{
+	tst_res TPASS "timeout $TST_TIMEOUT set"
+}
+
+tst_run
diff --git a/lib/newlib_tests/shell/timeout02.sh b/lib/newlib_tests/shell/timeout02.sh
new file mode 100755
index 000000000..73af09125
--- /dev/null
+++ b/lib/newlib_tests/shell/timeout02.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+
+TST_TESTFUNC=do_test
+
+TST_TIMEOUT=2
+. tst_test.sh
+
+do_test()
+{
+	tst_res TPASS "timeout $TST_TIMEOUT set (LTP_TIMEOUT_MUL='$LTP_TIMEOUT_MUL')"
+}
+
+tst_run
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
