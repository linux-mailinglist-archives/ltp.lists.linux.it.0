Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0141BA6E3
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 16:50:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 773D13C2973
	for <lists+linux-ltp@lfdr.de>; Mon, 27 Apr 2020 16:50:21 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id F16F53C2863
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 16:50:16 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 42319600069
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 16:50:15 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BD406AD35
 for <ltp@lists.linux.it>; Mon, 27 Apr 2020 14:50:14 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 27 Apr 2020 16:50:14 +0200
Message-Id: <20200427145014.3530-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] connect02: Handle setsockopt(IP_ADDRFORM) kernel bug
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

setsockopt(IP_ADDRFORM) is broken in kernel 5.6 which results in test failures.
Add the fix commit hash to test tags and check setsockopt() return value
manually so that the test can print the appropriate hints.

Also improve post-fail cleanup.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/connect/connect02.c | 44 +++++++++++++++++--
 1 file changed, 40 insertions(+), 4 deletions(-)

diff --git a/testcases/kernel/syscalls/connect/connect02.c b/testcases/kernel/syscalls/connect/connect02.c
index 27e2bfddb..cf80213d6 100644
--- a/testcases/kernel/syscalls/connect/connect02.c
+++ b/testcases/kernel/syscalls/connect/connect02.c
@@ -14,6 +14,17 @@
  *  Date:   Tue Sep 26 17:38:50 2017 -0700
  *
  *  net: Set sk_prot_creator when cloning sockets to the right proto
+ *
+ *
+ * Note: This test also detects setsockopt(IP_ADDRFORM) breakage caused by
+ * kernel commit b6f6118901d1. This bug is unrelated to CVE-2018-9568.
+ * Fixed in:
+ *
+ *  commit 82c9ae440857840c56e05d4fb1427ee032531346
+ *  Author: John Haxby <john.haxby@oracle.com>
+ *  Date:   Sat Apr 18 16:30:49 2020 +0100
+ *
+ *  ipv6: fix restrict IPV6_ADDRFORM operation
  */
 
 #include <sys/types.h>
@@ -26,7 +37,7 @@
 #include "tst_net.h"
 #include "tst_taint.h"
 
-static int listenfd;
+static int listenfd = -1, fd = -1, confd1 = -1, confd2 = -1, confd3 = -1;
 static struct sockaddr_in6 bind_addr;
 static struct sockaddr_in bind_addr4, client_addr;
 static struct sockaddr reset_addr;
@@ -52,13 +63,25 @@ static void setup(void)
 
 static void cleanup(void)
 {
-	if (listenfd > 0)
+	if (confd3 >= 0)
+		SAFE_CLOSE(confd3);
+
+	if (confd2 >= 0)
+		SAFE_CLOSE(confd2);
+
+	if (confd1 >= 0)
+		SAFE_CLOSE(confd1);
+
+	if (fd >= 0)
+		SAFE_CLOSE(fd);
+
+	if (listenfd >= 0)
 		SAFE_CLOSE(listenfd);
 }
 
 static void run(void)
 {
-	int i, addrlen, fd, confd1, confd2, confd3;
+	int i, addrlen, optval = AF_INET;
 	struct sockaddr_storage client_addr2;
 
 	for (i = 0; i < 1000; i++) {
@@ -67,7 +90,19 @@ static void run(void)
 			sizeof(client_addr));
 
 		fd = SAFE_ACCEPT(listenfd, NULL, NULL);
-		SAFE_SETSOCKOPT_INT(fd, SOL_IPV6, IPV6_ADDRFORM, AF_INET);
+		TEST(setsockopt(fd, SOL_IPV6, IPV6_ADDRFORM, &optval,
+			sizeof(optval)));
+
+		if (TST_RET == -1) {
+			tst_res(TFAIL | TTERRNO,
+				"setsockopt(IPV6_ADDRFORM) failed");
+			return;
+		}
+
+		if (TST_RET != 0)
+			tst_brk(TBROK | TTERRNO, "setsockopt(IPV6_ADDRFORM) "
+				"returned invalid value");
+
 		SAFE_CONNECT(fd, (struct sockaddr *)&reset_addr,
 			sizeof(reset_addr));
 		SAFE_BIND(fd, (struct sockaddr *)&bind_addr4,
@@ -99,6 +134,7 @@ static struct tst_test test = {
 	.cleanup = cleanup,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "9d538fa60bad"},
+		{"linux-git", "82c9ae440857"},
 		{"CVE", "2018-9568"},
 		{}
 	}
-- 
2.26.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
