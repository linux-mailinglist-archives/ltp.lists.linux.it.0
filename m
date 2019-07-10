Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E6864875
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 16:35:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 553F33C1C7E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 16:35:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 9E1AE3C104A
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 16:35:36 +0200 (CEST)
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 4A7A31A016EA
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 16:35:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=7fd+NZtJiHXi+QqJh5
 0w68LFSzAKgRi5sINaguiSHyQ=; b=FsGQzmTKq6ywJ2jjUSn6LoWZtVcLkfE8mp
 XXIrbapcCUpVOrgfZNpMlYUDP59cmvnRlPG/n6cK3XgnfzkeqEhrjHaztuFJZ/Ni
 5OmLCpKwBN7O6ttk0ug2v5WxaDyK5AU4TYjNVo9W/HS1RMX5IkuxwAMuYEEIhaDW
 NISO9uxdI=
Received: from localhost.localdomain (unknown [121.237.61.237])
 by smtp11 (Coremail) with SMTP id D8CowAB3qmSs9yVdj2L2EQ--.55906S2;
 Wed, 10 Jul 2019 22:35:25 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Wed, 10 Jul 2019 22:35:10 +0800
Message-Id: <1562769310-4918-1-git-send-email-ice_yangxiao@163.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: D8CowAB3qmSs9yVdj2L2EQ--.55906S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xr4DKFWDZF1UZFykWr1kAFb_yoW7uF1rpF
 ZrGFy3uF48Ga42gay8AF18ZF43Aa13ZryUtry5G3yjvF1UJ3WkJFy29Fn8tas8GFWxZr12
 9a9YqrW7J3W8AFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07b1lkxUUUUU=
X-Originating-IP: [121.237.61.237]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEhntXlZYDWMtLgAAsb
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v3] rcu/rcu_torture.sh: Rewrite test
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

1) Cleanup and convert to new API
2) Update valid rcutorture types(rcu, srcu, srcud, tasks)

Note:
Exclude valid busted* types(busted, busted_srcud) that check
the test itself and expect failures, suggested by:
https://www.spinics.net/lists/kernel/msg3045252.html

Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 testcases/kernel/device-drivers/rcu/rcu_torture.sh | 142 +++++++++------------
 1 file changed, 63 insertions(+), 79 deletions(-)

diff --git a/testcases/kernel/device-drivers/rcu/rcu_torture.sh b/testcases/kernel/device-drivers/rcu/rcu_torture.sh
index c3739f9..9df4390 100755
--- a/testcases/kernel/device-drivers/rcu/rcu_torture.sh
+++ b/testcases/kernel/device-drivers/rcu/rcu_torture.sh
@@ -1,20 +1,7 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
 # Copyright (c) 2014-2015 Oracle and/or its affiliates. All Rights Reserved.
-#
-# This program is free software; you can redistribute it and/or
-# modify it under the terms of the GNU General Public License as
-# published by the Free Software Foundation; either version 2 of
-# the License, or (at your option) any later version.
-#
-# This program is distributed in the hope that it would be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License
-# along with this program; if not, write the Free Software Foundation,
-# Inc.,  51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
-#
+# Copyright (C) 2019 Xiao Yang <ice_yangxiao@163.com>
 # Author: Alexey Kodanev <alexey.kodanev@oracle.com>
 #
 # One of the possible ways to test RCU is to use rcutorture kernel module.
@@ -23,89 +10,86 @@
 # dmesg output for module's test results.
 # For more information, please read Linux Documentation: RCU/torture.txt
 
-TCID="rcu_torture"
-TST_TOTAL=14
-TST_CLEANUP=cleanup
+TST_CNT=4
+TST_SETUP=rcutorture_setup
+TST_TESTFUNC=do_test
+TST_NEEDS_ROOT=1
+TST_NEEDS_CMDS="modprobe dmesg sed tail"
+TST_OPTS="t:w:"
+TST_USAGE=rcutorture_usage
+TST_PARSE_ARGS=rcutorture_parse_args
 
-. test.sh
+. tst_test.sh
 
 # default options
-test_time=60
+test_time=30
 num_writers=5
 
-while getopts :ht:w: opt; do
-	case "$opt" in
-	h)
-		echo "Usage:"
-		echo "h        help"
-		echo "t x      time in seconds for each test-case"
-		echo "w x      number of writers"
-		exit 0
-	;;
-	t) test_time=$OPTARG ;;
-	w) num_writers=$OPTARG ;;
-	*)
-		tst_brkm TBROK "unknown option: $opt"
-	;;
-	esac
-done
-
-cleanup()
+rcutorture_usage()
 {
-	tst_resm TINFO "cleanup"
-	rmmod rcutorture > /dev/null 2>&1
+	echo "Usage:"
+	echo "-t x    time in seconds for each test-case"
+	echo "-w x    number of writers"
 }
 
-tst_require_root
-
-# check if module is present
-modprobe rcutorture > /dev/null 2>&1 || \
-	tst_brkm TCONF "Test requires rcutorture module"
-rmmod rcutorture > /dev/null 2>&1
-
-trap cleanup INT
-
-rcu_type="rcu rcu_bh srcu sched"
+rcutorture_parse_args()
+{
+	case $1 in
+	t) test_time=$2 ;;
+	w) num_writers=$2 ;;
+	esac
+}
 
-if tst_kvcmp -lt "3.12"; then
-	rcu_type="$rcu_type rcu_sync rcu_expedited rcu_bh_sync rcu_bh_expedited \
-	          srcu_sync srcu_expedited sched_sync sched_expedited"
+rcutorture_setup()
+{
+	local module=1
 
-	if tst_kvcmp -lt "3.11"; then
-		rcu_type="$rcu_type srcu_raw srcu_raw_sync"
-	fi
-fi
+	# check if rcutorture is built as a kernel module by inserting
+	# and then removing it
+	modprobe rcutorture >/dev/null 2>&1 ||  module=0
+	modprobe -r rcutorture >/dev/null 2>&1 || module=0
 
-TST_TOTAL=$(echo "$rcu_type" | wc -w)
+	[ $module -eq 0 ] && \
+		tst_brk TCONF "rcutorture is built-in, non-existent or in use"
+}
 
-est_time=`echo "scale=2; $test_time * $TST_TOTAL / 60 " | bc`
-tst_resm TINFO "estimate time $est_time min"
+rcutorture_test()
+{
+	local rcu_type=$1
 
-for type in $rcu_type; do
+	tst_res TINFO "${rcu_type}-torture: running ${test_time} sec..."
 
-	tst_resm TINFO "$type: running $test_time sec..."
+	modprobe rcutorture nfakewriters=${num_writers} \
+		torture_type=${rcu_type} >/dev/null 2>&1
+	if [ $? -ne 0 ]; then
+		dmesg | grep -q "invalid torture type: \"${rcu_type}\"" && \
+			tst_brk TCONF "invalid ${rcu_type} type"
 
-	modprobe rcutorture nfakewriters=$num_writers \
-	         stat_interval=60 test_no_idle_hz=1 shuffle_interval=3 \
-	         stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 \
-	         fqs_stutter=3 test_boost=1 test_boost_interval=7 \
-	         test_boost_duration=4 shutdown_secs=0 \
-	         stall_cpu=0 stall_cpu_holdoff=10 n_barrier_cbs=0 \
-	         onoff_interval=0 onoff_holdoff=0 torture_type=$type \
-	         > /dev/null 2>&1 || tst_brkm TBROK "failed to load module"
+		tst_brk TBROK "failed to load module"
+	fi
 
-	sleep $test_time
+	sleep ${test_time}
 
-	rmmod rcutorture > /dev/null 2>&1 || \
-		tst_brkm TBROK "failed to unload module"
+	modprobe -r rcutorture >/dev/null 2>&1 || \
+		tst_brk TBROK "failed to unload module"
 
 	# check module status in dmesg
-	result_str=`dmesg | sed -nE '$s/.*End of test: ([A-Z]+):.*/\1/p'`
-	if [ "$result_str" = "SUCCESS" ]; then
-		tst_resm TPASS "$type: completed"
+	local res=$(dmesg | sed -nE "s/.* ${rcu_type}-torture:.* End of test: (.*): .*/\1/p" | tail -n1)
+	if [ "$res" = "SUCCESS" ]; then
+		tst_res TPASS "${rcu_type}-torture: $res"
 	else
-		tst_resm TFAIL "$type: $result_str, see dmesg"
+		tst_res TFAIL "${rcu_type}-torture: $res, see dmesg"
 	fi
-done
+}
+
+do_test()
+{
+	case $1 in
+	1) rcutorture_test rcu;;
+	2) rcutorture_test srcu;;
+	3) rcutorture_test srcud;;
+	4) rcutorture_test tasks;;
+	esac
+}
 
-tst_exit
+tst_run
-- 
1.8.3.1



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
