Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E9ACB141CE3
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jan 2020 08:49:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 48C3D3C2390
	for <lists+linux-ltp@lfdr.de>; Sun, 19 Jan 2020 08:49:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 70DBE3C1044
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 08:49:46 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id C8D02600764
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 08:49:43 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,337,1574092800"; d="scan'208";a="82258420"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 19 Jan 2020 15:49:40 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id C2C795010EB0
 for <ltp@lists.linux.it>; Sun, 19 Jan 2020 15:40:28 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Sun, 19 Jan 2020 15:49:37 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Sun, 19 Jan 2020 15:49:39 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Sun, 19 Jan 2020 15:49:57 +0800
Message-ID: <1579420198-29651-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: C2C795010EB0.AFB34
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/add_key05: add new test for the length
 of payload
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

Seeing add_key manpages, the lenth of payload for "user"/"logon"
is 32767, this value is up tp 1M for "big_key". For "keyring" type
, this value is zero.

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |  1 +
 testcases/kernel/syscalls/add_key/.gitignore  |  1 +
 testcases/kernel/syscalls/add_key/add_key05.c | 99 +++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 testcases/kernel/syscalls/add_key/add_key05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index f58fefe17..830dfc8b7 100644
--- a/runtest/syscalls
+++ b/runtest/syscalls
@@ -18,6 +18,7 @@ add_key01 add_key01
 add_key02 add_key02
 add_key03 add_key03
 add_key04 add_key04
+add_key05 add_key05
 
 adjtimex01 adjtimex01
 adjtimex02 adjtimex02
diff --git a/testcases/kernel/syscalls/add_key/.gitignore b/testcases/kernel/syscalls/add_key/.gitignore
index b9a04214d..f57dc2228 100644
--- a/testcases/kernel/syscalls/add_key/.gitignore
+++ b/testcases/kernel/syscalls/add_key/.gitignore
@@ -2,3 +2,4 @@
 /add_key02
 /add_key03
 /add_key04
+/add_key05
diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
new file mode 100644
index 000000000..a6d4c1a02
--- /dev/null
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ * This case test various key type can support how many long
+ * bytes payload.
+ * keyring: 0 bytes
+ * user/logon: 32767 bytes
+ * big_key: 1M -1byte
+ */
+
+#include <errno.h>
+#include "tst_test.h"
+#include "lapi/keyctl.h"
+
+struct tcase {
+	const char *type;
+	const char *desc;
+	size_t plen;
+	int pass_flag;
+	char *message;
+} tcases[] = {
+	{"keyring", "abc", 0, 1,
+	"The key type is keyrings and plen is 0"},
+
+	{"keyring", "bcd", 1, 0,
+	"the key type is keyrings and plen is 1"},
+
+	{"user", "cde", 32767, 1,
+	"The key type is user and plen is 32767"},
+
+	{"user", "def", 32768, 0,
+	"The key type is user and plen is 32768"},
+
+	{"logon", "ef:g", 32767, 1,
+	"The key type is logon and plen is 32767"},
+
+	{"logon", "fg:h", 32768, 0,
+	"The key type is logon and plen is 32768"},
+
+	{"big_key", "ghi", (1 << 20) - 1, 1,
+	"The key type is big_key and plen is 1048575"},
+
+	{"big_key", "hij", 1 << 20, 0,
+	"The key type is big_key and plen is 1048576"},
+};
+
+static char *buf;
+static unsigned int logon_nsup, big_key_nsup;
+
+static void verify_add_key(unsigned int n)
+{
+	struct tcase *tc = &tcases[n];
+
+	tst_res(TINFO, "%s", tc->message);
+
+	if (!strcmp(tc->type, "logon") && logon_nsup) {
+		tst_res(TINFO,
+			"current system doesn't support logon key type, skip it");
+		return;
+	}
+	if (!strcmp(tc->type, "big_key") && big_key_nsup) {
+		tst_res(TINFO,
+			"current system doesn't support big_key key type, skip it");
+		return;
+	}
+
+	TEST(add_key(tc->type, tc->desc, buf, tc->plen, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1) {
+		if (TST_ERR == EINVAL)
+			tst_res(tc->pass_flag ? TFAIL : TPASS, "add_key call failed as expected");
+		else
+			tst_res(TFAIL | TTERRNO, "add_key call failed expected EINVAL but got");
+		return;
+	}
+	tst_res(tc->pass_flag ? TPASS : TFAIL, "add_key call succeeded");
+}
+
+static void setup(void)
+{
+	TEST(add_key("logon", "test:sup_logon", buf, 64, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1)
+		logon_nsup = 1;
+
+	TEST(add_key("big_key", "sup_big_key", buf, 64, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1)
+		big_key_nsup = 1;
+}
+
+static struct tst_test test = {
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_add_key,
+	.bufs = (struct tst_buffers []) {
+		{&buf, .size = 1 << 20},
+		{}
+	}
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
