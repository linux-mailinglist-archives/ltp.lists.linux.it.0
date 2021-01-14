Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E852F5726
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 03:18:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A85A03C5DCA
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 03:18:36 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 6388B3C266E
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 03:18:33 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 7705F600BD2
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 03:18:32 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.79,345,1602518400"; d="scan'208";a="103462657"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 14 Jan 2021 10:18:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id E85AA4CE1A08;
 Thu, 14 Jan 2021 10:18:25 +0800 (CST)
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 Jan 2021 10:18:25 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Thu, 14 Jan 2021 10:18:47 +0800
Message-ID: <1610590728-15813-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <X/8ehCeZbWs6TIA4@yuki.lan>
References: <X/8ehCeZbWs6TIA4@yuki.lan>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E85AA4CE1A08.ADB3C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.4
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v3 1/2] cpuset: skip test when cpu or nodes are not
 numbered continuously from 0
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

These cpuset cases(cpuset_base_ops_test, cpuset_hierarchy_test, cpuset_inherit_test...)
seem all not consider the situation(cpus/memory are not numbered continuously). It is
continuously from 0 as default. Skip test if there are not numbered continuously to
avoid unexpected error.

This patch also fix cpu_inherit error by using original mem value.

cpuset_inherit case fails on 4 numa nodes pc, as below:
cpuset_inherit 1 TPASS: cpus: Inherited information is right!
cpuset_inherit 3 TPASS: cpus: Inherited information is right!
cpuset_inherit 5 TPASS: cpus: Inherited information is right!
cpuset_inherit 7 TPASS: cpus: Inherited information is right!
cpuset_inherit 9 TPASS: cpus: Inherited information is right!
cpuset_inherit 11 TPASS: cpus: Inherited information is right!
cpuset_inherit 13 TPASS: mems: Inherited information is right!
cpuset_inherit 15 TPASS: mems: Inherited information is right!
cpuset_inherit 17 TPASS: mems: Inherited information is right!
cpuset_inherit 19 TPASS: mems: Inherited information is right!
cpuset_inherit 21 TPASS: mems: Inherited information is right!
cpuset_inherit 23 TFAIL: mems: Test result - 0-3 Expected string - "4"

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 .../kernel/controllers/cpuset/cpuset_funcs.sh | 29 +++++++++++++++++--
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
index f4365af2c..84b87d17e 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_funcs.sh
@@ -26,23 +26,34 @@
 
 . test.sh
 
+cpu_string="`cat /sys/devices/system/cpu/online`"
 NR_CPUS=`tst_ncpus`
+
 if [ -f "/sys/devices/system/node/has_high_memory" ]; then
-	N_NODES="`cat /sys/devices/system/node/has_high_memory | tr ',' ' '`"
+	mem_string="`cat /sys/devices/system/node/has_high_memory`"
 else
-	N_NODES="`cat /sys/devices/system/node/has_normal_memory | tr ',' ' '`"
+	mem_string="`cat /sys/devices/system/node/has_normal_memory`"
 fi
+N_NODES="`echo $mem_string | tr ',' ' '`"
 count=0
+final_node=0
 for item in $N_NODES; do
 	delta=1
 	if [ "${item#*-*}" != "$item" ]; then
 		delta=$((${item#*-*} - ${item%*-*} + 1))
 	fi
+	final_node=${item#*-*}
 	count=$((count + $delta))
 done
+final_node=$((final_node + 1))
 N_NODES=$count
 
-mem_string="$N_NODES"
+final_cpu=0
+N_CPUS="`echo $cpu_string | tr ',' ' '`"
+for item in $N_CPUS; do
+	final_cpu=${item#*-*}
+done
+final_cpu=$((final_cpu + 1))
 
 CPUSET="/dev/cpuset"
 CPUSET_TMP="/tmp/cpuset_tmp"
@@ -78,6 +89,12 @@ ncpus_check()
 	if [ $NR_CPUS -lt $1 ]; then
 		tst_brkm TCONF "The total of CPUs is less than $1"
 	fi
+	# check online cpus whether match 0-num
+	if [ $final_cpu -eq $NR_CPUS ]; then
+		tst_resm TINFO "CPUs are numbered continuously starting at 0 ($cpu_string)"
+	else
+		tst_brkm TCONF "CPUs are not numbered continuously starting at 0 ($cpu_string)"
+	fi
 }
 
 nnodes_check()
@@ -85,6 +102,12 @@ nnodes_check()
 	if [ $N_NODES -lt $1 ]; then
 		tst_brkm TCONF "The total of nodes is less than $1"
 	fi
+	# check online nodes whether match 0-num
+	if [ $final_node -eq $N_NODES ]; then
+		tst_resm TINFO "Nodes are numbered continuously starting at 0 ($mem_string)"
+	else
+		tst_brkm TCONF "Nodes are not numbered continuously starting at 0 ($mem_string)"
+	fi
 }
 
 user_check()
-- 
2.23.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
