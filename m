Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB401A1DDD
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 11:06:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDF483C2D30
	for <lists+linux-ltp@lfdr.de>; Wed,  8 Apr 2020 11:06:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 1BF7A3C061B
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 11:06:39 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DC41214017E5
 for <ltp@lists.linux.it>; Wed,  8 Apr 2020 11:06:38 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 23619ACBA;
 Wed,  8 Apr 2020 09:06:37 +0000 (UTC)
From: Richard Palethorpe <rpalethorpe@suse.com>
To: ltp@lists.linux.it
Date: Wed,  8 Apr 2020 11:06:34 +0200
Message-Id: <20200408090635.4686-1-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] add_key05: Avoid race with key garbage collection
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

The key subsystem independently tracks user info against UID. If a user is
deleted and the UID reused for a new user then the key subsystem will mistake
the new user for the old one.

The keys/keyrings may not be accessible to the new user, but if they are not
yet garbage collected (which happens asynchronously) then the new user may be
exceeding its quota limits.

This results in a race condition where this test can fail because the old
thread keyring is taking up the full quota. We should be able to avoid this by
creating two users in parallel instead of sequentially so that they have
different UIDs.

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 testcases/kernel/syscalls/add_key/add_key05.c | 36 ++++++++++---------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/testcases/kernel/syscalls/add_key/add_key05.c b/testcases/kernel/syscalls/add_key/add_key05.c
index f64c359bb..5691b8579 100644
--- a/testcases/kernel/syscalls/add_key/add_key05.c
+++ b/testcases/kernel/syscalls/add_key/add_key05.c
@@ -19,8 +19,6 @@
 #include "lapi/keyctl.h"
 
 static char *user_buf;
-static const char *username = "ltp_add_key05";
-static int user_added;
 struct passwd *ltpuser;
 static char fmt[1024];
 
@@ -30,30 +28,29 @@ static const char *const save_restore[] = {
 	NULL,
 };
 
-static void add_user(void)
+static void add_user(char n)
 {
-	if (user_added)
-		return;
-
+	char username[] = "ltp_add_key05_n";
 	const char *const cmd_useradd[] = {"useradd", username, NULL};
 
+	username[sizeof(username) - 2] = '0' + n;
+
 	SAFE_CMD(cmd_useradd, NULL, NULL);
-	user_added = 1;
 	ltpuser = SAFE_GETPWNAM(username);
 	sprintf(fmt, "%5u: %%*5d %%*d/%%*d %%d/%%d %%d/%%d", ltpuser->pw_uid);
+
+	tst_res(TINFO, "Created user %s", ltpuser->pw_name);
 }
 
-static void clean_user(void)
+static void clean_user(char n)
 {
-	if (!user_added)
-		return;
-
+	char username[] = "ltp_add_key05_n";
 	const char *const cmd_userdel[] = {"userdel", "-r", username, NULL};
 
+	username[sizeof(username) - 2] = '0' + n;
+
 	if (tst_cmd(cmd_userdel, NULL, NULL, TST_CMD_PASS_RETVAL))
 		tst_res(TWARN | TERRNO, "'userdel -r %s' failed", username);
-	else
-		user_added = 0;
 }
 
 static inline void parse_proc_key_users(int *used_key, int *max_key, int *used_bytes, int *max_bytes)
@@ -170,7 +167,6 @@ count:
 
 static void do_test(unsigned int n)
 {
-	add_user();
 	if (!SAFE_FORK()) {
 		SAFE_SETUID(ltpuser->pw_uid);
 		TEST(add_key("user", "test1", user_buf, 64, KEY_SPEC_THREAD_KEYRING));
@@ -185,13 +181,21 @@ static void do_test(unsigned int n)
 		exit(0);
 	}
 	tst_reap_children();
-	clean_user();
 }
 
 static void setup(void)
 {
 	SAFE_FILE_PRINTF("/proc/sys/kernel/keys/maxkeys", "200");
 	SAFE_FILE_PRINTF("/proc/sys/kernel/keys/maxbytes", "20000");
+
+	add_user(0);
+	add_user(1);
+}
+
+static void cleanup(void)
+{
+	clean_user(0);
+	clean_user(1);
 }
 
 static struct tst_test test = {
@@ -200,7 +204,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.forks_child = 1,
 	.setup = setup,
-	.cleanup = clean_user,
+	.cleanup = cleanup,
 	.save_restore = save_restore,
 	.bufs = (struct tst_buffers []) {
 		{&user_buf, .size = 64},
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
