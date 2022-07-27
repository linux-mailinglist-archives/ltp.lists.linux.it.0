Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB55C581FF5
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jul 2022 08:12:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D6A5A3C2A24
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jul 2022 08:12:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7F4F53C0FB0
 for <ltp@lists.linux.it>; Wed, 27 Jul 2022 08:12:04 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id ECD0D1000603
 for <ltp@lists.linux.it>; Wed, 27 Jul 2022 08:12:02 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E523D2040D;
 Wed, 27 Jul 2022 06:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658902320; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ywhE+VgSbbARBZ8EUTcC2kmUchX/eivyrXzmSugl69s=;
 b=pi1SI+i/DTLyt4lXFp/ccmn7LEljgI2LfsiAGY+etlSeq7gofnaqDLGiZbpNA+C9MdHjMx
 JBzoT2rbLBsdUBervaY2F1vMLgnTlSFmveMlwrG7ltUboDdhmopV9FcMj8stjSjJly7BvA
 brrI8YZrbCXunMEC0ipL2IDzbCKW/vE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658902320;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ywhE+VgSbbARBZ8EUTcC2kmUchX/eivyrXzmSugl69s=;
 b=wa8HqrfpwKn/jGUxA30KvF7lOiL9Cd39zMKFplpxEfD4C1+KjrXnLTDtXqu0W5PzsoEz5Y
 DCoi5e2U67DXgyCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F32C13A8E;
 Wed, 27 Jul 2022 06:12:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j+7oBzDX4GJWdAAAMHmgww
 (envelope-from <akumar@suse.de>); Wed, 27 Jul 2022 06:12:00 +0000
From: Avinesh Kumar <akumar@suse.de>
To: ltp@lists.linux.it
Date: Wed, 27 Jul 2022 11:41:57 +0530
Message-Id: <20220727061157.30554-1-akumar@suse.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v2] fstat02.c: simplify using TST_EXP_*() macros
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

Signed-off-by: Avinesh Kumar <akumar@suse.de>
---
 testcases/kernel/syscalls/fstat/fstat02.c | 60 ++++-------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/testcases/kernel/syscalls/fstat/fstat02.c b/testcases/kernel/syscalls/fstat/fstat02.c
index 2f9632edf..09f8fef59 100644
--- a/testcases/kernel/syscalls/fstat/fstat02.c
+++ b/testcases/kernel/syscalls/fstat/fstat02.c
@@ -4,17 +4,15 @@
  *  07/2001 Ported by Wayne Boyer
  *  05/2019 Ported to new library: Christian Amann <camann@suse.com>
  */
-/*
+
+/*\
+ * [Description]
+ *
  * Tests if fstat() returns correctly and reports correct file information
  * using the stat structure.
  */
 
-#include <errno.h>
-#include <unistd.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 #include "tst_test.h"
-#include "tst_safe_macros.h"
 
 #define TESTFILE        "test_file"
 #define LINK_TESTFILE   "link_test_file"
@@ -29,50 +27,12 @@ static int fildes;
 
 static void run(void)
 {
-	int fail = 0;
-
-	TEST(fstat(fildes, &stat_buf));
-
-	if (TST_RET != 0) {
-		tst_res(TFAIL | TTERRNO, "fstat() failed");
-		return;
-	}
-
-	fail = 0;
-	if (stat_buf.st_uid != user_id) {
-		tst_res(TFAIL, "stat_buf.st_uid = %i expected %i",
-			stat_buf.st_uid, user_id);
-		fail++;
-	}
-
-	if (stat_buf.st_gid != group_id) {
-		tst_res(TFAIL, "stat_buf.st_gid = %i expected %i",
-			stat_buf.st_gid, group_id);
-		fail++;
-	}
-
-	if (stat_buf.st_size != FILE_SIZE) {
-		tst_res(TFAIL, "stat_buf.st_size = %li expected %i",
-			(long)stat_buf.st_size, FILE_SIZE);
-		fail++;
-	}
-
-	if ((stat_buf.st_mode & 0777) != FILE_MODE) {
-		tst_res(TFAIL, "stat_buf.st_mode = %o expected %o",
-			(stat_buf.st_mode & 0777), FILE_MODE);
-		fail++;
-	}
-
-	if (stat_buf.st_nlink != NLINK) {
-		tst_res(TFAIL, "stat_buf.st_nlink = %li expected %i",
-			(long)stat_buf.st_nlink, NLINK);
-		fail++;
-	}
-
-	if (fail)
-		return;
-
-	tst_res(TPASS, "fstat() reported correct values.");
+	TST_EXP_PASS(fstat(fildes, &stat_buf));
+	TST_EXP_EQ_LU(stat_buf.st_uid, user_id);
+	TST_EXP_EQ_LU(stat_buf.st_gid, group_id);
+	TST_EXP_EQ_LI(stat_buf.st_size, FILE_SIZE);
+	TST_EXP_EQ_LU(stat_buf.st_mode & 0777, FILE_MODE);
+	TST_EXP_EQ_LU(stat_buf.st_nlink, NLINK);
 }
 
 static void setup(void)
-- 
2.36.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
