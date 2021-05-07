Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57A3763D7
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 12:33:21 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0628E3C563E
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 12:33:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AD92B3C55FE
 for <ltp@lists.linux.it>; Fri,  7 May 2021 12:33:10 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 19B4510006B7
 for <ltp@lists.linux.it>; Fri,  7 May 2021 12:33:10 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 907AC9FBF7;
 Fri,  7 May 2021 10:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1620383588; bh=/WU5rdGa9NSpB8EJbbtmK7pSJlEdkkZvHXDnPbIysKo=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=gPWN1p1gRHRjH/2yrb/i/wScu0GIn1vViRTswiIV+dEuxhNzuP0OVmwrVppxxNHCA
 34VLMi6jjWbXqDnk1Ln5FcM1R7JXlf0MuK6CZ1RBlGj61tbwIlZrLyrv+SC0AFXaM2
 OhUqOigxV5E9Hj8wbhCAb2zwAMBoct3bkaHZ56I0=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	chrubis@suse.cz,
	liwang@redhat.com
Date: Fri,  7 May 2021 12:32:57 +0200
Message-Id: <20210507103258.232174-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507103258.232174-1-lkml@jv-coder.de>
References: <20210507103258.232174-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 1/2] shell: Extend timeout tests
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

From: Joerg Vehlow <joerg.vehlow@aox-tech.de>

- Add test, that verifies, that the timeout is working as expected.
- Add test case to check if there are processes left,
  after a test finished without running into a timeout.
- Add execution of timeout03.sh and verification of return code.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 lib/newlib_tests/shell/test_timeout.sh | 178 ++++++++++++++++++++++---
 lib/newlib_tests/shell/timeout04.sh    |  22 +++
 2 files changed, 179 insertions(+), 21 deletions(-)
 create mode 100755 lib/newlib_tests/shell/timeout04.sh

diff --git a/lib/newlib_tests/shell/test_timeout.sh b/lib/newlib_tests/shell/test_timeout.sh
index 26477d6f2..06f3acf88 100755
--- a/lib/newlib_tests/shell/test_timeout.sh
+++ b/lib/newlib_tests/shell/test_timeout.sh
@@ -1,42 +1,178 @@
 #!/bin/sh
 # SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2019 Petr Vorel <pvorel@suse.cz>
+# Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
 
 PATH="$(dirname $0):$(dirname $0)/../../../testcases/lib/:$PATH"
 
+# Test cases are separated by newlines.
+# Every test has the following fields in this order:
+# file
+# timeout_mul
+# use_cat
+# max_runtime
+# expected_exit_code
+# expected passes
+# expected failed
+# expected broken
+# description
+# Whole lines can be commented out using "#"
 DATA="
-timeout01.sh||0
-timeout02.sh||0
-timeout02.sh|foo|2
-timeout02.sh|2|0
-timeout01.sh|2|0
-timeout02.sh|1.1|0
-timeout02.sh|-10|2
-timeout02.sh|-0.1|0
-timeout02.sh|-1.1|2
-timeout02.sh|-10.1|2
+timeout01.sh|     |0|  |0
+timeout02.sh|     |0|  |0
+timeout02.sh|  foo|0|  |2
+timeout02.sh|    2|0|  |0
+timeout01.sh|    2|0|  |0
+timeout02.sh|  1.1|0|  |0
+timeout02.sh|  -10|0|  |2
+timeout02.sh| -0.1|0|  |0
+timeout02.sh| -1.1|0|  |2
+timeout02.sh|-10.1|0|  |2
+timeout03.sh|     |0|12|137| | | |Test kill if test does not terminate by SIGINT
+timeout04.sh|     |0|  |  2|0|0|1|Verify that timeout is enforced
+timeout02.sh|    2|1| 2|   |1|0|0|Test termination of timeout process
 "
 
+# Executes a test
+# Parameter:
+#  - test:    The test to execute
+#  - timeout: The timeout multiplicator (optional)
+#  - use_cat: Pipe the output of the command through cat (optional)
+#             If this is used, the exit code is NOT returned!
+#
+# The function returns the following global variables:
+# - test_exit:     The exit code of the test
+# - test_duration: The duration of the test in seconds
+# - test_output:   The full output of the test
+# - test_passed:   The number of passed tests parsed from the summary
+# - test_failed:   The number of failed tests parsed from the summary
+# - test_broken:   The number of broken tests parsed from the summary
+run_test()
+{
+	local test=$1
+	local timeout=$2
+	local use_cat=$3
+	local tmpfile start end;
+
+	tmpfile=$(mktemp -t ltp_timeout_XXXXXXXX)
+	start=$(date +%s)
+	# We have to use set monitor mode (set -m) here.
+	# In most shells in most cases this creates a
+	# new process group for the next command.
+	# A process group is required for the timeout functionality,
+	# because it sends signals to the whole process group.
+	set -m
+	# The use_cat is for testing if any programm using stdout
+	# is still running, after the test finished.
+	# cat will wait for its stdin to be closed.
+	#
+	# In the pure shell implementation of the timeout handling,
+	# the sleep process was never killed, when a test finished
+	# before the timeout.
+	if [ "$use_cat" = "1" ]; then
+		LTP_TIMEOUT_MUL=$timeout $test 2>&1 | cat >$tmpfile
+	else
+		LTP_TIMEOUT_MUL=$timeout $test 1>$tmpfile 2>&1
+	fi
+	test_exit=$?
+	set +m
+	end=$(date +%s)
+
+	test_duration=$((end - start))
+	test_output=$(cat $tmpfile)
+	rm $tmpfile
+
+	eval $(echo "$test_output" | awk '
+		BEGIN {sum=0} 
+		$1 == "Summary:" {
+			sum=1;
+		}
+		sum && ( \
+			   $1 == "passed" \
+			|| $1 == "failed" \
+			|| $1 == "broken") {
+			print "test_" $1 "=" $2
+		}
+	')
+}
+
 echo "Testing timeout in shell API"
 echo
 
 failed=0
-for i in $DATA; do
-	file=$(echo $i | cut -d'|' -f1)
-	timeout=$(echo $i | cut -d'|' -f2)
-	exp_exit=$(echo $i | cut -d'|' -f3)
-
-	echo "=== $file (LTP_TIMEOUT_MUL='$timeout') ==="
-	LTP_TIMEOUT_MUL=$timeout $file
-	ret=$?
-	if [ $ret -ne $exp_exit ]; then
-		echo "FAILED (exit code: $ret, expected $exp_exit)"
-		failed=$((failed+1))
+test_nr=0
+
+old_ifs="$IFS"
+IFS=$(printf "\n\b")
+
+# Remove comments and empty lines
+CLEANED_DATA=$(echo "$DATA" | sed '/^\s*#/d;/^\s*$/d')
+test_max=$(echo "$CLEANED_DATA" | wc -l)
+for d in $CLEANED_DATA; do
+	IFS="$old_ifs"
+
+	file=$(echo $d | cut -d'|' -f1 | xargs)
+	timeout=$(echo $d | cut -d'|' -f2 | xargs)
+	use_cat=$(echo $d | cut -d'|' -f3 | xargs)
+	max_runtime=$(echo $d | cut -d'|' -f4 | xargs)
+	max_runtime=${max_runtime:--1}
+	exp_exit=$(echo $d | cut -d'|' -f5 | xargs)
+	exp_exit=${exp_exit:--1}
+	exp_passed=$(echo $d | cut -d'|' -f6 | xargs)
+	exp_passed=${exp_passed:--1}
+	exp_failed=$(echo $d | cut -d'|' -f7 | xargs)
+	exp_failed=${exp_failed:--1}
+	exp_broken=$(echo $d | cut -d'|' -f8 | xargs)
+	exp_broken=${exp_broken:--1}
+	description=$(echo $d | cut -d'|' -f9)
+
+	test_nr=$(($test_nr + 1))
+
+	cur_fails=0
+
+	if [ -z "$description" ]; then
+		description="$file (LTP_TIMEOUT_MUL='$timeout')"
+	fi
+
+	echo "=== $test_nr/$test_max $description ==="
+	run_test "$file" "$timeout" "$use_cat"
+
+	if [ $max_runtime -ne -1 ] && [ $test_duration -gt $max_runtime ]; then
+		echo "FAILED (runtime: $test_duration, expected less than $max_runtime)"
+		cur_fails=$((cur_fails + 1))
+	fi
+
+	if [ $exp_passed -ne -1 ] && [ $exp_passed -ne $test_passed ]; then
+		echo "FAILED (passes: $test_passed, expected $exp_passed)"
+		cur_fails=$((cur_fails + 1))
+	fi
+
+	if [ $exp_failed -ne -1 ] && [ $exp_failed -ne $test_failed ]; then
+		echo "FAILED (failed: $test_failed, expected $exp_failed)"
+		cur_fails=$((cur_fails + 1))
+	fi
+
+	if [ $exp_broken -ne -1 ] && [ $exp_broken -ne $test_broken ]; then
+		echo "FAILED (broken: $test_broken, expected $exp_broken)"
+		cur_fails=$((cur_fails + 1))
+	fi
+
+	if [ $exp_exit -ne -1 ] && [ $test_exit -ne $exp_exit ]; then
+		echo "FAILED (exit code: $test_exit, expected $exp_exit)"
+		cur_fails=$((cur_fails + 1))
+	fi
+
+	if [ $cur_fails -gt 0 ]; then
+		failed=$((failed + 1))
+		echo "--------"
+		echo "$test_output"
+		echo "--------"
 	else
 		echo "PASSED"
 	fi
 	echo
 done
+IFS="$old_ifs"
 
 echo "Failed tests: $failed"
 exit $failed
diff --git a/lib/newlib_tests/shell/timeout04.sh b/lib/newlib_tests/shell/timeout04.sh
new file mode 100755
index 000000000..0a6ba053c
--- /dev/null
+++ b/lib/newlib_tests/shell/timeout04.sh
@@ -0,0 +1,22 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Joerg Vehlow <joerg.vehlow@aox-tech.de>
+
+TST_TESTFUNC=do_test
+
+TST_TIMEOUT=1
+. tst_test.sh
+
+do_test()
+{
+	tst_res TINFO "Start"
+    sleep 5
+    tst_res TFAIL "End"
+}
+
+do_cleanup()
+{
+    tst_res TINFO "cleanup"
+}
+
+tst_run
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
