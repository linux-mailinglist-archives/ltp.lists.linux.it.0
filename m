Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5E15582C
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 14:14:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A75523C23B4
	for <lists+linux-ltp@lfdr.de>; Fri,  7 Feb 2020 14:14:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 530093C1483
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 14:14:57 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 626E36014AE
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 14:14:50 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,413,1574092800"; d="scan'208";a="83003430"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 07 Feb 2020 21:14:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 0E02C406AB15
 for <ltp@lists.linux.it>; Fri,  7 Feb 2020 21:05:23 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 7 Feb 2020 21:14:51 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 7 Feb 2020 21:14:47 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <ltp@lists.linux.it>
Date: Fri, 7 Feb 2020 21:14:57 +0800
Message-ID: <1581081297-20034-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 0E02C406AB15.ABD3E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/add_key05: add maxbytes/maxkeys test under
 unprivileged user
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

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/add_key/.gitignore  |   1 +
 testcases/kernel/syscalls/add_key/add_key05.c | 180 ++++++++++++++++++
 3 files changed, 182 insertions(+)
 create mode 100644 testcases/kernel/syscalls/add_key/add_key05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index 577a4a527..df7bbcbf1 100644
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
index 000000000..0d5e9db28
--- /dev/null
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2020 FUJITSU LIMITED. All rights reserved.
+ * Author: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
+ *
+ *Description:
+ * Test unprivileged user can support the number of keys and the
+ * number of bytes consumed in payloads of the keys.The defalut value
+ * is 200 and 20000.
+ * This is also a regresstion test for
+ * commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exact")
+ *
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <pwd.h>
+#include "tst_test.h"
+#include "lapi/keyctl.h"
+
+static char *user_buf, *user_buf1, *keyring_buf;
+static const char *username = "ltp_add_key05";
+static int user_added;
+struct passwd *ltpuser;
+static unsigned int used_bytes, max_bytes, used_key, max_key, data_len;
+char fmt[1024];
+int flag[2] = {1, 0};
+
+void add_user(void)
+{
+	if (user_added)
+		return;
+
+	const char *const cmd_useradd[] = {"useradd", username, NULL};
+	int rc;
+
+	switch ((rc = tst_run_cmd(cmd_useradd, NULL, NULL, 1))) {
+	case 0:
+		user_added = 1;
+		ltpuser = SAFE_GETPWNAM(username);
+		break;
+	case 1:
+	case 255:
+		break;
+	default:
+		tst_brk(TBROK, "Useradd failed (%d)", rc);
+	}
+	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
+}
+
+void clean_user(void)
+{
+	if (!user_added)
+		return;
+
+	const char *const cmd_userdel[] = {"userdel", "-r", username, NULL};
+
+	if (tst_run_cmd(cmd_userdel, NULL, NULL, 1))
+		tst_res(TWARN | TERRNO, "'userdel -r %s' failed", username);
+	else
+		user_added = 0;
+}
+
+void verify_max_btyes(void)
+{
+	char *buf, *invalid_buf;
+	int plen, invalid_plen;
+
+	tst_res(TINFO, "test max bytes under unprivileged user");
+	invalid_plen = max_bytes - used_bytes - data_len - 8;
+	plen = invalid_plen - 1;
+	buf = tst_alloc(plen);
+	invalid_buf = tst_alloc(invalid_plen);
+
+	TEST(add_key("user", "test_inv", invalid_buf, invalid_plen, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET != -1)
+		tst_res(TFAIL, "add_key(test_inv) succeeded unexpectedltly");
+	else {
+		if (TST_ERR == EDQUOT)
+			tst_res(TPASS | TTERRNO, "add_key(test_inv) failed as expected");
+		else
+			tst_res(TFAIL | TTERRNO, "add_key(test_inv) failed expected EDQUOT got");
+	}
+
+	TEST(add_key("user", "test_max", buf, plen, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET != -1) {
+		tst_res(TPASS, "add_key(test_max) succeeded as expected");
+		SAFE_FILE_LINES_SCANF("/proc/key-users", fmt, &used_key, &max_key, &used_bytes, &max_bytes);
+		if (used_bytes == max_bytes)
+			tst_res(TPASS, "allow reaching the max bytes exactly");
+		else
+			tst_res(TFAIL, "max used bytes %u, key allow max bytes %u", used_bytes, max_bytes);
+	} else
+		tst_res(TFAIL | TTERRNO, "add_key(test_max) failed unexpectedly");
+}
+
+void verify_max_keys(void)
+{
+	unsigned int i;
+	char desc[10];
+
+	tst_res(TINFO, "test max keys under unprivileged user");
+	for (i = used_key + 1; i < max_key; i++) {
+		sprintf(desc, "abc%d", i);
+		TEST(add_key("keyring", desc, keyring_buf, 0, KEY_SPEC_THREAD_KEYRING));
+		if (TST_RET == -1)
+			tst_res(TFAIL | TTERRNO, "add keyring key(%s) failed", desc);
+	}
+
+	TEST(add_key("keyring", "abc200", keyring_buf, 0, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "add keyring key(abc200) failed");
+		goto count;
+	} else
+		tst_res(TPASS, "add keyring key(abc200) succedd");
+
+	TEST(add_key("keyring", "abc201", keyring_buf, 0, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "add keyring key(abc201) succeeded unexpectedly");
+		goto count;
+	} else {
+		if (TST_ERR == EDQUOT)
+			tst_res(TPASS | TTERRNO, "add keyring key(abc201) failed as expected over max key");
+		else
+			tst_res(TFAIL | TTERRNO, "add_keyring failed expected EDQUOT got");
+	}
+count:
+	SAFE_FILE_LINES_SCANF("/proc/key-users", fmt, &used_key, &max_key, &used_bytes, &max_bytes);
+	if (used_key == max_key)
+		tst_res(TPASS, "allow reaching the max key exactly");
+	else
+		tst_res(TFAIL, "max used key %u, key allow max key %u", used_key, max_key);
+}
+
+static void do_test(unsigned int n)
+{
+	add_user();
+	int f_used_bytes = 0;
+
+	if (!SAFE_FORK()) {
+		SAFE_SETUID(ltpuser->pw_uid);
+
+		TEST(add_key("user", "test1", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
+		if (TST_RET == -1)
+			tst_brk(TFAIL | TTERRNO, "add key test1 failed");
+		SAFE_FILE_LINES_SCANF("/proc/key-users", fmt, &used_key, &max_key, &used_bytes, &max_bytes);
+		f_used_bytes = used_bytes;
+
+		TEST(add_key("user", "test2", user_buf1, 64, KEY_SPEC_THREAD_KEYRING));
+		if (TST_RET == -1)
+			tst_brk(TFAIL | TTERRNO, "add key test2 failed");
+		SAFE_FILE_LINES_SCANF("/proc/key-users", fmt, &used_key, &max_key, &used_bytes, &max_bytes);
+
+		data_len = used_bytes - f_used_bytes - strlen("test1") - 1 - 64;
+		if (flag[n])
+			verify_max_btyes();
+		else
+			verify_max_keys();
+		exit(0);
+	}
+	tst_reap_children();
+	clean_user();
+}
+
+static struct tst_test test = {
+	.test = do_test,
+	.tcnt = 2,
+	.needs_root = 1,
+	.forks_child = 1,
+	.cleanup = clean_user,
+	.bufs = (struct tst_buffers []) {
+		{&keyring_buf, .size = 1},
+		{&user_buf, .size = 64},
+		{&user_buf1, .size = 64},
+		{}
+	},
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "a08bf91ce28"},
+		{}
+	}
+};
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
