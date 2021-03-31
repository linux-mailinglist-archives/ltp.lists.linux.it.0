Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A9634FDBD
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 12:03:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 97E3C3C8A27
	for <lists+linux-ltp@lfdr.de>; Wed, 31 Mar 2021 12:03:51 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 34A3D3C0CB5
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 12:03:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A26E41000B44
 for <ltp@lists.linux.it>; Wed, 31 Mar 2021 12:03:47 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C4789AF17;
 Wed, 31 Mar 2021 10:03:46 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 31 Mar 2021 12:03:40 +0200
Message-Id: <20210331100340.28034-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] chdir01: Skip nobody when problems on umask 0070
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

FAT and exFAT from Samsung have EACCES for nobody on umask 0070.

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 testcases/kernel/syscalls/chdir/chdir01.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/chdir/chdir01.c b/testcases/kernel/syscalls/chdir/chdir01.c
index 23cd455d6..57b92f3f8 100644
--- a/testcases/kernel/syscalls/chdir/chdir01.c
+++ b/testcases/kernel/syscalls/chdir/chdir01.c
@@ -27,7 +27,7 @@
 #define LINK_NAME2 "symloop2"
 
 static char *workdir;
-static int skip_symlinks, skip_blocked;
+static int skip_symlinks, skip_blocked, skip_umask;
 static struct passwd *ltpuser;
 
 static struct test_case {
@@ -57,6 +57,11 @@ static void setup(void)
 	SAFE_CHDIR(workdir);
 
 	mode_t sys_umask = umask(0);
+
+	/* FAT and exFAT from Samsung have EACCES for nobody on umask 0070 */
+	if (sys_umask & S_IRWXG)
+		skip_umask = 1;
+
 	SAFE_MKDIR(DIR_NAME, 0755);
 	SAFE_MKDIR(BLOCKED_NAME, 0644);
 	umask(sys_umask);
@@ -118,8 +123,7 @@ static void run(unsigned int n)
 	check_result("root", tc->name, tc->root_ret, tc->root_err);
 
 	if (tc->nobody_err == EACCES && skip_blocked) {
-		tst_res(TCONF, "Skipping unprivileged permission test, "
-			"FS mangles dir mode");
+		tst_res(TCONF, "Skipping unprivileged permission test, FS mangles dir mode");
 		return;
 	}
 
@@ -127,6 +131,12 @@ static void run(unsigned int n)
 	SAFE_SETEUID(ltpuser->pw_uid);
 	TEST(chdir(tc->name));
 	SAFE_SETEUID(0);
+
+	if (skip_blocked && skip_umask && TST_ERR == EACCES) {
+		tst_res(TCONF, "Skipping unprivileged permission test, FS mangles dir mode on umask");
+		return;
+	}
+
 	check_result("nobody", tc->name, tc->nobody_ret, tc->nobody_err);
 }
 
-- 
2.30.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
