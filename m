Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 840EE1C8C0A
	for <lists+linux-ltp@lfdr.de>; Thu,  7 May 2020 15:24:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D75373C734F
	for <lists+linux-ltp@lfdr.de>; Thu,  7 May 2020 15:24:12 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 698E63C719A
 for <ltp@lists.linux.it>; Thu,  7 May 2020 15:24:08 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6EA962001DD
 for <ltp@lists.linux.it>; Thu,  7 May 2020 15:24:08 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 671E1ACED
 for <ltp@lists.linux.it>; Thu,  7 May 2020 13:24:10 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Thu,  7 May 2020 15:24:30 +0200
Message-Id: <20200507132430.22677-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [COMMITTED] [PATCH] syscall/prctl06: Fix proc NoNewPrivs
 detection
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

The prctl() syscall check does return in case of success hence the check
for NoNewPrivs was never executed. Move the proc check before the sycall
check to fix that.

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/prctl/prctl06.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/prctl/prctl06.c b/testcases/kernel/syscalls/prctl/prctl06.c
index 3ebf1ab60..d6517e6b1 100644
--- a/testcases/kernel/syscalls/prctl/prctl06.c
+++ b/testcases/kernel/syscalls/prctl/prctl06.c
@@ -87,6 +87,12 @@ static void setup(void)
 	SAFE_CHOWN(BIN_PATH, 0, 0);
 	SAFE_CHMOD(BIN_PATH, SUID_MODE);
 
+	if (FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d", &field)) {
+		tst_res(TCONF, "%s doesn't support NoNewPrivs field", PROC_STATUS);
+		proc_flag = 0;
+		proc_sup = "No";
+	}
+
 	TEST(prctl(PR_GET_NO_NEW_PRIVS, 0, 0, 0, 0));
 	if (TST_RET == 0) {
 		tst_res(TINFO, "kernel supports PR_GET/SET_NO_NEW_PRIVS");
@@ -99,13 +105,6 @@ static void setup(void)
 
 	tst_brk(TBROK | TTERRNO,
 		"current environment doesn't permit PR_GET/SET_NO_NEW_PRIVS");
-
-	TEST(FILE_LINES_SCANF(PROC_STATUS, "NoNewPrivs:%d", &field));
-	if (TST_RET == 1) {
-		tst_res(TCONF, "%s doesn't support NoNewPrivs field", PROC_STATUS);
-		proc_flag = 0;
-		proc_sup = "No";
-	}
 }
 
 static const char *const resfile[] = {
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
