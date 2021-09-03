Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1FA400292
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F00983C958E
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A4BE33C27DB
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9AB3E2010A0
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EABB222728
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630684129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6Ndiga4VHgWireYjM6kSQwTql+J/c3KBMdDA56DhuI=;
 b=qsauB9T/u6YxCd2seFWcfeWHMqbGywqnyFUWO8wc45HLE39wCAOFpbftKgm1Z6qZPRBi24
 vmAewc8d80yJ0fnsuaeR+wIx16+DmnvM6/Skn65QL1ZOyXCphOR6ImAwnLfALc0PfLXl1P
 +nJodk7dXvXh54CsKY6Anz8Fs28i134=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630684129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6Ndiga4VHgWireYjM6kSQwTql+J/c3KBMdDA56DhuI=;
 b=YvOk7qRxEMLnwmsbsgn8Omxj87/8H1JnKNgGecy7ibrK06EXMRM+2PZ8uS25G23HC0lz+o
 TouQbje07rfzfoAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D87D713B08
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8PTmM+FDMmHpXgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 15:48:49 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 17:48:43 +0200
Message-Id: <20210903154848.18705-3-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903154848.18705-1-mdoucha@suse.cz>
References: <20210903154848.18705-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 2/7] Simplify syscalls/mkdir02
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

mkdir02 does a lot of unnecessary fork()ing left over from the old version.
The same test can be done with just user "nobody", one unused GID and no
fork()ing at all.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/mkdir/mkdir02.c | 77 +++++++----------------
 1 file changed, 24 insertions(+), 53 deletions(-)

diff --git a/testcases/kernel/syscalls/mkdir/mkdir02.c b/testcases/kernel/syscalls/mkdir/mkdir02.c
index f09e3c33d..2cb199c56 100644
--- a/testcases/kernel/syscalls/mkdir/mkdir02.c
+++ b/testcases/kernel/syscalls/mkdir/mkdir02.c
@@ -9,85 +9,57 @@
  *  bit is set in the parent directory.
  */
 
-#include <errno.h>
 #include <sys/stat.h>
 #include <sys/types.h>
 #include <pwd.h>
-#include <sys/wait.h>
-#include <unistd.h>
-#include <stdlib.h>
 #include "tst_test.h"
+#include "tst_uid.h"
 
 #define TESTDIR1	"testdir1"
 #define TESTDIR2	"testdir1/testdir2"
 
-static uid_t nobody_uid, bin_uid;
-static gid_t nobody_gid, bin_gid;
+static gid_t free_gid;
 
 static void verify_mkdir(void)
 {
-	struct stat buf1, buf2;
-	pid_t pid;
+	struct stat statbuf;
 	int fail = 0;
 
-	pid = SAFE_FORK();
-	if (pid == 0) {
-		SAFE_SETREGID(bin_gid, bin_gid);
-		SAFE_SETREUID(bin_uid, bin_uid);
-		SAFE_MKDIR(TESTDIR2, 0777);
+	SAFE_MKDIR(TESTDIR2, 0777);
+	SAFE_STAT(TESTDIR2, &statbuf);
 
-		SAFE_STAT(TESTDIR2, &buf2);
-		SAFE_STAT(TESTDIR1, &buf1);
-
-		if (buf2.st_gid != buf1.st_gid) {
-			tst_res(TFAIL,
-				"New dir FAILED to inherit GID have %d expected %d",
-				buf2.st_gid, buf1.st_gid);
-			fail = 1;
-		}
-
-		if (!(buf2.st_mode & S_ISGID)) {
-			tst_res(TFAIL, "New dir FAILED to inherit S_ISGID");
-			fail = 1;
-		}
-
-		if (!fail)
-			tst_res(TPASS, "New dir inherited GID and S_ISGID");
+	if (statbuf.st_gid != free_gid) {
+		tst_res(TFAIL,
+			"New dir FAILED to inherit GID: has %d, expected %d",
+			statbuf.st_gid, free_gid);
+		fail = 1;
+	}
 
-		exit(0);
+	if (!(statbuf.st_mode & S_ISGID)) {
+		tst_res(TFAIL, "New dir FAILED to inherit S_ISGID");
+		fail = 1;
 	}
 
-	tst_reap_children();
+	if (!fail)
+		tst_res(TPASS, "New dir inherited GID and S_ISGID");
+
 	SAFE_RMDIR(TESTDIR2);
 }
 
 
 static void setup(void)
 {
-	struct passwd *pw;
-	struct stat buf;
-	pid_t pid;
+	struct passwd *pw = SAFE_GETPWNAM("nobody");
 
-	pw = SAFE_GETPWNAM("nobody");
-	nobody_uid = pw->pw_uid;
-	nobody_gid = pw->pw_gid;
-	pw = SAFE_GETPWNAM("bin");
-	bin_uid = pw->pw_uid;
-	bin_gid = pw->pw_gid;
+	free_gid = tst_get_free_gid(pw->pw_gid);
 
 	umask(0);
+	SAFE_MKDIR(TESTDIR1, 0777);
+	SAFE_CHMOD(TESTDIR1, 0777 | S_ISGID);
+	SAFE_CHOWN(TESTDIR1, getuid(), free_gid);
 
-	pid = SAFE_FORK();
-	if (pid == 0) {
-		SAFE_SETREGID(nobody_gid, nobody_gid);
-		SAFE_SETREUID(nobody_uid, nobody_uid);
-		SAFE_MKDIR(TESTDIR1, 0777);
-		SAFE_STAT(TESTDIR1, &buf);
-		SAFE_CHMOD(TESTDIR1, buf.st_mode | S_ISGID);
-		exit(0);
-	}
-
-	tst_reap_children();
+	SAFE_SETREGID(pw->pw_gid, pw->pw_gid);
+	SAFE_SETREUID(pw->pw_uid, pw->pw_uid);
 }
 
 static struct tst_test test = {
@@ -95,5 +67,4 @@ static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.needs_root = 1,
 	.test_all = verify_mkdir,
-	.forks_child = 1,
 };
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
