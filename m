Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7150144B5E
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 06:26:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 598E43C238B
	for <lists+linux-ltp@lfdr.de>; Wed, 22 Jan 2020 06:26:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D96A73C07D6
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 06:26:18 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 2EAB72003B7
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 06:26:16 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,348,1574092800"; d="scan'208";a="82366248"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 22 Jan 2020 13:26:13 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
 by cn.fujitsu.com (Postfix) with ESMTP id 01D425010EC4;
 Wed, 22 Jan 2020 13:17:00 +0800 (CST)
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.83) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Wed, 22 Jan 2020 13:26:12 +0800
Received: from localhost.localdomain (10.167.220.84) by
 G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 22 Jan 2020 13:26:14 +0800
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
To: <chrubis@suse.cz>
Date: Wed, 22 Jan 2020 13:26:36 +0800
Message-ID: <1579670796-21233-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <20200121151342.GD6337@rei>
References: <20200121151342.GD6337@rei>
MIME-Version: 1.0
X-Originating-IP: [10.167.220.84]
X-yoursite-MailScanner-ID: 01D425010EC4.A9F48
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2] syscalls/add_key01: test the length of payload
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

Seeing add_key manpages, the length of payload for "user"/"logon"
is 32767, this value is up tp 1M for "big_key". For "keyring" type
, this value is zero.

---------
v1->v2:
1. use different buffers for different length
2. split pass and fail message, make code less confusing
---------

Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
---
 testcases/kernel/syscalls/add_key/add_key01.c | 110 ++++++++++++++++--
 1 file changed, 102 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/syscalls/add_key/add_key01.c b/testcases/kernel/syscalls/add_key/add_key01.c
index 4fe97dac6..9830d48dc 100644
--- a/testcases/kernel/syscalls/add_key/add_key01.c
+++ b/testcases/kernel/syscalls/add_key/add_key01.c
@@ -4,23 +4,117 @@
  * Porting from Crackerjack to LTP is done by
  * Manas Kumar Nayak maknayak@in.ibm.com>
  *
- * Basic test for the add_key() syscall.
+ * This case test various key type can support how many long
+ * bytes payload.
+ * keyring: 0 bytes
+ * user/logon: 32767 bytes
+ * big_key: 1M -1byte
  */
 
 #include <errno.h>
-
 #include "tst_test.h"
 #include "lapi/keyctl.h"
 
-static void verify_add_key(void)
+static char *keyring_buf, *keyring_buf1;
+static char *user_buf, *user_buf1;
+static char *logon_buf, *logon_buf1;
+static char *big_key_buf, *big_key_buf1;
+static unsigned int logon_nsup, big_key_nsup;
+
+struct tcase {
+	const char *type;
+	const char *desc;
+	char **buf;
+	size_t plen;
+	int pass_flag;
+	char *message;
+} tcases[] = {
+	{"keyring", "abc", &keyring_buf, 0, 1,
+	"The key type is keyrings and plen is 0"},
+
+	{"keyring", "bcd", &keyring_buf, 1, 0,
+	"the key type is keyrings and plen is 1"},
+
+	{"user", "cde", &user_buf, 32767, 1,
+	"The key type is user and plen is 32767"},
+
+	{"user", "def", &user_buf1, 32768, 0,
+	"The key type is user and plen is 32768"},
+
+	{"logon", "ef:g", &logon_buf, 32767, 1,
+	"The key type is logon and plen is 32767"},
+
+	{"logon", "fg:h", &logon_buf1, 32768, 0,
+	"The key type is logon and plen is 32768"},
+
+	{"big_key", "ghi", &big_key_buf, (1 << 20) - 1, 1,
+	"The key type is big_key and plen is 1048575"},
+
+	{"big_key", "hij", &big_key_buf1, 1 << 20, 0,
+	"The key type is big_key and plen is 1048576"},
+};
+
+static void verify_add_key(unsigned int n)
 {
-	TEST(add_key("keyring", "wjkey", NULL, 0, KEY_SPEC_THREAD_KEYRING));
+	struct tcase *tc = &tcases[n];
+
+	tst_res(TINFO, "%s", tc->message);
+
+	if (!strcmp(tc->type, "logon") && logon_nsup) {
+		tst_res(TCONF, "skipping unsupported logon key");
+		return;
+	}
+	if (!strcmp(tc->type, "big_key") && big_key_nsup) {
+		tst_res(TCONF, "skipping unsupported big_key key");
+		return;
+	}
+
+	TEST(add_key(tc->type, tc->desc, *tc->buf, tc->plen, KEY_SPEC_THREAD_KEYRING));
+	if (tc->pass_flag) {
+		if (TST_RET == -1)
+			tst_res(TFAIL | TTERRNO, "add_key call failed unexpectedly");
+		else
+			tst_res(TPASS, "add_key call succeeded as expected");
+	} else {
+		if (TST_RET == -1) {
+			if (TST_ERR == EINVAL)
+				tst_res(TPASS | TTERRNO, "add_key call failed as expected");
+			else
+				tst_res(TFAIL | TTERRNO, "add_key call failed expected EINVAL but got");
+		} else
+			tst_res(TFAIL, "add_key call succeeded unexpectedly");
+	}
+}
+
+static void setup(void)
+{
+	char *logon_sup_buf, *big_key_sup_buf;
+
+	logon_sup_buf = tst_alloc(64);
+	big_key_sup_buf = tst_alloc(64);
+
+	TEST(add_key("logon", "test:sup_logon", logon_sup_buf, 64, KEY_SPEC_THREAD_KEYRING));
+	if (TST_RET == -1)
+		logon_nsup = 1;
+
+	TEST(add_key("big_key", "sup_big_key", big_key_sup_buf, 64, KEY_SPEC_THREAD_KEYRING));
 	if (TST_RET == -1)
-		tst_res(TFAIL | TTERRNO, "add_key call failed");
-	else
-		tst_res(TPASS, "add_key call succeeded");
+		big_key_nsup = 1;
 }
 
 static struct tst_test test = {
-	.test_all = verify_add_key,
+	.setup = setup,
+	.tcnt = ARRAY_SIZE(tcases),
+	.test = verify_add_key,
+	.bufs = (struct tst_buffers []) {
+		{&keyring_buf, .size = 1},
+		{&keyring_buf1, .size = 1},
+		{&user_buf, .size = 32767},
+		{&user_buf1, .size = 32768},
+		{&logon_buf, .size = 32767},
+		{&logon_buf1, .size = 32768},
+		{&big_key_buf, .size = (1 << 20) - 1},
+		{&big_key_buf1, .size = 1 << 20},
+		{}
+	}
 };
-- 
2.18.0




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
