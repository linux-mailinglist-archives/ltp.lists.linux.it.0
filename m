Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E708363A9F
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 06:41:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F11EB3C6D71
	for <lists+linux-ltp@lfdr.de>; Mon, 19 Apr 2021 06:41:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB3BD3C19DA
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 06:41:25 +0200 (CEST)
Received: from mail-m974.mail.163.com (mail-m974.mail.163.com [123.126.97.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 17434600762
 for <ltp@lists.linux.it>; Mon, 19 Apr 2021 06:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7WtQp
 8AZDMf+OxqzOCfILLgHKNOL52Ghi/UqUaLMfr4=; b=bRfoYddum6Mn8SSwjFA2L
 rOxKwNf+4sWSlhZmEjjEEqHIfFPRRxCF3d//IZc/NWZ1LXy+ZBggv34M06xDM+z/
 lBprPCQUZTKaMEAMSWPpcAKPRDsWr8hBjfb24cwP/FeEWv46zKuKBG2y6UtAY4XH
 Rn+kIp5xHBKUE/z3SKS4gY=
Received: from localhost.localdomain (unknown [122.96.44.167])
 by smtp4 (Coremail) with SMTP id HNxpCgCXGyHpCX1g+oP0JQ--.450S3;
 Mon, 19 Apr 2021 12:41:15 +0800 (CST)
From: ice_yangxiao@163.com
To: ltp@lists.linux.it
Date: Mon, 19 Apr 2021 12:41:12 +0800
Message-Id: <20210419044112.31443-2-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210419044112.31443-1-ice_yangxiao@163.com>
References: <20210419044112.31443-1-ice_yangxiao@163.com>
MIME-Version: 1.0
X-CM-TRANSID: HNxpCgCXGyHpCX1g+oP0JQ--.450S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw13uF1rAr1xKFy7XFyfCrg_yoW8uw4rpw
 43A3yIqFZ5tF4xtrW3Xrnaga1Du3Z7tw1xKr1ruws3WF48ZFy5tFsIga45WryUZFyxuFWF
 qa18WrWayw1UZFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jeiihUUUUU=
X-Originating-IP: [122.96.44.167]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiMwt5XlXl8uONIQAAsS
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH v2 2/2] syscalls/{wait401.c,
 waitpid01.c}: Take use of TST_EXP_PID_SILENT()
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

From: Xiao Yang <yangx.jy@fujitsu.com>

Also correct the name(waitpid=>wait4) in the output of wait401.

Signed-off-by: Xiao Yang <yangx.jy@fujitsu.com>
---

V1->V2:
Return immediately if TST_PASS == 0

 testcases/kernel/syscalls/wait4/wait401.c     | 10 ++++------
 testcases/kernel/syscalls/waitpid/waitpid01.c | 14 +++++++-------
 2 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/wait4/wait401.c b/testcases/kernel/syscalls/wait4/wait401.c
index 07fb864f3..ab99891be 100644
--- a/testcases/kernel/syscalls/wait4/wait401.c
+++ b/testcases/kernel/syscalls/wait4/wait401.c
@@ -29,17 +29,15 @@ static void run(void)
 		exit(0);
 	}
 
-	TEST(wait4(pid, &status, 0, &rusage));
-	if (TST_RET == -1) {
-		tst_res(TFAIL | TTERRNO, "wait4() failed");
+	TST_EXP_PID_SILENT(wait4(pid, &status, 0, &rusage), "wait4()");
+	if (!TST_PASS)
 		return;
-	}
 
 	if (TST_RET != pid) {
-		tst_res(TFAIL, "waitpid() returned wrong pid %li, expected %i",
+		tst_res(TFAIL, "wait4() returned wrong pid %li, expected %i",
 			TST_RET, pid);
 	} else {
-		tst_res(TPASS, "waitpid() returned correct pid %i", pid);
+		tst_res(TPASS, "wait4() returned correct pid %i", pid);
 	}
 
 	if (!WIFEXITED(status)) {
diff --git a/testcases/kernel/syscalls/waitpid/waitpid01.c b/testcases/kernel/syscalls/waitpid/waitpid01.c
index 6e03acef6..5a39a1107 100644
--- a/testcases/kernel/syscalls/waitpid/waitpid01.c
+++ b/testcases/kernel/syscalls/waitpid/waitpid01.c
@@ -18,7 +18,7 @@
 
 static void run(void)
 {
-	pid_t pid, rpid;
+	pid_t pid;
 	int status;
 
 	pid = SAFE_FORK();
@@ -27,13 +27,13 @@ static void run(void)
 		exit(0);
 	}
 
-	rpid = waitpid(pid, &status, 0);
-	if (rpid < 0)
-		tst_brk(TBROK | TERRNO, "waitpid() failed");
+	TST_EXP_PID_SILENT(waitpid(pid, &status, 0));
+	if (!TST_PASS)
+		return;
 
-	if (rpid != pid) {
-		tst_res(TFAIL, "waitpid() returned wrong pid %i, expected %i",
-		        rpid, pid);
+	if (TST_RET != pid) {
+		tst_res(TFAIL, "waitpid() returned wrong pid %li, expected %i",
+			TST_RET, pid);
 	} else {
 		tst_res(TPASS, "waitpid() returned correct pid %i", pid);
 	}
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
