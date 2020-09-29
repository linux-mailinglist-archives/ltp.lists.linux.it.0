Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1765527BB61
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 05:15:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4209C3C2B92
	for <lists+linux-ltp@lfdr.de>; Tue, 29 Sep 2020 05:15:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id D35F73C2B5C
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 05:15:00 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 83D2910009B6
 for <ltp@lists.linux.it>; Tue, 29 Sep 2020 05:14:59 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,316,1596470400"; d="scan'208";a="99698334"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 29 Sep 2020 11:14:54 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 81A2348990CC;
 Tue, 29 Sep 2020 11:14:48 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 29 Sep 2020 11:14:47 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Tue, 29 Sep 2020 11:14:45 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <liwang@redhat.com>, <chrubis@suse.cz>, <pvorel@suse.cz>,
 <jstancek@redhat.com>
Date: Tue, 29 Sep 2020 10:56:06 +0800
Message-ID: <20200929025606.322543-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 81A2348990CC.AA3F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] controllers/cpuset_base_ops_testset.sh: Accept either
 0 or -EINVAL when passing '0-'
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
Cc: rpalethorpe@suse.com, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

When we write '0-' to cpuset.cpus/cpuset.mems, new bitmap_parselist()
in kernel(e.g. newer than v4.2) treats it as an invalid value and old
one treats it as a valid '0':
-------------------------------------------
on v5.8.0:
 # echo 0- > cpuset.cpus
 -bash: echo: write error: Invalid argument
 # echo 0- > cpuset.mems
 -bash: echo: write error: Invalid argument

on v4.0.0:
 # echo '0-' >cpuset.cpus
 # cat cpuset.cpus
 0
 # echo '0-' >cpuset.mems
 # cat cpuset.cpus
 0
-------------------------------------------
Note: commit d9282cb66353b changes the behavior.

Drop the check of kernel version and accept either 0 or -EINVAL
because the change of behavior can be backported into old kernel.

Fixes: #695
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---

Hi Cyril, Petr, Jan, Li

Do you think it is better to remove '0-' subtest directly?

 .../cpuset_base_ops_testset.sh                | 47 ++++++++-----------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_base_ops_test/cpuset_base_ops_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_base_ops_test/cpuset_base_ops_testset.sh
index 67f3611d7..1fa40d2d9 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_base_ops_test/cpuset_base_ops_testset.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_base_ops_test/cpuset_base_ops_testset.sh
@@ -45,7 +45,7 @@ base_op_write_and_test()
 {
 	local write_file="$1"
 	local write_string="$2"
-	local expect_string="$3"
+	local expect_strings="$3"
 	local write_result=
 	local ret=0
 
@@ -59,24 +59,27 @@ base_op_write_and_test()
 	ret=$?
 	write_result="$(cat "$write_file")"
 
-	case "$expect_string" in
-	EMPTY)
-		test -z "$write_result" -a $ret = 0
-		ret=$?
-		;;
-	WRITE_ERROR)
-		ret=$((!$ret))
-		;;
-	*)
-		test "$expect_string" = "$write_result" -a $ret = 0
-		ret=$?
-		;;
-	esac
+	for expect_string in $(echo $expect_strings | sed 's/|/ /'); do
+		case "$expect_string" in
+		EMPTY)
+			test -z "$write_result" -a $ret = 0
+			ret=$?
+			;;
+		WRITE_ERROR)
+			ret=$((!$ret))
+			;;
+		*)
+			test "$expect_string" = "$write_result" -a $ret = 0
+			ret=$?
+			;;
+		esac
+		[ $ret -eq 0 ] && break
+	done
 
 	if [ $ret -eq 0 ]; then
 		tst_resm TPASS "$cfile_name: Get the expected string"
 	else
-		tst_resm TFAIL "$cfile_name: Test result - $write_result Expected string - \"$expect_string\""
+		tst_resm TFAIL "$cfile_name: Test result - $write_result Expected string - \"$expect_strings\""
 	fi
 	return $ret
 }
@@ -114,6 +117,7 @@ test_cpus()
 		${cpus_all}$nr_cpus			WRITE_ERROR
 		0,0					0
 		0-0					0
+		0-					0|WRITE_ERROR
 		0-$((nr_cpus-1))			0-$((nr_cpus-1))
 		-1					WRITE_ERROR
 		0-$nr_cpus				WRITE_ERROR
@@ -127,12 +131,6 @@ test_cpus()
 		base_op_test "$CPUSET/1/cpuset.cpus" "0,1-$((nr_cpus-2)),$((nr_cpus-1))" "0-$((nr_cpus-1))"
 		base_op_test "$CPUSET/1/cpuset.cpus" "0,1-$((nr_cpus-2))," "0-$((nr_cpus-2))"
 	fi
-
-	if tst_kvcmp -lt "3.0 RHEL6:2.6.32"; then
-		base_op_test "$CPUSET/1/cpuset.cpus" "0-" "WRITE_ERROR"
-	else
-		base_op_test "$CPUSET/1/cpuset.cpus" "0-" "0"
-	fi
 }
 
 test_mems()
@@ -149,6 +147,7 @@ test_mems()
 		${mems_all}$nr_mems			WRITE_ERROR
 		0,0					0
 		0-0					0
+		0-					0|WRITE_ERROR
 		0-$((nr_mems-1))			0-$((nr_mems-1))
 		-1					WRITE_ERROR
 		0-$nr_mems				WRITE_ERROR
@@ -162,12 +161,6 @@ test_mems()
 		base_op_test "$CPUSET/1/cpuset.mems" "0,1-$((nr_mems-2)),$((nr_mems-1))" "0-$((nr_mems-1))"
 		base_op_test "$CPUSET/1/cpuset.mems" "0,1-$((nr_mems-2))," "0-$((nr_mems-2))"
 	fi
-
-	if tst_kvcmp -lt "3.0 RHEL6:2.6.32"; then
-		base_op_test "$CPUSET/1/cpuset.mems" "0-" "WRITE_ERROR"
-	else
-		base_op_test "$CPUSET/1/cpuset.mems" "0-" "0"
-	fi
 }
 
 test_flags()
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
