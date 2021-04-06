Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8F2355164
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 12:58:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 180933C1E19
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Apr 2021 12:58:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8259F3C1DFC
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 12:58:10 +0200 (CEST)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id E47096007BA
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 12:58:08 +0200 (CEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FF4FM629Gzrd9n
 for <ltp@lists.linux.it>; Tue,  6 Apr 2021 18:55:51 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 6 Apr 2021 18:57:53 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 6 Apr 2021 19:15:17 +0800
Message-ID: <1617707717-63693-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] cpuset/cpuset_memory_pressure_test: Check whether the
 swap partition is configured
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

--------------------------

1. Fixed a bug where a null value is obtained because swap is not in
   the fourth line of the free result
free -m
        total        used        free      shared  buff/cache   available
Mem:   128135        3857      120633         158        3644      123219
Swap:    8191          82        8109

free -m
        total       used       free     shared    buffers     cached
Mem:   419694       9464     410230        234        435       6005
-/+ buffers/cache:       3022     416671
Swap:    2053          0       2053

2. If no swap partition is configured in the test environment,
   the testcase will be failed:

cpuset_memory_pressure 7 TFAIL: sub group's memory_pressure
didn't have memory pressure rate.
cpuset_memory_pressure 9 TFAIL: root group's memory_pressure
didn't have memory pressure rate.
cpuset_memory_pressure 11 TFAIL: root group's memory_pressure
didn't have memory pressure rate.

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 .../cpuset_memory_pressure_testset.sh                        | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh b/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
index eddd7f6..2a2d2a1 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test/cpuset_memory_pressure_testset.sh
@@ -35,8 +35,16 @@ exit_status=0
 # usable physical memory
 py_mem=$(free -m | awk '{if(NR==2) print $4 + $6 + $7}')
 
-# free swap space
-sw_mem=$(free -m | awk '{if(NR==4) print $4}')
+# total swap space
+sw_mem=$(free -m | awk '{if(NR==4) print $2}')
+if [ -z $sw_mem ]; then
+	sw_mem=$(free -m | awk '{if(NR==3) print $2}')
+fi
+
+if [ $sw_mem -eq 0 ]; then
+	tst_resm TCONF "The size of the swap partition is zero."
+	exit 32
+fi
 
 # the memory which is going to be used
 usemem=$((py_mem - 20))
-- 
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
