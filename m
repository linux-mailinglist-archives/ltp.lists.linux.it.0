Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 118E18A158
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 926C63C1441
	for <lists+linux-ltp@lfdr.de>; Mon, 12 Aug 2019 16:40:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 363B43C1D26
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 22A8B1000C62
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 16:39:40 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C2A74ACEC
 for <ltp@lists.linux.it>; Mon, 12 Aug 2019 14:39:46 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 12 Aug 2019 16:39:37 +0200
Message-Id: <20190812143941.8119-8-chrubis@suse.cz>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812143941.8119-1-chrubis@suse.cz>
References: <20190812143941.8119-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2 07/11] syscalls/add_key04: Make use of guarded
 buffers.
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/add_key/add_key04.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/testcases/kernel/syscalls/add_key/add_key04.c b/testcases/kernel/syscalls/add_key/add_key04.c
index 28cc91f72..12a169eda 100644
--- a/testcases/kernel/syscalls/add_key/add_key04.c
+++ b/testcases/kernel/syscalls/add_key/add_key04.c
@@ -32,6 +32,10 @@
 
 #define ASSOC_ARRAY_FAN_OUT 16
 
+#define PAYLOAD "payload"
+
+static char *payload;
+
 static void do_test(void)
 {
 	int status;
@@ -42,7 +46,6 @@ static void do_test(void)
 
 	if (SAFE_FORK() == 0) {
 		char description[32];
-		const char payload[] = "payload";
 		int i;
 
 		for (i = 0; i < ASSOC_ARRAY_FAN_OUT; i++) {
@@ -55,7 +58,7 @@ static void do_test(void)
 			}
 		}
 
-		TEST(add_key("user", "userkey", payload, sizeof(payload),
+		TEST(add_key("user", "userkey", payload, sizeof(PAYLOAD),
 			     KEY_SPEC_SESSION_KEYRING));
 		if (TST_RET < 0)
 			tst_brk(TBROK | TTERRNO, "unable to create user key");
@@ -72,7 +75,13 @@ static void do_test(void)
 		tst_brk(TBROK, "Child %s", tst_strstatus(status));
 }
 
+static void setup(void)
+{
+	payload = tst_strdup(PAYLOAD);
+}
+
 static struct tst_test test = {
+	.setup = setup,
 	.test_all = do_test,
 	.forks_child = 1,
 };
-- 
2.21.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
