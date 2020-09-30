Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A77927EA69
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 15:57:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2113E3C2A24
	for <lists+linux-ltp@lfdr.de>; Wed, 30 Sep 2020 15:57:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 485FF3C04C3
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 15:57:33 +0200 (CEST)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id E70766009AD
 for <ltp@lists.linux.it>; Wed, 30 Sep 2020 15:57:32 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,322,1596470400"; d="scan'208";a="99788195"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 30 Sep 2020 21:57:29 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
 by cn.fujitsu.com (Postfix) with ESMTP id 0D9E248990DE;
 Wed, 30 Sep 2020 21:57:27 +0800 (CST)
Received: from G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 30 Sep 2020 21:57:26 +0800
Received: from Fedora-31.g08.fujitsu.local (10.167.220.31) by
 G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) with Microsoft SMTP Server
 id 15.0.1497.2 via Frontend Transport; Wed, 30 Sep 2020 21:57:24 +0800
From: Xiao Yang <yangx.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Wed, 30 Sep 2020 21:38:46 +0800
Message-ID: <20200930133846.10034-1-yangx.jy@cn.fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 0D9E248990DE.AD391
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: yangx.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2] controllers/cpuset_base_ops_testset.sh: Only
 verify '0-' subtest on kernel v4.3 or newer
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
Cc: rpalethorpe@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

1) According to the previous kernel check, '0-' is an invalid
   value on very old kernel(i.e. v3.0 or older).
2) '0-' becomes a valid '0' on old kernel(e.g. between v3.1 and v4.2).
3) '0-' becomes an invalid value again by commit d9282cb66353b
   on new kernel(e.g. v4.3 kernel or newer).
For example:
-------------------------------------------
On v5.8.0:
 # echo 0- > cpuset.cpus
 -bash: echo: write error: Invalid argument
 # echo 0- > cpuset.mems
 -bash: echo: write error: Invalid argument

On v4.0.0:
 # echo '0-' >cpuset.cpus
 # cat cpuset.cpus
 0
 # echo '0-' >cpuset.mems
 # cat cpuset.cpus
 0
-------------------------------------------

In this case, only verify(focus on) '0-' subtest on kernel v4.3
or newer due to two reasons:
1) It may catch a bug on mainline kernel in future.
2) It doesn't trigger any bug on old kernel currently.

Fixes: #695
Signed-off-by: Xiao Yang <yangx.jy@cn.fujitsu.com>
---
 .../cpuset_base_ops_test/cpuset_base_ops_testset.sh       | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_base_ops_test/cpuset_base_ops_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_base_ops_test/cpuset_base_ops_testset.sh
index 67f3611d7..367c95d2b 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_base_ops_test/cpuset_base_ops_testset.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_base_ops_test/cpuset_base_ops_testset.sh
@@ -128,10 +128,8 @@ test_cpus()
 		base_op_test "$CPUSET/1/cpuset.cpus" "0,1-$((nr_cpus-2))," "0-$((nr_cpus-2))"
 	fi
 
-	if tst_kvcmp -lt "3.0 RHEL6:2.6.32"; then
+	if tst_kvcmp -ge "4.3"; then
 		base_op_test "$CPUSET/1/cpuset.cpus" "0-" "WRITE_ERROR"
-	else
-		base_op_test "$CPUSET/1/cpuset.cpus" "0-" "0"
 	fi
 }
 
@@ -163,10 +161,8 @@ test_mems()
 		base_op_test "$CPUSET/1/cpuset.mems" "0,1-$((nr_mems-2))," "0-$((nr_mems-2))"
 	fi
 
-	if tst_kvcmp -lt "3.0 RHEL6:2.6.32"; then
+	if tst_kvcmp -ge "4.3"; then
 		base_op_test "$CPUSET/1/cpuset.mems" "0-" "WRITE_ERROR"
-	else
-		base_op_test "$CPUSET/1/cpuset.mems" "0-" "0"
 	fi
 }
 
-- 
2.25.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
