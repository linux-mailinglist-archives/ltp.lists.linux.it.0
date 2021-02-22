Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C77321C11
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 17:03:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E9EF33C615A
	for <lists+linux-ltp@lfdr.de>; Mon, 22 Feb 2021 17:03:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 1CE473C60FF
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:02:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 5B324600801
 for <ltp@lists.linux.it>; Mon, 22 Feb 2021 17:02:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B4692AFCB;
 Mon, 22 Feb 2021 16:02:48 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 22 Feb 2021 17:02:40 +0100
Message-Id: <20210222160243.507-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210222160243.507-1-pvorel@suse.cz>
References: <20210222160243.507-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/4] lib: Add support for linux stable and glibc tags
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
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 lib/tst_test.c | 39 ++++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index 6bbee030b..be6bf3e2a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * Copyright (c) 2015-2016 Cyril Hrubis <chrubis@suse.cz>
+ * Copyright (c) Linux Test Project, 2016-2021
  */
 
 #include <limits.h>
@@ -38,6 +39,8 @@
 const char *TCID __attribute__((weak));
 
 #define LINUX_GIT_URL "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id="
+#define LINUX_STABLE_GIT_URL "https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id="
+#define GLIBC_GIT_URL "https://sourceware.org/git/?p=glibc.git;a=commit;h="
 #define CVE_DB_URL "https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-"
 
 struct tst_test *tst_test;
@@ -492,6 +495,8 @@ static void print_test_tags(void)
 			printf(CVE_DB_URL "%s\n", tags[i].value);
 		else if (!strcmp(tags[i].name, "linux-git"))
 			printf(LINUX_GIT_URL "%s\n", tags[i].value);
+		else if (!strcmp(tags[i].name, "linux-stable-git"))
+			printf(LINUX_STABLE_GIT_URL "%s\n", tags[i].value);
 		else
 			printf("%s: %s\n", tags[i].name, tags[i].value);
 	}
@@ -671,44 +676,40 @@ static void print_colored(const char *str)
 		printf("%s", str);
 }
 
-static void print_failure_hints(void)
+static void print_failure_hint(const char *tag, const char *hint,
+			       const char *url)
 {
-	unsigned int i;
 	const struct tst_tag *tags = tst_test->tags;
 
 	if (!tags)
 		return;
 
+	unsigned int i;
 	int hint_printed = 0;
-	for (i = 0; tags[i].name; i++) {
-		if (!strcmp(tags[i].name, "linux-git")) {
-			if (!hint_printed) {
-				hint_printed = 1;
-				printf("\n");
-				print_colored("HINT: ");
-				printf("You _MAY_ be missing kernel fixes, see:\n\n");
-			}
 
-			printf(LINUX_GIT_URL "%s\n", tags[i].value);
-		}
-
-	}
-
-	hint_printed = 0;
 	for (i = 0; tags[i].name; i++) {
-		if (!strcmp(tags[i].name, "CVE")) {
+		if (!strcmp(tags[i].name, tag)) {
 			if (!hint_printed) {
 				hint_printed = 1;
 				printf("\n");
 				print_colored("HINT: ");
-				printf("You _MAY_ be vulnerable to CVE(s), see:\n\n");
+				printf("You _MAY_ be %s, see:\n\n", hint);
 			}
 
-			printf(CVE_DB_URL "%s\n", tags[i].value);
+			printf("%s%s\n", url, tags[i].value);
 		}
 	}
 }
 
+static void print_failure_hints(void)
+{
+	print_failure_hint("linux-git", "missing kernel fixes", LINUX_GIT_URL);
+	print_failure_hint("linux-stable-git", "missing stable kernel fixes",
+					   LINUX_STABLE_GIT_URL);
+	print_failure_hint("glibc-git", "missing glibc fixes", GLIBC_GIT_URL);
+	print_failure_hint("CVE", "vulnerable to CVE(s)", CVE_DB_URL);
+}
+
 static void do_exit(int ret)
 {
 	if (results) {
-- 
2.30.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
