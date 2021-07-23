Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FC43D33FA
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 07:19:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 865C23C9507
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jul 2021 07:19:53 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B457A3C5917
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 07:19:49 +0200 (CEST)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5AB87100116E
 for <ltp@lists.linux.it>; Fri, 23 Jul 2021 07:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=170520fj; t=1627017587; i=@fujitsu.com;
 bh=Kz4xdtnYxi+/AqpESz+cM1e3SBw7Aer8P8wuP9wboT4=;
 h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=jLXPEFlamYCA2/GYhUv0Pr7bcfAXBe0t34tN/aYTp6HUnLjll+dqoCMcr7MusrAa9
 LJbxwvlw9sg5n+7+xAZ7wBnZ+5ZaZkUN7qCi19OZ5FL5adnOhpfkgzKPjE06+4s6RS
 zfs1WCpuPvqM2+H/G1JoP0Oi7zY/NqqnFEK6xMQgXOkDbK5b/kHvV9PZTpHD5vw7P0
 lKOGemxdBLXipaoY6PQw0B4R04KIMAym1vg3xhJNDj4Hhx+pxZvm7y7lZTkrCwYb8B
 N42eLALXdsZN+tiIQF0XgX45GaE5SSQ8Z2FvQ6nqiKy8bm9CQfvbYsPLS41c1TbKEd
 EU9Rhvjl1OnEw==
Received: from [100.113.6.189] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 19/80-03281-1715AF06;
 Fri, 23 Jul 2021 05:19:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrEIsWRWlGSWpSXmKPExsViZ8MRolsY+Cv
 B4OE+eYvpL46yWaz4voPRgclj3+91rB5nFhxhD2CKYs3MS8qvSGDNaOxqYSmYoFFx4EcnYwPj
 LKUuRk4OIYHXjBLvrxl2MXIB2XsYJWa3PGIHSbAJaEo861zADGKLCEhIdDS8BYszC7hLLN3aw
 wRiCwu4Snzd0soIYrMIqEos6p4LFucV8JS40f8OrFdCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
 VUjaLEpY5vjBB2hcSMGdvYJjDyzkLSMgtJywJGplWMlklFmekZJbmJmTm6hgYGuoaGxrrmuka
 mRnqJVbpJeqmlusmpeSVFiUBZvcTyYr3iytzknBS9vNSSTYzAoEspZP+zg/H66w96hxglOZiU
 RHnFzX8lCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgbQwAygkWpaanVqRl5gAjACYtwcGjJMK7z
 BUozVtckJhbnJkOkTrFqCglzvvOHyghAJLIKM2Da4NF3SVGWSlhXkYGBgYhnoLUotzMElT5V4
 ziHIxKwhBTeDLzSuCmvwJazAS0+FTXT5DFJYkIKakGpinNeZbiUwLsF/krhuV4Bm9YrXJtYeD
 10olPfvL1x56fr7TVfl1+3v2qHJfGZdcsJpzb86bshITS6YtR/8tsZWw872cvmKZouepm0/9j
 oWfSjhwzXFGybmNS+71b9Y4FJb+uOnnzLZZqvatR9U9bsTykRdWVu+vQWrlZOyZw/Vz+7aBIq
 fG6vUHa0x2sii2SXl59/OHhnJsFm7LLt15Xzolw/3/1j/z1b01vZJ4v23Ukq25GcFQER2MG05
 7irQlMTH+Vbki7B/yr2CwzUbhDIelvkuCUTJvSo7eXSIvcYFF9OJV5+UXh7cdu9hf73tqq7x+
 4vZ5PItZjc6H7Sk7Grnq9H8vDc7c//Pysk1v2sRJLcUaioRZzUXEiALX1GJg1AwAA
X-Env-Sender: xuyang2018.jy@fujitsu.com
X-Msg-Ref: server-9.tower-238.messagelabs.com!1627017584!105099!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12773 invoked from network); 23 Jul 2021 05:19:45 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
 by server-9.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jul 2021 05:19:45 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
 by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16N5JWpv014177
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Fri, 23 Jul 2021 06:19:38 +0100
Received: from localhost.localdomain (10.167.220.84) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 23 Jul 2021 06:19:29 +0100
From: Yang Xu <xuyang2018.jy@fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 23 Jul 2021 13:19:43 +0800
Message-ID: <1627017584-30405-1-git-send-email-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] lib/tst_hugepage: Fix .request_hugepages = 0 bug
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

Since ltp library doesn't call tst_request_hugepages
when using zero value, we don't set this value successfully.

Fix this by introducing TST_NO_HUGEPAGES flag. If you want to
keep zero hugepage for some ENOMEM case(like shmget02), please
use this flag instead of using 0 directly.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 doc/c-test-api.txt                     |  3 ++-
 include/tst_test.h                     |  5 +++-
 lib/newlib_tests/.gitignore            |  1 +
 lib/newlib_tests/test_zero_hugepage.c  | 35 ++++++++++++++++++++++++++
 lib/newlib_tests/test_zero_hugepage.sh | 13 ++++++++++
 lib/tst_hugepage.c                     |  6 +++++
 6 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 lib/newlib_tests/test_zero_hugepage.c
 create mode 100755 lib/newlib_tests/test_zero_hugepage.sh

diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
index 45784195b..6ec0a47eb 100644
--- a/doc/c-test-api.txt
+++ b/doc/c-test-api.txt
@@ -1908,7 +1908,8 @@ expected number of hugepage for testing in setup phase. If system does not
 have enough hpage for using, it will try the best to reserve 80% available
 number of hpages. With success test stores the reserved hugepage number in
 'tst_hugepages'. For the system without hugetlb supporting, variable
-'tst_hugepages' will be set to 0.
+'tst_hugepages' will be set to 0. If need zero hugepage on supported hugetlb
+system, please use '.request_hugepages = TST_NO_HUGEPAGES'.
 
 Also, we do cleanup and restore work for the hpages resetting automatically.
 
diff --git a/include/tst_test.h b/include/tst_test.h
index c7d77eb09..40c725995 100644
--- a/include/tst_test.h
+++ b/include/tst_test.h
@@ -125,6 +125,8 @@ struct tst_tag {
 
 extern unsigned int tst_variant;
 
+#define TST_NO_HUGEPAGES ((unsigned long)-1)
+
 struct tst_test {
 	/* number of tests available in test() function */
 	unsigned int tcnt;
@@ -175,7 +177,8 @@ struct tst_test {
 	 * have enough hpage for using, it will try the best to reserve 80% available
 	 * number of hpages. With success test stores the reserved hugepage number in
 	 * 'tst_hugepages. For the system without hugetlb supporting, variable
-	 * 'tst_hugepages' will be set to 0.
+	 * 'tst_hugepages' will be set to 0. If need zero hugepage on supported hugetlb
+	 * system, please use '.request_hugepages = TST_NO_HUGEPAGES'.
 	 *
 	 * Also, we do cleanup and restore work for the hpages resetting automatically.
 	 */
diff --git a/lib/newlib_tests/.gitignore b/lib/newlib_tests/.gitignore
index b51f6a679..807e510ee 100644
--- a/lib/newlib_tests/.gitignore
+++ b/lib/newlib_tests/.gitignore
@@ -44,3 +44,4 @@ test_macros04
 tst_fuzzy_sync01
 tst_fuzzy_sync02
 tst_fuzzy_sync03
+test_zero_hugepage
diff --git a/lib/newlib_tests/test_zero_hugepage.c b/lib/newlib_tests/test_zero_hugepage.c
new file mode 100644
index 000000000..0d85ce866
--- /dev/null
+++ b/lib/newlib_tests/test_zero_hugepage.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2021 Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*
+ * Tests .request_hugepages = TST_NO_HUGEPAGES
+ */
+
+#include "tst_test.h"
+#include "tst_hugepage.h"
+#include "tst_sys_conf.h"
+
+static void do_test(void)
+{
+	unsigned long val, hpages;
+
+	SAFE_FILE_SCANF(PATH_NR_HPAGES, "%lu", &val);
+	if (val != 0)
+		tst_brk(TBROK, "nr_hugepages = %lu, but expect 0", val);
+	else
+		tst_res(TPASS, "test .request_hugepages = TST_NO_HUGEPAGES");
+
+	hpages = tst_request_hugepages(3);
+	SAFE_FILE_SCANF(PATH_NR_HPAGES, "%lu", &val);
+	if (val != hpages)
+		tst_brk(TBROK, "nr_hugepages = %lu, but expect %lu", val, hpages);
+	else
+		tst_res(TPASS, "tst_request_hugepages");
+}
+
+static struct tst_test test = {
+	.test_all = do_test,
+	.request_hugepages = TST_NO_HUGEPAGES,
+};
diff --git a/lib/newlib_tests/test_zero_hugepage.sh b/lib/newlib_tests/test_zero_hugepage.sh
new file mode 100755
index 000000000..10113006b
--- /dev/null
+++ b/lib/newlib_tests/test_zero_hugepage.sh
@@ -0,0 +1,13 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2021 Yang Xu <xuyang2018.jy@fujitsu.com>
+
+echo "Testing .request_hugepages = TST_NO_HUGEPAGES"
+
+orig_value=`cat /proc/sys/vm/nr_hugepages`
+
+echo "128" > /proc/sys/vm/nr_hugepages
+
+./test_zero_hugepage
+
+echo $orig_value > /proc/sys/vm/nr_hugepages
diff --git a/lib/tst_hugepage.c b/lib/tst_hugepage.c
index 1d0e62e5b..a7585bc3d 100644
--- a/lib/tst_hugepage.c
+++ b/lib/tst_hugepage.c
@@ -34,6 +34,11 @@ unsigned long tst_request_hugepages(unsigned long hpages)
 	else
 		tst_hugepages = hpages;
 
+	if (hpages == TST_NO_HUGEPAGES) {
+		tst_hugepages = 0;
+		goto set_hugepages;
+	}
+
 	SAFE_FILE_PRINTF("/proc/sys/vm/drop_caches", "3");
 	max_hpages = SAFE_READ_MEMINFO("MemFree:") / SAFE_READ_MEMINFO("Hugepagesize:");
 
@@ -47,6 +52,7 @@ unsigned long tst_request_hugepages(unsigned long hpages)
 			goto out;
 	}
 
+set_hugepages:
 	tst_sys_conf_save("?/proc/sys/vm/nr_hugepages");
 	SAFE_FILE_PRINTF(PATH_NR_HPAGES, "%lu", tst_hugepages);
 	SAFE_FILE_SCANF(PATH_NR_HPAGES, "%lu", &val);
-- 
2.23.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
