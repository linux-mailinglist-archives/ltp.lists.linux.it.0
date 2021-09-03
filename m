Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB12400295
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:39 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E43563C9591
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A8D8C3C2822
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 8EA61201097
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 323BE2272F
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630684130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3U8eVNvbNhUoOpQ5eYXge9j4XMciUFQAQQ0CeIvMbU=;
 b=uBdt62IEUyF+niBxacEGJZEHOVmyyPy77ob5L8ZN7ZOBLfClPqT71YhURQNpvKsbczp7dQ
 KK7sxKnZPS90ncXvGXR5GuQfNLFS7P3I4m34tkr2QkE+fMSGZhf+gGev0unXTfDIgaLuIe
 e+smx5f+iEIpc/AGWQa6McnnBLzJUlM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630684130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X3U8eVNvbNhUoOpQ5eYXge9j4XMciUFQAQQ0CeIvMbU=;
 b=8cHHiaQXLOus93rZYMrreSgfn1I3Mg7rDtPeqIDr27WiFrknqhqkh5F4M0GFASqt2DvXrh
 vtQKnAdF5d7YQcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 224C113B86
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +I2BB+JDMmHpXgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 15:48:50 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 17:48:46 +0200
Message-Id: <20210903154848.18705-6-mdoucha@suse.cz>
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
Subject: [LTP] [PATCH 5/7] syscalls/mkdir04: Simplify test and use any
 existing users
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

mkdir04 does not need to fork() in setup(). Usernames such as "bin" may not
exist on some systems. Find and use any two unprivileged users instead of
specific named users.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/mkdir/mkdir04.c | 30 ++++++-----------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/testcases/kernel/syscalls/mkdir/mkdir04.c b/testcases/kernel/syscalls/mkdir/mkdir04.c
index 87512a4be..3880611d7 100644
--- a/testcases/kernel/syscalls/mkdir/mkdir04.c
+++ b/testcases/kernel/syscalls/mkdir/mkdir04.c
@@ -7,20 +7,16 @@
  * user with restrictive permissions and that the errno is set to EACCESS.
  */
 
+#define _XOPEN_SOURCE 500
 #include <errno.h>
-#include <sys/stat.h>
 #include <sys/types.h>
 #include <pwd.h>
-#include <sys/wait.h>
-#include <unistd.h>
-#include <stdlib.h>
 #include "tst_test.h"
+#include "tst_uid.h"
 
 #define TESTDIR	 "testdir"
 #define TESTSUBDIR "testdir/testdir"
 
-static uid_t nobody_uid, bin_uid;
-
 static void verify_mkdir(void)
 {
 	if (mkdir(TESTSUBDIR, 0777) != -1) {
@@ -39,24 +35,15 @@ static void verify_mkdir(void)
 
 static void setup(void)
 {
-	struct passwd *pw;
-	pid_t pid;
-
-	pw = SAFE_GETPWNAM("nobody");
-	nobody_uid = pw->pw_uid;
-	pw = SAFE_GETPWNAM("bin");
-	bin_uid = pw->pw_uid;
+	uid_t test_users[2];
 
-	pid = SAFE_FORK();
-	if (pid == 0) {
-		SAFE_SETREUID(nobody_uid, nobody_uid);
-		SAFE_MKDIR(TESTDIR, 0700);
-		exit(0);
-	}
+	tst_get_uids(2, test_users);
+	endpwent();
 
-	tst_reap_children();
+	SAFE_MKDIR(TESTDIR, 0700);
+	SAFE_CHOWN(TESTDIR, test_users[0], getgid());
 
-	SAFE_SETREUID(bin_uid, bin_uid);
+	SAFE_SETREUID(test_users[1], test_users[1]);
 }
 
 static struct tst_test test = {
@@ -64,5 +51,4 @@ static struct tst_test test = {
 	.needs_tmpdir = 1,
 	.needs_root = 1,
 	.setup = setup,
-	.forks_child = 1,
 };
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
