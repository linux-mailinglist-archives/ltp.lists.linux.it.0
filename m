Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408A7A5F6F
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Sep 2023 12:24:51 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2D86C3CE451
	for <lists+linux-ltp@lfdr.de>; Tue, 19 Sep 2023 12:24:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 67C893CA6BC
 for <ltp@lists.linux.it>; Tue, 19 Sep 2023 12:24:49 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 96623600634
 for <ltp@lists.linux.it>; Tue, 19 Sep 2023 12:24:48 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 487451FE39;
 Tue, 19 Sep 2023 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695119088; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orKEWineRYxiQmLOLncSQ5LMNrsDtwM+cYRryMXfvNY=;
 b=XfdfoNagIt2zIW7a8dJqDALI12LBSaL6uZRk3l3Oue4o1lVs76L8K2bo9ITsNjs1BSFALH
 bzZVo57nYhLyHG42gau1v/QBG/Kj/XkN1F1oSieOBN9XKHw0BkSrNGQjKNVdHFhTc1/vaq
 asRPk5GO/DAVwted6JgJq34UhyAa5NE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695119088;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=orKEWineRYxiQmLOLncSQ5LMNrsDtwM+cYRryMXfvNY=;
 b=e/9C0MYyF/dpjJ1N0wFvqpw5ME88/v9QnCpfgpGMRByUg7d8YyRpYKNMrsWbxsSygG/P3w
 WGQs4fYR0dHd99Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 346FB13458;
 Tue, 19 Sep 2023 10:24:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4HrVC/B2CWXOSAAAMHmgww
 (envelope-from <mkittler@suse.de>); Tue, 19 Sep 2023 10:24:48 +0000
From: Marius Kittler <mkittler@suse.de>
To: ltp@lists.linux.it
Date: Tue, 19 Sep 2023 12:24:45 +0200
Message-ID: <20230919102445.23934-5-mkittler@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919102445.23934-1-mkittler@suse.de>
References: <20230919102445.23934-1-mkittler@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 1.0.1 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH v5 4/4] Use termios instead of legacy struct in
 ioctl02.c
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

Signed-off-by: Marius Kittler <mkittler@suse.de>
---
 testcases/kernel/syscalls/ioctl/ioctl02.c | 24 +++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/syscalls/ioctl/ioctl02.c b/testcases/kernel/syscalls/ioctl/ioctl02.c
index b4db6ba86..c9a1c32d0 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl02.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl02.c
@@ -8,17 +8,17 @@
 /*\
  * [Description]
  *
- * Testcase to test the TCGETA, and TCSETA ioctl implementations for
+ * Testcase to test the TCGETS, and TCSETS ioctl implementations for
  * the tty driver
  *
  * In this test, the parent and child open the parentty and the childtty
  * respectively.  After opening the childtty the child flushes the stream
  * and wakes the parent (thereby asking it to continue its testing). The
- * parent, then starts the testing. It issues a TCGETA ioctl to get all
+ * parent, then starts the testing. It issues a TCGETS ioctl to get all
  * the tty parameters. It then changes them to known values by issuing a
- * TCSETA ioctl. Then the parent issues a TCGETA ioctl again and compares
+ * TCSETS ioctl. Then the parent issues a TCGETS ioctl again and compares
  * the received values with what it had set earlier. The test fails if
- * TCGETA or TCSETA fails, or if the received values don't match those
+ * TCGETS or TCSETS fails, or if the received values don't match those
  * that were set. The parent does all the testing, the requirement of the
  * child process is to moniter the testing done by the parent, and hence
  * the child just waits for the parent.
@@ -37,7 +37,7 @@
 #include "tst_test.h"
 #include "tst_safe_macros.h"
 
-static struct termio termio, save_io;
+static struct termios termio, save_io;
 
 static char *parenttty, *childtty;
 static int parentfd = -1, childfd = -1;
@@ -76,10 +76,10 @@ static void verify_ioctl(void)
 	int rval = run_ptest();
 
 	if (rval != 0)
-		tst_res(TFAIL, "TCGETA/TCSETA tests FAILED with "
+		tst_res(TFAIL, "TCGETS/TCSETS tests FAILED with "
 				"%d %s", rval, rval > 1 ? "errors" : "error");
 	else
-		tst_res(TPASS, "TCGETA/TCSETA tests SUCCEEDED");
+		tst_res(TPASS, "TCGETS/TCSETS tests SUCCEEDED");
 
 	TST_CHECKPOINT_WAKE(checkpoint_parent_done_testing);
 }
@@ -95,7 +95,7 @@ static void do_child(void)
 
 /*
  * run_ptest() - setup the various termio structure values and issue
- *		 the TCSETA ioctl call with the TEST macro.
+ *		 the TCSETS ioctl call with the TEST macro.
  */
 static int run_ptest(void)
 {
@@ -124,10 +124,10 @@ static int run_ptest(void)
 	/* Set output modes. */
 	termio.c_oflag = OPOST | OLCUC | ONLCR | ONOCR;
 
-	SAFE_IOCTL(parentfd, TCSETA, &termio);
+	SAFE_IOCTL(parentfd, TCSETS, &termio);
 
 	/* Get termio and see if all parameters actually got set */
-	SAFE_IOCTL(parentfd, TCGETA, &termio);
+	SAFE_IOCTL(parentfd, TCGETS, &termio);
 	return chk_tty_parms();
 }
 
@@ -215,7 +215,7 @@ static void setup(void)
 	int fd = SAFE_OPEN(device, O_RDWR, 0777);
 
 	/* Save the current device information - to be restored in cleanup() */
-	SAFE_IOCTL(fd, TCGETA, &save_io);
+	SAFE_IOCTL(fd, TCGETS, &save_io);
 
 	/* Close the device */
 	SAFE_CLOSE(fd);
@@ -224,7 +224,7 @@ static void setup(void)
 static void cleanup(void)
 {
 	if (parentfd >= 0) {
-		SAFE_IOCTL(parentfd, TCSETA, &save_io);
+		SAFE_IOCTL(parentfd, TCSETS, &save_io);
 		SAFE_CLOSE(parentfd);
 	}
 }
-- 
2.42.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
