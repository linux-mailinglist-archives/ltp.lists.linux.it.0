Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850510E8A8
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2019 11:20:01 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B208D3C2520
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Dec 2019 11:20:00 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8BA333C23B6
 for <ltp@lists.linux.it>; Mon,  2 Dec 2019 11:19:54 +0100 (CET)
Received: from mail-m972.mail.163.com (mail-m972.mail.163.com [123.126.97.2])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 380C5600952
 for <ltp@lists.linux.it>; Mon,  2 Dec 2019 11:19:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=pPuux
 yEBJiFAcFK4aubR+PWCjA+GvkTJy6Db4iPAvIE=; b=VbDh76aecG2QTEnHXc0Oc
 /wGvl2XT1zEErKQTR4/I9Pg+/wS3wq9lcKwH7DphC/qQYPG8oqAX5m8+p7MQAboV
 2TkWJTLngYOx2dmXHVQP7yzTaSLcbhvcSZkNbU6iZFQoiQqRklP57qRYLfAvI+7Q
 uVwGibxQy5Le4DX46MUhmo=
Received: from Fedora-30-workstation.localdomain (unknown [122.194.1.181])
 by smtp2 (Coremail) with SMTP id GtxpCgDX59lB5eRdA8PIAA--.18S2;
 Mon, 02 Dec 2019 18:19:46 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Mon,  2 Dec 2019 18:19:43 +0800
Message-Id: <20191202101943.17335-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CM-TRANSID: GtxpCgDX59lB5eRdA8PIAA--.18S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3XF1UWrykZr17Kw48GrWfXwb_yoWxGw4kpF
 47Cr1qgryjkrWjga4xtr9YqryruFn8tFW2qas0kw1Iy3W7JryvyF45Gr45ZFy3Ga43Z340
 ganYvF13ta1DCrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRC1v-UUUUU=
X-Originating-IP: [122.194.1.181]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEgR-XlZYGTeNZgAAs8
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] cpuhotplug05.sh: Rewrite test case
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

1) Replace sar command with /proc/stat
2) Convert to new API
3) Remove unused/duplicated code

Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 runtest/cpuhotplug                            |   2 +-
 .../cpu_hotplug/functional/cpuhotplug05.sh    | 186 ++++++------------
 2 files changed, 63 insertions(+), 125 deletions(-)

diff --git a/runtest/cpuhotplug b/runtest/cpuhotplug
index ec7f11ed1..bd97e01b8 100644
--- a/runtest/cpuhotplug
+++ b/runtest/cpuhotplug
@@ -4,6 +4,6 @@
 cpuhotplug02 cpuhotplug02.sh -c 1 -l 1
 cpuhotplug03 cpuhotplug03.sh -c 1 -l 1
 cpuhotplug04 cpuhotplug04.sh -l 1
-cpuhotplug05 cpuhotplug05.sh -c 1 -l 1 -d /tmp
+cpuhotplug05 cpuhotplug05.sh -c 1
 cpuhotplug06 cpuhotplug06.sh -c 1 -l 1
 cpuhotplug07 cpuhotplug07.sh -c 1 -l 1 -d /usr/src/linux
diff --git a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug05.sh b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug05.sh
index 95a8f4a2d..167cbc4a7 100755
--- a/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug05.sh
+++ b/testcases/kernel/hotplug/cpu_hotplug/functional/cpuhotplug05.sh
@@ -1,157 +1,95 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
 #
-# Test Case 5 - sar
-#
+# Test Case 5:
+# Check if /proc/stat can show correct cpu statistics
+# when cpu is onlined/offlined.
 
-export TCID="cpuhotplug05"
-export TST_TOTAL=1
-export LC_TIME="POSIX"
+TST_SETUP=do_setup
+TST_CLEANUP=do_clean
+TST_TESTFUNC=do_test
+TST_USAGE=cpuhotplug_usage
+TST_OPTS="c:"
+TST_PARSE_ARGS=cpuhotplug_parse_args
 
-# Includes:
-. test.sh
+. tst_test.sh
 . cpuhotplug_testsuite.sh
 . cpuhotplug_hotplug.sh
 
-cat <<EOF
-Name:   $TCID
-Date:   `date`
-Desc:   Does sar behave properly during CPU hotplug events?
+orig_online=0
 
-EOF
-
-usage()
+cpuhotplug_usage()
 {
-	cat << EOF
-	usage: $0 -c cpu -l loop -d directory
-
-	OPTIONS
-		-c  cpu which is specified for testing
-		-l  number of cycle test
-		-d  directory used to lay file
-
-EOF
-	exit 1
+	echo "usage: $0"
+	echo "OPTIONS"
+	echo "-c cpu  which cpu is specified for testing"
 }
 
-do_clean()
+cpuhotplug_parse_args()
 {
-	pid_is_valid ${SAR_PID} && kill_pid ${SAR_PID}
-	online_cpu "$CPU_TO_TEST"
+	case $1 in
+	c) cpu_num="$2";;
+	esac
 }
 
-get_field()
+do_clean()
 {
-	echo "$1" | awk "{print \$$2}"
+	[ $orig_online -eq 1 ] && online_cpu "$cpu_num"
+	[ $orig_online -eq 0 ] && offline_cpu "$cpu_num"
 }
 
-while getopts c:l:d: OPTION; do
-	case $OPTION in
-	c)
-		CPU_TO_TEST=$OPTARG;;
-	l)
-		HOTPLUG05_LOOPS=$OPTARG;;
-	d)
-		TMP=$OPTARG;;
-	?)
-		usage;;
-	esac
-done
-
-LOOP_COUNT=1
-
-tst_require_cmds sar
-
-if [ $(get_present_cpus_num) -lt 2 ]; then
-	tst_brkm TCONF "system doesn't have required CPU hotplug support"
-fi
-
-if [ -z "$CPU_TO_TEST" ]; then
-	tst_brkm TBROK "usage: ${0##*} <CPU to offline>"
-fi
+do_setup()
+{
+	[ $(get_present_cpus_num) -lt 2 ] && \
+		tst_brk TCONF "system doesn't have required cpu hotplug support"
 
-# Validate the specified CPU is available
-if ! cpu_is_valid "${CPU_TO_TEST}" ; then
-	tst_brkm TCONF "cpu${CPU_TO_TEST} doesn't support hotplug"
-fi
+	[ -z "$cpu_num" ] && \
+		tst_brk TBROK "didn't specify cpu number to test"
 
-# Check that the specified CPU is offline; if not, offline it
-if cpu_is_online "${CPU_TO_TEST}" ; then
-	if ! offline_cpu ${CPU_TO_TEST} ; then
-		tst_brkm TBROK "CPU${CPU_TO_TEST} cannot be offlined"
+	# Validate the specified cpu is available
+	if ! cpu_is_valid "$cpu_num" ; then
+		tst_brk TCONF "cpu${cpu_num} doesn't support hotplug"
 	fi
-fi
 
-TST_CLEANUP=do_clean
+	# Set orig_online to 1 if the specified cpu is online by default
+	cpu_is_online "$cpu_num" && orig_online=1
+}
 
-LOG_FILE="$TMP/log_$$"
+do_test()
+{
+	local passed=0
 
-until [ $LOOP_COUNT -gt $HOTPLUG05_LOOPS ]; do
+	# Online the specified cpu
+	online_cpu "$cpu_num" || \
+		tst_brk TBROK "cpu${cpu_num} cannot be onlined"
 
-	# Start up SAR and give it a couple cycles to run
-	sar 1 0 >/dev/null 2>&1 &
-	sleep 2
-	# "sar 1 0" is supported before 'sysstat-8.1.4(include sar)',
-	# after that use "sar 1" instead of. Use 'ps -C sar' to check.
-	if ps -C sar >/dev/null 2>&1; then
-		pkill sar
-		sar -P "$CPU_TO_TEST" 1 0 > "$LOG_FILE" &
-	else
-		sar -P "$CPU_TO_TEST" 1 > "$LOG_FILE" &
-	fi
-	sleep 2
-	SAR_PID=$!
-
-	# Since the CPU is offline, SAR should display all the 6 fields
-	# of CPU statistics as '0.00'
-	offline_status=$(tail -n 1 "$LOG_FILE")
-	if [ -z "$offline_status" ]; then
-		tst_brkm TBROK "SAR output file is empty"
+	if ! grep -q "^cpu${cpu_num}" /proc/stat; then
+		tst_res TFAIL \
+			"online cpu${cpu_num} doesn't appear in /proc/stat"
+		return 1
 	fi
 
-	cpu_field=$(get_field "$offline_status" "2")
-	if [ "${cpu_field}" = "CPU" ]; then
-		# Since sysstat-11.7.1, sar/sadf didn't display offline CPU
-		tst_resm TINFO "SAR didn't display offline CPU"
-	else
-		for i in $(seq 3 8); do
-			field=$(get_field "$offline_status" "$i")
-			if [ "$field" != "0.00" ]; then
-				tst_brkm TBROK "Field $i is '$field', '0.00' expected"
-			fi
-		done
-	fi
-
-	# Online the CPU
-	if ! online_cpu ${CPU_TO_TEST}; then
-		tst_brkm TBROK "CPU${CPU_TO_TEST} cannot be onlined"
-	fi
-
-	sleep 2
-
-	# Check that SAR registered the change in CPU online/offline states
-	online_status=$(tail -n 1 "$LOG_FILE")
-	check_passed=0
-	for i in $(seq 3 8); do
-		field_online=$(get_field "$online_status" "$i")
-
-		if [ "$field_online" != "0.00" ]; then
-			check_passed=1
-			break
-		fi
+	for field in $(seq 2 11); do
+		field_value=$(grep "^cpu${cpu_num}" /proc/stat | awk "{print \$$field}")
+		[ "$field_value" != "0" ] && passed=1
 	done
 
-	if [ $check_passed -eq 0 ]; then
-		tst_resm TFAIL "No change in the CPU statistics"
-		tst_exit
+	if [ $passed -eq 0 ]; then
+		tst_res TFAIL \
+			"all field of online cpu{cpu_num} shows zero in /proc/stat"
+		return 1
 	fi
 
-	offline_cpu ${CPU_TO_TEST}
-	kill_pid ${SAR_PID}
+	# Offline the specified cpu
+	offline_cpu "$cpu_num" || \
+		tst_brk TBROK "cpu${cpu_num} cannot be offlined"
 
-	LOOP_COUNT=$((LOOP_COUNT+1))
-
-done
+	if grep -q "^cpu${cpu_num}" /proc/stat; then
+		tst_res TFAIL "offline cpu${cpu_num} appears in /proc/stat"
+		return 1
+	fi
 
-tst_resm TPASS "SAR updated statistics after the CPU was turned on."
+	tst_res TPASS "/proc/stat shows correct cpu statistics"
+}
 
-tst_exit
+tst_run
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
