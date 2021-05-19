Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9288C388790
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 08:31:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8390E3C31F2
	for <lists+linux-ltp@lfdr.de>; Wed, 19 May 2021 08:31:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2EA183C3051
 for <ltp@lists.linux.it>; Wed, 19 May 2021 08:31:27 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E1AE6200DB4
 for <ltp@lists.linux.it>; Wed, 19 May 2021 08:31:26 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A63DB9F72D;
 Wed, 19 May 2021 06:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1621405884; bh=PMJhVX8/q0qybSaMfuumCUCzvYwO2mT4JQZLClrgmr0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=DpxkHdLa4+O8jvzQPhh/3ipkKa+467vI2HxS2IPAD6yq8oFPWqA35bVu8Mf+c0LE+
 zo/tK8NJ7CODqzkRO/V1c7bk5nxUcJ4hxV2XcLXl3m+O0FrIQChLLMnrpi9DkNRx1u
 Us5qLlDVWz6r8rHFYTaIxnCFz4yiIpfOjRh1Of6w=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	liwang@redhat.com,
	chrubis@suse.cz,
	pvorel@suse.cz
Date: Wed, 19 May 2021 08:31:09 +0200
Message-Id: <20210519063109.224352-2-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519063109.224352-1-lkml@jv-coder.de>
References: <20210519063109.224352-1-lkml@jv-coder.de>
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 2/2] shell: Extend timeout tests,
 to run on multiple shells
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

There are some differences especially in signal handling
between the shells, so execute the tests on as many
shells as possible.

Signed-off-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
---
 lib/newlib_tests/shell/test_timeout.sh | 242 +++++++++++++++++--------
 1 file changed, 169 insertions(+), 73 deletions(-)

diff --git a/lib/newlib_tests/shell/test_timeout.sh b/lib/newlib_tests/shell/test_timeout.sh
index b05680cb1..152f51c32 100755
--- a/lib/newlib_tests/shell/test_timeout.sh
+++ b/lib/newlib_tests/shell/test_timeout.sh
@@ -5,6 +5,15 @@
 
 PATH="$(dirname $0):$(dirname $0)/../../../testcases/lib/:$PATH"
 
+SHELLS="
+bash
+dash
+busybox sh
+zsh
+ash
+ksh
+"
+
 # Test cases are separated by newlines.
 # Every test has the following fields in this order:
 # file
@@ -33,12 +42,23 @@ timeout04.sh|     |0|  |  2|0|0|1|Verify that timeout is enforced
 timeout02.sh|    2|1| 2|   |1|0|0|Test termination of timeout process
 "
 
+run_shell()
+{
+	local shell=$1
+	shift
+
+	eval $shell "$@"
+	return $?
+}
+
 # Executes a test
 # Parameter:
-#  - test:    The test to execute
-#  - timeout: The timeout multiplicator (optional)
-#  - use_cat: Pipe the output of the command through cat (optional)
-#             If this is used, the exit code is NOT returned!
+#  - shell:    The shell to be used while executing the test
+#  - shellarg: First parameter of shell (e.g. for busybox sh)
+#  - test:     The test to execute
+#  - timeout:  The timeout multiplicator (optional)
+#  - use_cat:  Pipe the output of the command through cat (optional)
+#              If this is used, the exit code is NOT returned!
 #
 # The function returns the following global variables:
 # - test_exit:     The exit code of the test
@@ -47,11 +67,13 @@ timeout02.sh|    2|1| 2|   |1|0|0|Test termination of timeout process
 # - test_passed:   The number of passed tests parsed from the summary
 # - test_failed:   The number of failed tests parsed from the summary
 # - test_broken:   The number of broken tests parsed from the summary
-run_test()
+exec_test()
 {
-	local test=$1
-	local timeout=$2
-	local use_cat=$3
+	local shell=$1
+	local shellarg=$2
+	local test=$3
+	local timeout=$4
+	local use_cat=$5
 	local tmpfile start end;
 
 	tmpfile=$(mktemp -t ltp_timeout_XXXXXXXX)
@@ -70,9 +92,9 @@ run_test()
 	# the sleep process was never killed, when a test finished
 	# before the timeout.
 	if [ "$use_cat" = "1" ]; then
-		LTP_TIMEOUT_MUL=$timeout $test 2>&1 | cat >$tmpfile
+		LTP_TIMEOUT_MUL=$timeout $shell $shellarg $test 2>&1 | cat >$tmpfile
 	else
-		LTP_TIMEOUT_MUL=$timeout $test 1>$tmpfile 2>&1
+		LTP_TIMEOUT_MUL=$timeout $shell $shellarg $test 1>$tmpfile 2>&1
 	fi
 	test_exit=$?
 	set +m
@@ -82,6 +104,9 @@ run_test()
 	test_output=$(cat $tmpfile)
 	rm $tmpfile
 
+	test_passed=-1
+	test_failed=-1
+	test_broken=-1
 	eval $(echo "$test_output" | awk '
 		BEGIN {sum=0}
 		$1 == "Summary:" {
@@ -96,83 +121,154 @@ run_test()
 	')
 }
 
-echo "Testing timeout in shell API"
-echo
+do_test()
+{
+	local failed test_nr old_ifs shell CLEANED_DATA test_max
+	local file cur_fails timeout use_cat max_runtime exp_exit
+	local exp_passed exp_failed exp_broken description
+	
+	shell="$1"
+	shellarg="$2"
 
-failed=0
-test_nr=0
+	failed=0
+	test_nr=0
 
-old_ifs="$IFS"
-IFS=$(printf "\n\b")
+	old_ifs="$IFS"
+	IFS=$(printf "\n\b")
 
-# Remove comments and empty lines
-CLEANED_DATA=$(echo "$DATA" | sed '/^\s*#/d;/^\s*$/d')
-test_max=$(echo "$CLEANED_DATA" | wc -l)
-for d in $CLEANED_DATA; do
+	# Remove comments and empty lines
+	CLEANED_DATA=$(echo "$DATA" | sed '/^\s*#/d;/^\s*$/d')
+	test_max=$(echo "$CLEANED_DATA" | wc -l)
+	for d in $CLEANED_DATA; do
+		IFS="$old_ifs"
+
+		file=$(echo $d | cut -d'|' -f1 | xargs)
+		timeout=$(echo $d | cut -d'|' -f2 | xargs)
+		use_cat=$(echo $d | cut -d'|' -f3 | xargs)
+		max_runtime=$(echo $d | cut -d'|' -f4 | xargs)
+		max_runtime=${max_runtime:--1}
+		exp_exit=$(echo $d | cut -d'|' -f5 | xargs)
+		exp_exit=${exp_exit:--1}
+		exp_passed=$(echo $d | cut -d'|' -f6 | xargs)
+		exp_passed=${exp_passed:--1}
+		exp_failed=$(echo $d | cut -d'|' -f7 | xargs)
+		exp_failed=${exp_failed:--1}
+		exp_broken=$(echo $d | cut -d'|' -f8 | xargs)
+		exp_broken=${exp_broken:--1}
+		description=$(echo $d | cut -d'|' -f9)
+
+		test_nr=$(($test_nr + 1))
+
+		cur_fails=0
+
+		if [ -z "$description" ]; then
+			description="$file (LTP_TIMEOUT_MUL='$timeout')"
+		fi
+
+		echo "=== $test_nr/$test_max $description ==="
+		exec_test "$shell" "$shellarg" "$file" "$timeout" "$use_cat"
+
+		if [ $max_runtime -ne -1 ] && [ $test_duration -gt $max_runtime ]; then
+			echo "FAILED (runtime: $test_duration, expected less than $max_runtime)"
+			cur_fails=$((cur_fails + 1))
+		fi
+
+		if [ $exp_passed -ne -1 ] && [ $exp_passed -ne $test_passed ]; then
+			echo "FAILED (passes: $test_passed, expected $exp_passed)"
+			cur_fails=$((cur_fails + 1))
+		fi
+
+		if [ $exp_failed -ne -1 ] && [ $exp_failed -ne $test_failed ]; then
+			echo "FAILED (failed: $test_failed, expected $exp_failed)"
+			cur_fails=$((cur_fails + 1))
+		fi
+
+		if [ $exp_broken -ne -1 ] && [ $exp_broken -ne $test_broken ]; then
+			echo "FAILED (broken: $test_broken, expected $exp_broken)"
+			cur_fails=$((cur_fails + 1))
+		fi
+
+		if [ $exp_exit -ne -1 ] && [ $test_exit -ne $exp_exit ]; then
+			echo "FAILED (exit code: $test_exit, expected $exp_exit)"
+			cur_fails=$((cur_fails + 1))
+		fi
+
+		if [ $cur_fails -gt 0 ]; then
+			failed=$((failed + 1))
+			echo "--------"
+			echo "$test_output"
+			echo "--------"
+		else
+			echo "PASSED"
+		fi
+		echo
+	done
 	IFS="$old_ifs"
 
-	file=$(echo $d | cut -d'|' -f1 | xargs)
-	timeout=$(echo $d | cut -d'|' -f2 | xargs)
-	use_cat=$(echo $d | cut -d'|' -f3 | xargs)
-	max_runtime=$(echo $d | cut -d'|' -f4 | xargs)
-	max_runtime=${max_runtime:--1}
-	exp_exit=$(echo $d | cut -d'|' -f5 | xargs)
-	exp_exit=${exp_exit:--1}
-	exp_passed=$(echo $d | cut -d'|' -f6 | xargs)
-	exp_passed=${exp_passed:--1}
-	exp_failed=$(echo $d | cut -d'|' -f7 | xargs)
-	exp_failed=${exp_failed:--1}
-	exp_broken=$(echo $d | cut -d'|' -f8 | xargs)
-	exp_broken=${exp_broken:--1}
-	description=$(echo $d | cut -d'|' -f9)
-
-	test_nr=$(($test_nr + 1))
-
-	cur_fails=0
-
-	if [ -z "$description" ]; then
-		description="$file (LTP_TIMEOUT_MUL='$timeout')"
-	fi
+	echo "Failed tests: $failed"
+	return $failed
+}
 
-	echo "=== $test_nr/$test_max $description ==="
-	run_test "$file" "$timeout" "$use_cat"
 
-	if [ $max_runtime -ne -1 ] && [ $test_duration -gt $max_runtime ]; then
-		echo "FAILED (runtime: $test_duration, expected less than $max_runtime)"
-		cur_fails=$((cur_fails + 1))
+print_results()
+{
+	echo
+	if [ -n "$raw_shell" ]; then
+		result=$(printf "%s\n%-15s %s" "$result" "$raw_shell" "INTERRUPTED")
+		failed_shells=$((failed_shells + 1))
 	fi
-
-	if [ $exp_passed -ne -1 ] && [ $exp_passed -ne $test_passed ]; then
-		echo "FAILED (passes: $test_passed, expected $exp_passed)"
-		cur_fails=$((cur_fails + 1))
+	echo
+	echo "----------------------------------------"
+	echo
+	echo "Summary:"
+	echo "$result"
+	echo
+	if [ $failed_shells -ne 0 ]; then
+		echo "A total number of $total_fails failed for $failed_shells shells"
+	else
+		echo "All tests passed"
 	fi
+}
 
-	if [ $exp_failed -ne -1 ] && [ $exp_failed -ne $test_failed ]; then
-		echo "FAILED (failed: $test_failed, expected $exp_failed)"
-		cur_fails=$((cur_fails + 1))
-	fi
+# For some reason at least in zsh, it can happen, that the whole
+# testrunner is killed, when the test result is piped through cat.
+# If the test was aborted using CTRL^C or kill, the output can be ignored,
+# otherwise these messages should never be visible.
+trap 'echo; echo "Test unexpectedly killed by SIGINT."; print_results; exit 1' INT
+trap 'echo; echo "Test unexpectedly killed by SIGTERM."; print_results; exit 1' TERM
 
-	if [ $exp_broken -ne -1 ] && [ $exp_broken -ne $test_broken ]; then
-		echo "FAILED (broken: $test_broken, expected $exp_broken)"
-		cur_fails=$((cur_fails + 1))
-	fi
+old_ifs="$IFS"
+IFS=$(printf "\n\b")
 
-	if [ $exp_exit -ne -1 ] && [ $test_exit -ne $exp_exit ]; then
-		echo "FAILED (exit code: $test_exit, expected $exp_exit)"
-		cur_fails=$((cur_fails + 1))
-	fi
+failed_shells=0
+total_fails=0
 
-	if [ $cur_fails -gt 0 ]; then
-		failed=$((failed + 1))
-		echo "--------"
-		echo "$test_output"
-		echo "--------"
+# Remove comments and empty lines
+CLEANED_SHELLS=$(echo "$SHELLS" | sed '/^\s*#/d;/^\s*$/d')
+shell_max=$(echo "$CLEANED_SHELLS" | wc -l)
+shell_nr=0
+result=""
+for raw_shell in $CLEANED_SHELLS; do
+	shell_nr=$(( shell_nr + 1 ))
+	echo "($shell_nr/$shell_max) Testing timeout in shell API with '$raw_shell'"
+	shellarg=$(echo "$raw_shell" | cut -sd' ' -f2)
+	shell=$(echo "$raw_shell" | cut -d' ' -f1)
+	res="BROKEN"
+	if ! $shell $shellarg -c true 2>/dev/null; then
+		echo "SKIPED: Shell not found"
+		res="SKIPED"
 	else
-		echo "PASSED"
+		res="PASSED"
+		do_test "$shell" "$shellarg"
+		if [ $? -ne 0 ]; then
+			res="FAILED ($?)"
+			total_fails=$((total_fails + $?))
+			failed_shells=$((failed_shells + 1))
+		fi
 	fi
-	echo
+	result=$(printf "%s\n%-15s %s" "$result" "$raw_shell" "$res")
 done
-IFS="$old_ifs"
+raw_shell=""
 
-echo "Failed tests: $failed"
-exit $failed
+print_results
+exit $failed_shells
-- 
2.25.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
