Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 63101190361
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 02:50:20 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EC8D3C4E55
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Mar 2020 02:50:20 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 23B173C2312
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 02:50:17 +0100 (CET)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 4E82A1A009AC
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 02:50:13 +0100 (CET)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 1D1539F4634DACE0FC25
 for <ltp@lists.linux.it>; Tue, 24 Mar 2020 09:50:11 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Tue, 24 Mar 2020 09:50:01 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 24 Mar 2020 09:56:38 +0800
Message-ID: <1585014998-27587-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] open_posix_testsuite: Fix compilation issues
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
Cc: Zou Wei <zou_wei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Fix compilation issues:
1. Add the '-lpthread -lrt -lm' config into LDFLAGS
2. Add the '-pthread' config into CFLAGS
3. Update makefile and locate-test script

If only add -pthread to LDFLAGS and CFLAGS,
some cases will fail to compile, such as timers/twoevtimers.c,
need to add -lrt to compile successfully.

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 testcases/open_posix_testsuite/CFLAGS              | 2 +-
 testcases/open_posix_testsuite/LDFLAGS             | 1 +
 testcases/open_posix_testsuite/functional/Makefile | 2 +-
 testcases/open_posix_testsuite/scripts/locate-test | 2 +-
 testcases/open_posix_testsuite/stress/Makefile     | 2 +-
 5 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/testcases/open_posix_testsuite/CFLAGS b/testcases/open_posix_testsuite/CFLAGS
index 297d292..6330fa9 100644
--- a/testcases/open_posix_testsuite/CFLAGS
+++ b/testcases/open_posix_testsuite/CFLAGS
@@ -1 +1 @@
--std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -W -Wall
+-std=c99 -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -W -Wall -pthread
diff --git a/testcases/open_posix_testsuite/LDFLAGS b/testcases/open_posix_testsuite/LDFLAGS
index e69de29..6c112d3 100644
--- a/testcases/open_posix_testsuite/LDFLAGS
+++ b/testcases/open_posix_testsuite/LDFLAGS
@@ -0,0 +1 @@
+-lpthread -lrt -lm
diff --git a/testcases/open_posix_testsuite/functional/Makefile b/testcases/open_posix_testsuite/functional/Makefile
index 3b22c89..50e03aa 100644
--- a/testcases/open_posix_testsuite/functional/Makefile
+++ b/testcases/open_posix_testsuite/functional/Makefile
@@ -5,7 +5,7 @@
 #

 all clean install test:
-	@for dir in `ls -d */Makefile 2>/dev/null | sed -e 's,/Makefile$$,,g'`; do \
+	@for dir in `find . -name *Makefile | egrep -v '^./Makefile' | sed -e 's,/Makefile$$,,g'`; do \
 		$(MAKE) -C $$dir $@;						   \
 	done

diff --git a/testcases/open_posix_testsuite/scripts/locate-test b/testcases/open_posix_testsuite/scripts/locate-test
index 27f0bb5..e4ef994 100755
--- a/testcases/open_posix_testsuite/scripts/locate-test
+++ b/testcases/open_posix_testsuite/scripts/locate-test
@@ -92,7 +92,7 @@ runnable)
 	# waltz down the tools directory and try and build t0 (which doesn't
 	# make sense as it's a tool, not a test). Better criterion needs to
 	# be established for this file.
-	find "$WHERE/conformance" "$WHERE/stress" -type f -name '*[0-9].c' -o -name '[0-9]*-[0-9]*.sh' | grep -v buildonly | grep -v '^./tools'
+	find "$WHERE/conformance" "$WHERE/stress" -type f -name '*[0-9a-z].c' -o -name '[0-9]*-[0-9]*.sh' | grep -v buildonly | grep -v '^./tools' | grep -v 'testfrmw.c$'
 	find "$WHERE/functional" -type f -name '*.c'
 	;;
 test-tools)
diff --git a/testcases/open_posix_testsuite/stress/Makefile b/testcases/open_posix_testsuite/stress/Makefile
index b09527f..d6872a9 100644
--- a/testcases/open_posix_testsuite/stress/Makefile
+++ b/testcases/open_posix_testsuite/stress/Makefile
@@ -5,7 +5,7 @@
 #

 all clean install test:
-	@for dir in `ls -d */Makefile 2>/dev/null | sed -e 's,/Makefile$$,,g'`; do \
+	@for dir in `find . -name *Makefile | egrep -v '^./Makefile' | sed -e 's,/Makefile$$,,g'`; do \
 		$(MAKE) -C $$dir $@;						  \
 	done

--
2.6.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
