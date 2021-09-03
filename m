Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62A400293
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 329403C9575
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:20 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA6273C2862
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:51 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8DB8260106C
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1B7D226F0
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630684129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMDE7wgnvmiJRxvFuF3tAlgheGdFeoCoulNsFQjLAzk=;
 b=erSGSqriphdWMI219fPiLee88SeK3Wi1kHT8KNoETo2ZjVuc6Up4R1DCd/bt9j0yuvwBuf
 j5+oxm60j2gUCPgNdZd+MwIjTRVCo0irQDJDmFWU5MBOFuKUq4aytErqlWTPtMZLGiQmgo
 ciNX7dUFQC39RtQd/cxzruCdw8zp91s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630684129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HMDE7wgnvmiJRxvFuF3tAlgheGdFeoCoulNsFQjLAzk=;
 b=t5Eg/JFngBBdLE0IHI3oE1wulgJ5VdDdllI8hscQcx3GoampYoMmEUeo8fBoqjrXPFz39j
 EE47tJLaNYTdl4Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C303D13B86
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ENeZLuFDMmHpXgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 15:48:49 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 17:48:42 +0200
Message-Id: <20210903154848.18705-2-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903154848.18705-1-mdoucha@suse.cz>
References: <20210903154848.18705-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/7] chmod05,
 fchmod05: Use free GID instead of "bin" group
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

The bin user group does not exist on some systems which will cause test
failure. Set test directory ownership to any unused GID instead.

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/chmod/chmod05.c   | 7 ++++---
 testcases/kernel/syscalls/fchmod/fchmod05.c | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/testcases/kernel/syscalls/chmod/chmod05.c b/testcases/kernel/syscalls/chmod/chmod05.c
index 6a6a0ae21..f5b9d51e7 100644
--- a/testcases/kernel/syscalls/chmod/chmod05.c
+++ b/testcases/kernel/syscalls/chmod/chmod05.c
@@ -37,6 +37,7 @@
 #include <pwd.h>
 
 #include "tst_test.h"
+#include "tst_uid.h"
 
 #define MODE_RWX	(mode_t)(S_IRWXU | S_IRWXG | S_IRWXO)
 #define DIR_MODE	(mode_t)(S_ISVTX | S_ISGID | S_IFDIR)
@@ -69,10 +70,10 @@ static void test_chmod(void)
 static void setup(void)
 {
 	struct passwd *nobody_u;
-	struct group *bin_gr;
+	gid_t free_gid;
 
 	nobody_u = SAFE_GETPWNAM("nobody");
-	bin_gr = SAFE_GETGRNAM("bin");
+	free_gid = tst_get_free_gid(nobody_u->pw_gid);
 
 	/*
 	 * Create a test directory under temporary directory with specified
@@ -83,7 +84,7 @@ static void setup(void)
 	if (setgroups(1, &nobody_u->pw_gid) == -1)
 		tst_brk(TBROK | TERRNO, "setgroups to nobody's gid failed");
 
-	SAFE_CHOWN(TESTDIR, nobody_u->pw_uid, bin_gr->gr_gid);
+	SAFE_CHOWN(TESTDIR, nobody_u->pw_uid, free_gid);
 
 	/* change to nobody:nobody */
 	SAFE_SETEGID(nobody_u->pw_gid);
diff --git a/testcases/kernel/syscalls/fchmod/fchmod05.c b/testcases/kernel/syscalls/fchmod/fchmod05.c
index f75b9bf36..0c731d601 100644
--- a/testcases/kernel/syscalls/fchmod/fchmod05.c
+++ b/testcases/kernel/syscalls/fchmod/fchmod05.c
@@ -20,6 +20,7 @@
 #include <errno.h>
 
 #include "tst_test.h"
+#include "tst_uid.h"
 #include "fchmod.h"
 
 #define PERMS_DIR	043777
@@ -50,10 +51,10 @@ static void verify_fchmod(void)
 static void setup(void)
 {
 	struct passwd *ltpuser;
-	struct group *ltpgroup;
+	gid_t free_gid;
 
 	ltpuser = SAFE_GETPWNAM("nobody");
-	ltpgroup = SAFE_GETGRNAM("bin");
+	free_gid = tst_get_free_gid(ltpuser->pw_gid);
 
 	SAFE_MKDIR(TESTDIR, DIR_MODE);
 
@@ -62,7 +63,7 @@ static void setup(void)
 			tst_strerrno(TST_ERR));
 	}
 
-	SAFE_CHOWN(TESTDIR, ltpuser->pw_uid, ltpgroup->gr_gid);
+	SAFE_CHOWN(TESTDIR, ltpuser->pw_uid, free_gid);
 
 	SAFE_SETEGID(ltpuser->pw_gid);
 	SAFE_SETEUID(ltpuser->pw_uid);
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
