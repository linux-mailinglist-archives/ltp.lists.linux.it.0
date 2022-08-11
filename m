Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CA958FD29
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Aug 2022 15:14:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B253E3C959A
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Aug 2022 15:14:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id B18C63C95D1
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 15:14:07 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id CFF6A6009D9
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 15:14:06 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 386C138B68
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660223646; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuFXrku0bdoqoQ7xLi1c38Ub3bbq2cjioYwMfvgOtNc=;
 b=GN1bld43vMdQhtdZ+CWchfUz3UpoSo4+pPuq/eT4hrIto33stUQhg1Ji4YJY69xmlM+vnE
 OYXDQZG0Qg1PuNtvmDIhMJhYuxzmOY94nTlK9IOdiP3i/e4FjuTFcxq2JKQ8Kwv2ZFwikU
 w570k4CV6PwcKAAYmMZaH+X3UtJ8v34=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660223646;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OuFXrku0bdoqoQ7xLi1c38Ub3bbq2cjioYwMfvgOtNc=;
 b=gvRYNfCPJiGmO5cyip/bvdriK6s3Ferh+ZjHfNdvkDXzpebWYkwMlkFI0DZ5dbOXddUMxD
 vF4mXn2JaYimvbDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 92CC813A9B
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 13:14:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gnFqEp0A9WKlXgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 13:14:05 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Thu, 11 Aug 2022 18:43:55 +0530
Message-Id: <20220811131358.18906-2-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220811131358.18906-1-akumar@suse.de>
References: <20220811131358.18906-1-akumar@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/5] alarm03: cleanup and simplify
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

- copyright udpate
- description comment reword and turn into docparse format
- remove duplicated headers
- use TST_EXP_* macros

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/alarm/alarm03.c | 41 ++++++-----------------
 1 file changed, 10 insertions(+), 31 deletions(-)

diff --git a/testcases/kernel/syscalls/alarm/alarm03.c b/testcases/kernel/syscalls/alarm/alarm03.c
index c0341827e..83c9932ae 100644
--- a/testcases/kernel/syscalls/alarm/alarm03.c
+++ b/testcases/kernel/syscalls/alarm/alarm03.c
@@ -2,53 +2,32 @@
 /*
  * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  * Author: Richard Logan
+ * Copyright (c) Linux Test Project, 2009-2022
+ */
+
+/*\
+ * [Description]
  *
- * Test Description:
- *  The process does a fork:
- *	1) By the value returned by child's alarm(0), check whether child
- *	   process cleared the previously specified alarm request or not.
- *	2) By the value returned by parent's alarm(0), check whether parent
- *	   process cleared the previously specified alarm request or not.
+ * Verify that alarms created by alarm() are not inherited by children
+ * created via fork.
  */
 
-#include <errno.h>
-#include <signal.h>
 #include <stdlib.h>
-#include <unistd.h>
-
 #include "tst_test.h"
 
 static void verify_alarm(void)
 {
 	pid_t pid;
 
-	TEST(alarm(100));
+	TST_EXP_PASS_SILENT(alarm(100));
 
 	pid = SAFE_FORK();
 	if (pid == 0) {
-		TEST(alarm(0));
-		if (TST_RET != 0) {
-			tst_res(TFAIL,
-				"alarm(100), fork, alarm(0) child's "
-				"alarm returned %ld", TST_RET);
-		} else {
-			tst_res(TPASS,
-				"alarm(100), fork, alarm(0) child's "
-				"alarm returned %ld", TST_RET);
-		}
+		TST_EXP_PASS(alarm(0), "alarm(0) in child process");
 		exit(0);
 	}
 
-	TEST(alarm(0));
-	if (TST_RET != 100) {
-		tst_res(TFAIL,
-			"alarm(100), fork, alarm(0) parent's "
-			"alarm returned %ld", TST_RET);
-	} else {
-		tst_res(TPASS,
-			"alarm(100), fork, alarm(0) parent's "
-			"alarm returned %ld", TST_RET);
-	}
+	TST_EXP_VAL(alarm(0), 100, "alarm(0) in parent process");
 }
 
 static struct tst_test test = {
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
