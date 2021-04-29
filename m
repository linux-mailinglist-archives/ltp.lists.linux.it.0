Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A66436EAE7
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 14:53:19 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B171F3C6178
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 14:53:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C5B133C6147
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 14:53:17 +0200 (CEST)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 8398F601029
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 14:53:15 +0200 (CEST)
Received: from dggeml753-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FWFjV5qZ2zYc9C
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 20:50:54 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.63) by
 dggeml753-chm.china.huawei.com (10.1.199.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 29 Apr 2021 20:53:12 +0800
From: Zhao Gongyi <zhaogongyi@huawei.com>
To: <ltp@lists.linux.it>
Date: Thu, 29 Apr 2021 20:52:37 +0800
Message-ID: <20210429125237.31461-1-zhaogongyi@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.63]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeml753-chm.china.huawei.com (10.1.199.152)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 3/4] syscalls/getpgid01: Replace TINFO with TPASS or
 TFAIL
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

1)remove fail flag
2)remove redundant log
3)replace TINFO with TPASS or TFAIL

Signed-off-by: Zhao Gongyi <zhaogongyi@huawei.com>
---
 testcases/kernel/syscalls/getpgid/getpgid01.c | 74 ++++---------------
 1 file changed, 13 insertions(+), 61 deletions(-)

diff --git a/testcases/kernel/syscalls/getpgid/getpgid01.c b/testcases/kernel/syscalls/getpgid/getpgid01.c
index 9af523d88..060486e7e 100644
--- a/testcases/kernel/syscalls/getpgid/getpgid01.c
+++ b/testcases/kernel/syscalls/getpgid/getpgid01.c
@@ -62,7 +62,7 @@ int main(int ac, char **av)

 	register int pgid_0, pgid_1;
 	register int my_pid, my_ppid;
-	int ex_stat, fail = 0;
+	int ex_stat;

 	tst_parse_opts(ac, av, NULL, NULL);

@@ -77,30 +77,19 @@ int main(int ac, char **av)
 			while ((pgid_0 = wait(&ex_stat)) != -1) ;

 			if (WEXITSTATUS(ex_stat) == 0)
-				tst_resm(TINFO, "%s PASSED", TCID);
+				tst_resm(TPASS, "%s PASSED", TCID);
 			else
-				tst_resm(TINFO, "%s FAILED", TCID);
+				tst_resm(TFAIL, "%s FAILED", TCID);

 			exit(0);
 		}

-		tst_resm(TINFO, "Enter block 1");
-		fail = 0;
-		if ((pgid_0 = getpgid(0)) == -1) {
+		if ((pgid_0 = getpgid(0)) == -1)
 			tst_resm(TFAIL | TERRNO, "getpgid(0) failed");
-			fail = 1;
-		}
-
-		if (fail)
-			tst_resm(TINFO, "Test block 1: getpgid(0) FAILED");
 		else
-			tst_resm(TPASS, "Test block 1: getpgid(0) PASSED");
-		tst_resm(TINFO, "Exit block 1");
+			tst_resm(TPASS, "getpgid(0) PASSED");

 //block2:
-		tst_resm(TINFO, "Enter block 2");
-		fail = 0;
-
 		my_pid = getpid();
 		if ((pgid_1 = getpgid(my_pid)) == -1)
 			tst_resm(TFAIL | TERRNO, "getpgid(%d) failed", my_pid);
@@ -108,20 +97,10 @@ int main(int ac, char **av)
 		if (pgid_0 != pgid_1) {
 			tst_resm(TFAIL, "getpgid(my_pid=%d) != getpgid(0) "
 				 "[%d != %d]", my_pid, pgid_1, pgid_0);
-			fail = 1;
-		}
-		if (fail)
-			tst_resm(TINFO, "Test block 2: getpgid(getpid()) "
-				 "FAILED");
-		else
-			tst_resm(TPASS, "Test block 2: getpgid(getpid()) "
-				 "PASSED");
-		tst_resm(TINFO, "Exit block 2");
+		} else
+			tst_resm(TPASS, "getpgid(getpid()) PASSED");

 //block3:
-		tst_resm(TINFO, "Enter block 3");
-		fail = 0;
-
 		my_ppid = getppid();
 		if ((pgid_1 = getpgid(my_ppid)) == -1)
 			tst_resm(TFAIL | TERRNO, "getpgid(%d) failed", my_ppid);
@@ -129,51 +108,24 @@ int main(int ac, char **av)
 		if (pgid_0 != pgid_1) {
 			tst_resm(TFAIL, "getpgid(%d) != getpgid(0) [%d != %d]",
 				 my_ppid, pgid_1, pgid_0);
-			fail = 1;
-		}
-
-		if (fail) {
-			tst_resm(TINFO, "Test block 3: getpgid(getppid()) "
-				 "FAILED");
-		} else {
-			tst_resm(TPASS, "Test block 3: getpgid(getppid()) "
-				 "PASSED");
-		}
-		tst_resm(TINFO, "Exit block 3");
+		} else
+			tst_resm(TPASS, "getpgid(getppid()) PASSED");

 //block4:
-		tst_resm(TINFO, "Enter block 4");
-		fail = 0;
-
 		if ((pgid_1 = getpgid(pgid_0)) < 0)
 			tst_resm(TFAIL | TERRNO, "getpgid(%d) failed", pgid_0);

 		if (pgid_0 != pgid_1) {
 			tst_resm(TFAIL, "getpgid(%d) != getpgid(0) [%d != %d]",
 				 pgid_0, pgid_1, pgid_0);
-			fail = 1;
-		}
-
-		if (fail)
-			tst_resm(TINFO, "Test block 4: getpgid(1) FAILED");
-		else
-			tst_resm(TPASS, "Test block 4: getpgid(1) PASSED");
-		tst_resm(TINFO, "Exit block 4");
+		} else
+			tst_resm(TPASS, "getpgid(%d) PASSED", pgid_0);

 //block5:
-		tst_resm(TINFO, "Enter block 5");
-		fail = 0;
-
-		if (getpgid(1) < 0) {
+		if (getpgid(1) < 0)
 			tst_resm(TFAIL | TERRNO, "getpgid(1) failed");
-			fail = 1;
-		}
-
-		if (fail)
-			tst_resm(TINFO, "Test block 5: getpgid(1) FAILED");
 		else
-			tst_resm(TPASS, "Test block 5: getpgid(1) PASSED");
-		tst_resm(TINFO, "Exit block 5");
+			tst_resm(TPASS, "getpgid(1) PASSED");
 	}
 	cleanup();
 	tst_exit();
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
