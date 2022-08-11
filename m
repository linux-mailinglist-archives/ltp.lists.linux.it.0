Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA458FD28
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Aug 2022 15:14:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2BDD53C9575
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Aug 2022 15:14:07 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2446F3C925A
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 15:14:05 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7365010000C3
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 15:14:03 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A8525CD0A
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660223642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HyipilkQZg8e+15O3rLNv0YQogrQ1D/pHkfe2naMwGE=;
 b=M+0IREaf6x/xroqyVZtuUHjkeOwONqhRDl1UtQNcnWT3SCvGbPeb0vaQnzKRlJ/Y85P6ZM
 HSsURYnAhPNp8k6rajOvWKRcz7Upq3sI31etlpsK+erwoAcpQBJbc0JfeTVfBIE78DN/s/
 qQAh6s0lS114TGlWPvH4np3T9v1eN3A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660223642;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=HyipilkQZg8e+15O3rLNv0YQogrQ1D/pHkfe2naMwGE=;
 b=+n1cGyQFXIP8viq0rB9Pm8+V6WYYCrEIiYrKExNxdctsQUW0DheomxvJqo2t+gGp2MmzSG
 dPNQwYKYt8ZFHEDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2A1513A9B
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 13:14:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wTH8H5kA9WKSXgAAMHmgww
 (envelope-from <akumar@suse.de>)
 for <ltp@lists.linux.it>; Thu, 11 Aug 2022 13:14:01 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Thu, 11 Aug 2022 18:43:54 +0530
Message-Id: <20220811131358.18906-1-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] alarm02: simplify using TST_EXP_* macros
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

- copyright update
- description comment reword and turn into docparse format
- remove duplicated includes
- use TST_EXP_PASS and TST_EXP_VAL macros

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/alarm/alarm02.c | 51 +++++++----------------
 1 file changed, 15 insertions(+), 36 deletions(-)

diff --git a/testcases/kernel/syscalls/alarm/alarm02.c b/testcases/kernel/syscalls/alarm/alarm02.c
index 94239060c..7d60b532e 100644
--- a/testcases/kernel/syscalls/alarm/alarm02.c
+++ b/testcases/kernel/syscalls/alarm/alarm02.c
@@ -1,17 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-/* Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
+/*
+ * Copyright (c) 2000 Silicon Graphics, Inc.  All Rights Reserved.
  * Author: Billy Jean Horne
- *
- * Test Description:
- *  1) alarm() return UINT_MAX if seconds is UINT_MAX.
- *  2) alarm() return UINT_MAX/2 if seconds is UINT_MAX/2.
- *  3) alarm() return UINT_MAX/4 if seconds is UINT_MAX/4.
+ * Copyright (c) Linux Test Project, 2009-2022
  */
 
-#include <unistd.h>
-#include <errno.h>
-#include <sys/signal.h>
-#include <limits.h>
+/*\
+ * [Description]
+ *
+ * Verify that alarm() returns:
+ * - zero when there was no previously scheduled alarm.
+ * - number of seconds remaining until any previously scheduled alarm.
+ */
 
 #include "tst_test.h"
 
@@ -29,37 +29,16 @@ static struct tcase {
 static void verify_alarm(unsigned int n)
 {
 	struct tcase *tc = &tcases[n];
-	unsigned int ret;
-
 	alarms_received = 0;
 
-	ret = alarm(tc->sec);
-	if (ret != 0) {
-		tst_res(TFAIL,
-			"alarm(%u) returned %ld, when 0 was ",
-			tc->sec, TST_RET);
-		return;
-	}
+	TST_EXP_PASS(alarm(tc->sec), "alarm(%u)", tc->sec);
 
-	TEST(alarm(0));
-	if (alarms_received == 1) {
-		tst_res(TFAIL,
-			"alarm(%u) signal was received for value %s",
-			tc->sec, tc->str);
-			return;
-	}
+	TST_EXP_VAL(alarm(0), tc->sec);
 
-	if (tc->sec != TST_RET) {
+	if (alarms_received == 1)
 		tst_res(TFAIL,
-			"alarm(%u) returned %ld as unexpected",
-			tc->sec, TST_RET);
-			return;
-	}
-
-	tst_res(TPASS,
-		"alarm(%u) returned %ld as expected "
-		"for value %s",
-		tc->sec, TST_RET, tc->str);
+				"alarm(%u) delivered SIGALRM for seconds value %s",
+				tc->sec, tc->str);
 }
 
 static void sighandler(int sig)
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
