Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8637A1B7
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 10:26:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 747693C6493
	for <lists+linux-ltp@lfdr.de>; Tue, 11 May 2021 10:26:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95C3C3C4E13
 for <ltp@lists.linux.it>; Tue, 11 May 2021 10:26:39 +0200 (CEST)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id AD2311A007E3
 for <ltp@lists.linux.it>; Tue, 11 May 2021 10:26:37 +0200 (CEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfWDP5dhVzlYwZ
 for <ltp@lists.linux.it>; Tue, 11 May 2021 16:24:21 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 16:26:23 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Tue, 11 May 2021 16:26:44 +0800
Message-ID: <20210511082644.110124-1-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2] kernel/syscalls: Modify incorrect use of
 TERRNO/TTERRNO
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

modify some incorrect use of TERRNO/TTERRNO in kernel/syscalls;

Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
v1->v2:
1. Remove the modification of safe_macros, as these two would be better to put 2 commits.

 testcases/kernel/syscalls/bpf/bpf_map01.c                     | 2 +-
 testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c | 2 +-
 testcases/kernel/syscalls/dup/dup03.c                         | 4 ++--
 testcases/kernel/syscalls/execve/execve02.c                   | 4 ++--
 testcases/kernel/syscalls/ioctl/ioctl04.c                     | 4 ++--
 testcases/kernel/syscalls/ioperm/ioperm01.c                   | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/testcases/kernel/syscalls/bpf/bpf_map01.c b/testcases/kernel/syscalls/bpf/bpf_map01.c
index 122b18f25..94f9b7873 100644
--- a/testcases/kernel/syscalls/bpf/bpf_map01.c
+++ b/testcases/kernel/syscalls/bpf/bpf_map01.c
@@ -82,7 +82,7 @@ void run(unsigned int n)
 			if (i < VAL_SZ)
 				tst_res(TPASS, "Preallocated array map lookup");
 		} else {
-			tst_res(TFAIL | TERRNO, "Prellocated array map lookup");
+			tst_res(TFAIL | TTERRNO, "Prellocated array map lookup");
 		}
 	break;
 	}
diff --git a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
index 516ab50f1..382497918 100644
--- a/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
+++ b/testcases/kernel/syscalls/clock_nanosleep/clock_nanosleep01.c
@@ -208,7 +208,7 @@ static void do_test(unsigned int i)
 		return;
 	}

-	tst_res(TPASS | TERRNO, "clock_nanosleep() failed with");
+	tst_res(TPASS | TTERRNO, "clock_nanosleep() failed with");
 }

 static struct tst_test test = {
diff --git a/testcases/kernel/syscalls/dup/dup03.c b/testcases/kernel/syscalls/dup/dup03.c
index caef078b2..0e99813f4 100644
--- a/testcases/kernel/syscalls/dup/dup03.c
+++ b/testcases/kernel/syscalls/dup/dup03.c
@@ -30,9 +30,9 @@ static void run(void)

 	if (TST_RET == -1) {
 		if (TST_ERR == EMFILE)
-			tst_res(TPASS | TERRNO, "dup() failed as expected");
+			tst_res(TPASS | TTERRNO, "dup() failed as expected");
 		else
-			tst_res(TFAIL | TERRNO, "dup() failed unexpectedly");
+			tst_res(TFAIL | TTERRNO, "dup() failed unexpectedly");
 		return;
 	}

diff --git a/testcases/kernel/syscalls/execve/execve02.c b/testcases/kernel/syscalls/execve/execve02.c
index d9fb5b919..0574f5c8b 100644
--- a/testcases/kernel/syscalls/execve/execve02.c
+++ b/testcases/kernel/syscalls/execve/execve02.c
@@ -49,9 +49,9 @@ static void do_child(void)
 		tst_brk(TFAIL, "execve() passed unexpectedly");

 	if (TST_ERR != EACCES)
-		tst_brk(TFAIL | TERRNO, "execve() failed unexpectedly");
+		tst_brk(TFAIL | TTERRNO, "execve() failed unexpectedly");

-	tst_res(TPASS | TERRNO, "execve() failed expectedly");
+	tst_res(TPASS | TTERRNO, "execve() failed expectedly");

 	exit(0);
 }
diff --git a/testcases/kernel/syscalls/ioctl/ioctl04.c b/testcases/kernel/syscalls/ioctl/ioctl04.c
index 353114cc0..d9ddb8e59 100644
--- a/testcases/kernel/syscalls/ioctl/ioctl04.c
+++ b/testcases/kernel/syscalls/ioctl/ioctl04.c
@@ -47,11 +47,11 @@ static void verify_ioctl(void)
 	}

 	if (TST_ERR == EACCES) {
-		tst_res(TPASS | TERRNO, "Mounting RO device RW failed");
+		tst_res(TPASS | TTERRNO, "Mounting RO device RW failed");
 		goto next;
 	}

-	tst_res(TFAIL | TERRNO,
+	tst_res(TFAIL | TTERRNO,
 		"Mounting RO device RW failed unexpectedly expected EACCES");

 next:
diff --git a/testcases/kernel/syscalls/ioperm/ioperm01.c b/testcases/kernel/syscalls/ioperm/ioperm01.c
index fc5754be9..6c50a0b75 100644
--- a/testcases/kernel/syscalls/ioperm/ioperm01.c
+++ b/testcases/kernel/syscalls/ioperm/ioperm01.c
@@ -64,7 +64,7 @@ static void cleanup(void)
 	 * Reset I/O privileges for the specified port.
 	 */
 	if ((ioperm(io_addr, NUM_BYTES, 0)) == -1)
-		tst_brk(TBROK | TTERRNO, "ioperm() cleanup failed");
+		tst_brk(TBROK | TERRNO, "ioperm() cleanup failed");
 }

 static struct tst_test test = {
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
