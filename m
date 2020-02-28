Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id E444F173332
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 09:47:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9B7E03C6AC0
	for <lists+linux-ltp@lfdr.de>; Fri, 28 Feb 2020 09:47:17 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E992B3C6AB2
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 09:47:15 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 9A10C200744
 for <ltp@lists.linux.it>; Fri, 28 Feb 2020 09:47:11 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,495,1574092800"; d="scan'208";a="84708852"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 28 Feb 2020 16:47:04 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id DFACF50A9976;
 Fri, 28 Feb 2020 16:37:12 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Fri, 28 Feb 2020 16:46:55 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 28 Feb 2020 16:46:57 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Fri, 28 Feb 2020 16:47:41 +0800
Message-ID: <1582879661-1951-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200224153112.GB2210@rei>
References: <20200224153112.GB2210@rei>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: DFACF50A9976.A25FD
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.3 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/add_key05: add maxbytes/maxkeys test
 under unprivileged user
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

This case is designed to test whether we can reach maxbytes/maxkeys
quota exactly under unprivileged users. It is a regression test for
commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly").
But this kenrel commit is a incomplete fix, it still fails on 5.6.3-rc1.
Fix patch[1] is still under review.

[1]https://patchwork.kernel.org/patch/11411507/

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
v1->v2:
1. using parse_proc_key_user
2. add some messages about delta(v1 uses data_len)
3. fix something pointed by Cyril
 runtest/syscalls                              |   1 +
 testcases/kernel/syscalls/add_key/.gitignore  |   1 +
 testcases/kernel/syscalls/add_key/add_key05.c | 211 ++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 testcases/kernel/syscalls/add_key/add_key05.c

diff --git a/runtest/syscalls b/runtest/syscalls
index a9faf1e25..0462a08ef 100644
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
index 000000000..66b303544
--- /dev/null
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -0,0 +1,211 @@
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
+ * commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
+ *
+ */
+#include <stdio.h>
+#include <stdlib.h>
+#include <pwd.h>
+#include "tst_test.h"
+#include "lapi/keyctl.h"
+
+static char *user_buf;
+static const char *username = "ltp_add_key05";
+static int user_added;
+struct passwd *ltpuser;
+static char fmt[1024];
+
+static void add_user(void)
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
+static void clean_user(void)
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
+static inline void parse_proc_key_users(int *used_key, int *max_key, int *used_bytes, int *max_bytes)
+{
+	unsigned int val[4];
+	SAFE_FILE_LINES_SCANF("/proc/key-users", fmt, &val[0], &val[1], &val[2], &val[3]);
+
+	if (used_key)
+		*used_key = val[0];
+	if (max_key)
+		*max_key = val[1];
+	if (used_bytes)
+		*used_bytes = val[2];
+	if (max_bytes)
+		*max_bytes = val[3];
+}
+
+static void verify_max_btyes(void)
+{
+	char *buf;
+	int plen, invalid_plen, delta;
+	int used_bytes, max_bytes, tmp_used_bytes;
+
+	tst_res(TINFO, "test max bytes under unprivileged user");
+
+	parse_proc_key_users(NULL, NULL, &tmp_used_bytes, NULL);
+	TEST(add_key("user", "test2", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "add key test2 failed");
+		return;
+	}
+	parse_proc_key_users(NULL, NULL, &used_bytes, &max_bytes);
+
+	/*
+	 * Compute delta between default datalen(in key_alloc) and actual
+	 * datlen(in key_payload_reserve).
+	 * more info see kernel code: security/keys/key.c
+	 */
+	delta = used_bytes - tmp_used_bytes - strlen("test2") - 1 - 64;
+	invalid_plen = max_bytes - used_bytes - delta - strlen("test_xxx");
+	buf = tst_alloc(invalid_plen);
+
+	TEST(add_key("user", "test_inv", buf, invalid_plen, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "add_key(test_inv) succeeded unexpectedltly");
+		return;
+	}
+	if (TST_ERR == EDQUOT)
+		tst_res(TPASS | TTERRNO, "add_key(test_inv) failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "add_key(test_inv) failed expected EDQUOT got");
+
+	/*Reset delta*/
+	TEST(add_key("user", "test3", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "add key test3 failed");
+		return;
+	}
+	TEST(add_key("user", "test4", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1) {
+		tst_res(TFAIL | TTERRNO, "add key test4 failed");
+		return;
+	}
+	parse_proc_key_users(NULL, NULL, &used_bytes, &max_bytes);
+	plen = max_bytes - used_bytes - delta - strlen("test_xxx") - 1;
+	TEST(add_key("user", "test_max", buf, plen, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1) {
+		 tst_res(TFAIL | TTERRNO, "add_key(test_max) failed unexpectedly");
+		 return;
+	}
+
+	tst_res(TPASS, "add_key(test_max) succeeded as expected");
+	parse_proc_key_users(NULL, NULL, &tmp_used_bytes, &max_bytes);
+	if (tmp_used_bytes == max_bytes)
+		tst_res(TPASS, "allow reaching the max bytes exactly");
+	else
+		tst_res(TFAIL, "max used bytes %u, key allow max bytes %u", tmp_used_bytes, max_bytes);
+}
+
+static void verify_max_keys(void)
+{
+	int i, used_key, max_key, used_bytes, max_bytes;
+	char desc[10];
+	int plen;
+
+	tst_res(TINFO, "test max keys under unprivileged user");
+	parse_proc_key_users(&used_key, &max_key, &used_bytes, &max_bytes);
+	plen = (max_bytes - used_bytes) / (max_key - used_key);
+	if (plen > 64)
+		plen = 64;
+
+	for (i = used_key + 1; i <= max_key; i++) {
+		sprintf(desc, "abc%d", i);
+		TEST(add_key("user", desc, user_buf, 64, KEY_SPEC_THREAD_KEYRING));
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "add keyring key(%s) failed", desc);
+			goto count;
+		}
+	}
+
+	TEST(add_key("user", "test_invalid_key", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET != -1) {
+		tst_res(TFAIL, "add keyring key(test_invalid_key) succeeded unexpectedly");
+		goto count;
+	}
+	if (TST_ERR == EDQUOT)
+		tst_res(TPASS | TTERRNO, "add_key(test_invalid_key) failed as expected");
+	else
+		tst_res(TFAIL | TTERRNO, "add_key(test_invalid_key) failed expected EDQUOT got");
+
+count:
+	parse_proc_key_users(&used_key, &max_key, NULL, NULL);
+	if (used_key == max_key)
+		tst_res(TPASS, "allow reaching the max key(%u) exactly", max_key);
+	else
+		tst_res(TFAIL, "max used key %u, key allow max key %u", used_key, max_key);
+}
+
+static void do_test(unsigned int n)
+{
+	add_user();
+	if (!SAFE_FORK()) {
+		SAFE_SETUID(ltpuser->pw_uid);
+		TEST(add_key("user", "test1", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO, "add key test1 failed");
+			return;
+		}
+		if (n)
+			verify_max_keys();
+		else
+			verify_max_btyes();
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
+		{&user_buf, .size = 64},
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
