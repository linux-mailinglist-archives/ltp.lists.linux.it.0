Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 878598A6649
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Apr 2024 10:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1713256714; h=to : date :
 message-id : mime-version : subject : list-id : list-unsubscribe :
 list-archive : list-post : list-help : list-subscribe : from :
 reply-to : content-type : content-transfer-encoding : sender : from;
 bh=JuZr4Tgvt2dDmFxVpfEwAfxBaEy5lhhQ6L2v3YpiLxA=;
 b=Pblik7eYdviNHrWHsF8zbO+iPqg03b4r6RouaTUtxZ+s9+U4WoEWW8AxDMlihqlx69yNn
 t31Uai63LUaQs4t9ie6XMXj1y39011PZftml3WC/IyKB+e/098xEVxrLtF3lVAe5f9clb7z
 TZ9gOfGdD8vcS7IIBKR+GcjKMrzswPI=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 453F63CFA82
	for <lists+linux-ltp@lfdr.de>; Tue, 16 Apr 2024 10:38:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 47B663CFA81
 for <ltp@lists.linux.it>; Tue, 16 Apr 2024 10:38:32 +0200 (CEST)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=fujitsu.com (client-ip=139.138.36.223;
 helo=esa9.hc1455-7.c3s2.iphmx.com; envelope-from=xuyang2018.jy@fujitsu.com;
 receiver=lists.linux.it)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com
 [139.138.36.223])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7DB1B1A01526
 for <ltp@lists.linux.it>; Tue, 16 Apr 2024 10:38:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1713256709; x=1744792709;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u6HZSB7osPbMumWMhxWsugsIf817u2gziS1PWstLIgQ=;
 b=qOEaHIaGXykpGXalvo5mzfSFkqiD6cpoXEmEsrUCA5x5dlqTyFoaQcCi
 rjo0o01ceK0bS+I57vhOL6NjsG26f0VCJ7HA/2aRAGJxuoFgKW11oedHl
 gjSL0a3cFztnirtZ+1B1MSjlnHSpgxUXc5Ge9/q9JaocGhxT1kBgQiISc
 7Ll4Vso0fLrLVOJQcaRDw6tm0JOTsQIULWSnFjZ7r87L8215wA5qg61BI
 Vl1oAAYR27brWz5en55i/fmxz/ZIAsSzJYUnrAabRpjS7dgu96J98kLTn
 J/37+5Wu9dyQva2RAJ3GoViMUbfF4aHJXzkyeDMMEx9d8UsHrug92otZA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="144188715"
X-IronPort-AV: E=Sophos;i="6.07,205,1708354800"; d="scan'208";a="144188715"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
 by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 17:38:27 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com
 [192.168.83.64])
 by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A56CAD5A42
 for <ltp@lists.linux.it>; Tue, 16 Apr 2024 17:38:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com
 [192.51.206.22])
 by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E3073CFAB1
 for <ltp@lists.linux.it>; Tue, 16 Apr 2024 17:38:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 79D7D6B5E9
 for <ltp@lists.linux.it>; Tue, 16 Apr 2024 17:38:24 +0900 (JST)
Received: from rhel93GA.g08.fujitsu.local (unknown [10.167.221.71])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 26FEA1A000A;
 Tue, 16 Apr 2024 16:38:24 +0800 (CST)
To: ltp@lists.linux.it
Date: Tue, 16 Apr 2024 04:04:14 -0400
Message-Id: <20240416080414.22637-1-xuyang2018.jy@fujitsu.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28324.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28324.006
X-TMASE-Result: 10--12.461900-10.000000
X-TMASE-MatchedRID: /+von0vPuFFSuJfEWZSQfB1kSRHxj+Z5TJDl9FKHbrlgPgeggVwCFnU3
 oKSu0J1xUh5maKIJAx/mn3xyPJAJoimyf2R1E4xpGYJhRh6ssesfimmlcABuNyfJTn+dmnFQGmV
 udEhnpoS1/NE2jc9NGGvtvwKw8+1BL7fGpDjikVaVF2HD8EHNpx4crFjzdzs4myiLZetSf8mfop
 0ytGwvXiq2rl3dzGQ1b9bbsgA6MLfUjMYN9sLnO1sN4eQUyg1j3GoPuot2oREbOcLGBwXJZw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH] gethostname: Add negative test for gethostname
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
From: Yang Xu via ltp <ltp@lists.linux.it>
Reply-To: Yang Xu <xuyang2018.jy@fujitsu.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Add negative cases for gethostname(), when errno is ENAMETOOLONG

Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
---
 runtest/syscalls                              |  1 +
 .../kernel/syscalls/gethostname/.gitignore    |  1 +
 .../syscalls/gethostname/gethostname02.c      | 41 +++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 testcases/kernel/syscalls/gethostname/gethostname02.c

diff --git a/runtest/syscalls b/runtest/syscalls
index de4f5a633..cc1e39c05 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -477,6 +477,7 @@ gethostbyname_r01 gethostbyname_r01
 gethostid01 gethostid01
 
 gethostname01 gethostname01
+gethostname02 gethostname02
 
 getitimer01 getitimer01
 getitimer02 getitimer02
diff --git a/testcases/kernel/syscalls/gethostname/.gitignore b/testcases/kernel/syscalls/gethostname/.gitignore
index d09d5d288..d6e4cffcb 100644
--- a/testcases/kernel/syscalls/gethostname/.gitignore
+++ b/testcases/kernel/syscalls/gethostname/.gitignore
@@ -1 +1,2 @@
 /gethostname01
+/gethostname02
diff --git a/testcases/kernel/syscalls/gethostname/gethostname02.c b/testcases/kernel/syscalls/gethostname/gethostname02.c
new file mode 100644
index 000000000..e9d97d05a
--- /dev/null
+++ b/testcases/kernel/syscalls/gethostname/gethostname02.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2024 FUJITSU LIMITED. All Rights Reserved.
+ * Author: Yang Xu <xuyang2018.jy@fujitsu.com>
+ */
+
+/*\
+ * [Description]
+ *
+ * Verify that gethostname(2) fails with
+ *
+ * - ENAMETOOLONG when len is smaller than the actual size
+ */
+
+#include "tst_test.h"
+
+static char hostname_enametoolong[100];
+
+static struct test_case_t {
+	char *hostname;
+	int size;
+	int expected_errno;
+	char *desc;
+} tcases[] = {
+	{hostname_enametoolong, 1, ENAMETOOLONG,
+		"len is smaller than the actual size"},
+};
+
+static void verify_gethostname(unsigned int i)
+{
+	struct test_case_t *tc = &tcases[i];
+
+	TST_EXP_FAIL(gethostname(tc->hostname, sizeof(tc->size)),
+		tc->expected_errno, "%s", tc->desc);
+}
+
+static struct tst_test test = {
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_gethostname,
+	.needs_root = 1,
+};
-- 
2.39.3


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
