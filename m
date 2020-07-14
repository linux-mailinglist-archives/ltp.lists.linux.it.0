Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F03AB21F867
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 19:45:12 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 96F643C4F93
	for <lists+linux-ltp@lfdr.de>; Tue, 14 Jul 2020 19:45:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 189053C286A
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 17:25:20 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 617AF60165D
 for <ltp@lists.linux.it>; Tue, 14 Jul 2020 17:25:19 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB1B930E;
 Tue, 14 Jul 2020 08:25:17 -0700 (PDT)
Received: from e107158-lin.cambridge.arm.com (e107158-lin.cambridge.arm.com
 [10.1.195.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4B1A23F792;
 Tue, 14 Jul 2020 08:25:17 -0700 (PDT)
From: Qais Yousef <qais.yousef@arm.com>
To: ltp@lists.linux.it
Date: Tue, 14 Jul 2020 16:25:10 +0100
Message-Id: <20200714152510.13470-1-qais.yousef@arm.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Tue, 14 Jul 2020 19:45:09 +0200
Subject: [LTP] [PATCH] cpuset_hotplug_test.sh: Fix a race condition
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
Cc: Qais Yousef <qais.yousef@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Cpuset performs hotplug updates asynchronously in the kernel. This would
lead to a race window where userspace could read a stale value before
the asynchronous update is performed (via a delayed work).

An attempt to fix the issue in the kernel failed.

https://lore.kernel.org/lkml/20200211141554.24181-1-qais.yousef@arm.com/T/#u

There was a patch to make the update synchronous, but it hit a wall and
was dropped

https://lore.kernel.org/lkml/F0388D99-84D7-453B-9B6B-EEFF0E7BE4CC@lca.pw/

The sleep is not ideal, but the maintainer has pushed back for a fix in
the kernel so far.

Fixes #693.
Signed-off-by: Qais Yousef <qais.yousef@arm.com>
---
 .../cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
index e973de7b9..1337e0cd6 100755
--- a/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
+++ b/testcases/kernel/controllers/cpuset/cpuset_hotplug_test/cpuset_hotplug_test.sh
@@ -86,6 +86,11 @@ root_cpu_hotplug_test()
 		return 1
 	fi
 
+	# cpuset hotplug is asynchronous operation, we could end up reading a
+	# stale value here. sleep is aweful, but we can't do better.
+	# See https://github.com/linux-test-project/ltp/issues/693
+	sleep 1
+
 	root_cpus="`cat $CPUSET/cpuset.cpus`"
 
 	task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
@@ -155,6 +160,11 @@ general_cpu_hotplug_test()
 		return 1
 	fi
 
+	# cpuset hotplug is asynchronous operation, we could end up reading a
+	# stale value here. sleep is aweful, but we can't do better.
+	# See https://github.com/linux-test-project/ltp/issues/693
+	sleep 1
+
 	cpus="`cat $path/cpuset.cpus`"
 
 	task_cpus="`cat /proc/$tst_pid/status | grep Cpus_allowed_list`"
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
