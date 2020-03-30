Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5C1197E40
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 16:21:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BB1E3C315B
	for <lists+linux-ltp@lfdr.de>; Mon, 30 Mar 2020 16:21:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 6905C3C314A
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 16:21:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E1B7A200B8F
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 16:21:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 44882ACA2
 for <ltp@lists.linux.it>; Mon, 30 Mar 2020 14:21:34 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 30 Mar 2020 16:21:42 +0200
Message-Id: <20200330142142.26858-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] tst_test: Print tags only when defined.
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

We were printing the Tags heading even when no tags were defined.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 lib/tst_test.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/lib/tst_test.c b/lib/tst_test.c
index dae3fa1b5..e502c2c1a 100644
--- a/lib/tst_test.c
+++ b/lib/tst_test.c
@@ -447,18 +447,19 @@ static void print_test_tags(void)
 	unsigned int i;
 	const struct tst_tag *tags = tst_test->tags;
 
+	if (!tags)
+		return;
+
 	printf("\nTags\n");
 	printf("----\n");
 
-	if (tags) {
-		for (i = 0; tags[i].name; i++) {
-			if (!strcmp(tags[i].name, "CVE"))
-				printf(CVE_DB_URL "%s\n", tags[i].value);
-			else if (!strcmp(tags[i].name, "linux-git"))
-				printf(LINUX_GIT_URL "%s\n", tags[i].value);
-			else
-				printf("%s: %s\n", tags[i].name, tags[i].value);
-		}
+	for (i = 0; tags[i].name; i++) {
+		if (!strcmp(tags[i].name, "CVE"))
+			printf(CVE_DB_URL "%s\n", tags[i].value);
+		else if (!strcmp(tags[i].name, "linux-git"))
+			printf(LINUX_GIT_URL "%s\n", tags[i].value);
+		else
+			printf("%s: %s\n", tags[i].name, tags[i].value);
 	}
 
 	printf("\n");
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
