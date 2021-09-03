Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FAC400290
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:03 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D77853C98EE
	for <lists+linux-ltp@lfdr.de>; Fri,  3 Sep 2021 17:49:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 89E563C2820
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:51 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A3DFF1001355
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 17:48:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 216F5203F2
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1630684130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hAYbz5VMYNKQQ95FMox+ozqZFw1DnXOz46ht3VGHd4=;
 b=wMLRWcPJf4wmnDFRRaTfVXjDrnkWCZNK4iB99WLdNEFRLR5rI0l8pEndBYVe27hTlVz9VO
 AXXhx4AHe1+YzLnDXsX+5fpCe1nzB7eSiSrPhEHWyQjjbm6K1jY6kmKj3Y+WLWXZ8KRL+P
 cMiGU3dF+IhOaAgTVUk6caZWDI4tpVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1630684130;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6hAYbz5VMYNKQQ95FMox+ozqZFw1DnXOz46ht3VGHd4=;
 b=ZHqIV2uf/4frPTOUK/EMxEufgSgyQqJtl6jVghWeo7opfiqEv4x3j3XwfP7aLTTGVSgd76
 /xOukWPaJgcQjbBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E9F313B08
 for <ltp@lists.linux.it>; Fri,  3 Sep 2021 15:48:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8C62AuJDMmHpXgAAMHmgww
 (envelope-from <mdoucha@suse.cz>)
 for <ltp@lists.linux.it>; Fri, 03 Sep 2021 15:48:50 +0000
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Fri,  3 Sep 2021 17:48:45 +0200
Message-Id: <20210903154848.18705-5-mdoucha@suse.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903154848.18705-1-mdoucha@suse.cz>
References: <20210903154848.18705-1-mdoucha@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 4/7] syscalls/kill05: Use any two unprivileged users
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

Usernames such as "bin" may not exist on some systems. Find and use any two
unprivileged user IDs for the test instead of specific named users.

Includes minor code style cleanup in wait_for_flag().

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 testcases/kernel/syscalls/kill/kill05.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/kill/kill05.c b/testcases/kernel/syscalls/kill/kill05.c
index e694126f6..1dfdda58f 100644
--- a/testcases/kernel/syscalls/kill/kill05.c
+++ b/testcases/kernel/syscalls/kill/kill05.c
@@ -17,15 +17,18 @@
  *	This test must be run as root.
  */
 
+#define _XOPEN_SOURCE 500
 #include <sys/wait.h>
+#include <sys/types.h>
 #include <pwd.h>
 #include <stdlib.h>
 #include "tst_test.h"
 #include "libnewipc.h"
 #include "tst_safe_sysv_ipc.h"
 #include "tst_safe_macros.h"
+#include "tst_uid.h"
 
-static uid_t nobody_uid, bin_uid;
+static uid_t test_users[2];
 static int *flag;
 static int shm_id = -1;
 static key_t shm_key;
@@ -35,8 +38,8 @@ static void wait_for_flag(int value)
 	while (1) {
 		if (*flag == value)
 			break;
-		else
-			usleep(100);
+
+		usleep(100);
 	}
 }
 
@@ -47,14 +50,14 @@ static void do_master_child(void)
 	*flag = 0;
 	pid1 = SAFE_FORK();
 	if (pid1 == 0) {
-		SAFE_SETREUID(nobody_uid, nobody_uid);
+		SAFE_SETREUID(test_users[0], test_users[0]);
 		*flag = 1;
 		wait_for_flag(2);
 
 		exit(0);
 	}
 
-	SAFE_SETREUID(bin_uid, bin_uid);
+	SAFE_SETREUID(test_users[1], test_users[1]);
 	wait_for_flag(1);
 	TEST(kill(pid1, SIGKILL));
 
@@ -85,17 +88,11 @@ static void verify_kill(void)
 
 static void setup(void)
 {
-	struct passwd *pw;
-
 	shm_key = GETIPCKEY();
 	shm_id = SAFE_SHMGET(shm_key, getpagesize(), 0666 | IPC_CREAT);
 	flag = SAFE_SHMAT(shm_id, 0, 0);
-
-	pw = SAFE_GETPWNAM("nobody");
-	nobody_uid = pw->pw_uid;
-
-	pw = SAFE_GETPWNAM("bin");
-	bin_uid = pw->pw_uid;
+	tst_get_uids(2, test_users);
+	endpwent();
 }
 
 static void cleanup(void)
-- 
2.33.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
