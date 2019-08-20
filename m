Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B9D95E3D
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 14:20:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7D5623C1D09
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 14:20:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id AAAC13C1D2E
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 14:20:30 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 939391A00F38
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 14:20:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KWrM+
 /sivtP4uScKJMrdO5OYk+BF+wuqBuzq8xW4KB0=; b=cR/NBbBM7gnsp2AI7fb5H
 8MTBoYl87rGCvHDclFFEWUy6tbTMZLUqk/NqMT+Df7TRYZ9y4r0itbDBvivyL4OV
 890rnUVzhU7ODzKbcnkdakmrMSRBefRYK1YmvkhNkTiIOy9TXMtAt+mi7AQw2WVu
 90cks1H1+T2i8AW4VvX0eg=
Received: from localhost.localdomain (unknown [183.210.53.88])
 by smtp8 (Coremail) with SMTP id DMCowABHdu6E5VtdDrNWIA--.4630S2;
 Tue, 20 Aug 2019 20:20:22 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Tue, 20 Aug 2019 20:20:16 +0800
Message-Id: <20190820122017.26015-1-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CM-TRANSID: DMCowABHdu6E5VtdDrNWIA--.4630S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw1fCr1kZr1DZFW8Xr1rtFb_yoW5Wr17pr
 13Gr4agr1rAF1xtwnrGFykArWrAw13tF4UArs3Wr4rCrW5Z34UGr4YgFyfJry5ArWjv34Y
 qF1rAFyfJr15Xw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UV6wNUUUUU=
X-Originating-IP: [183.210.53.88]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbBEAcXXlUMOvhaEgAAsN
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] syscalls/ioprio_set01.c: Stop decreasing priority
 continuously in loops
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

Running ioprio_set01 -i 5 gets the following error:
-------------------------------------------------
...
ioprio_set01.c:29: INFO: ioprio_get returned class BEST-EFFORT prio 1
ioprio.h:89: PASS: ioprio_set new class BEST-EFFORT, new prio 2
ioprio.h:89: PASS: ioprio_set new class BEST-EFFORT, new prio 0
ioprio_set01.c:29: INFO: ioprio_get returned class BEST-EFFORT prio 0
ioprio.h:89: PASS: ioprio_set new class BEST-EFFORT, new prio 1
ioprio_set01.c:49: FAIL: ioprio increase out of range (-1)
...
-------------------------------------------------

The I/O scheduling priority of process is decreased by 1 continuously
in loops so that it is out of range(i.e. 0~7) finally.  We fix the
issue by setting priority to original value before running test.

Also fix a typo because second subtest actually decreases priority.

Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 .../kernel/syscalls/ioprio/ioprio_set01.c     | 33 +++++++++++--------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set01.c b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
index 24bf8a9ca..5b89ac81e 100644
--- a/testcases/kernel/syscalls/ioprio/ioprio_set01.c
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
@@ -14,20 +14,12 @@
 #include "lapi/syscalls.h"
 #include "ioprio.h"
 
+static int orig_class;
+static int orig_prio;
+
 static void run(void)
 {
-	int class, prio;
-
-	/* Get the I/O priority for the current process */
-	TEST(sys_ioprio_get(IOPRIO_WHO_PROCESS, 0));
-
-	if (TST_RET == -1)
-		tst_brk(TBROK | TTERRNO, "ioprio_get failed");
-
-	class = IOPRIO_PRIO_CLASS(TST_RET);
-	prio = IOPRIO_PRIO_LEVEL(TST_RET);
-	tst_res(TINFO, "ioprio_get returned class %s prio %d",
-		to_class_str[class], prio);
+	int class = orig_class, prio = orig_prio;
 
 	/* Bump prio to what it was + 1 */
 	class = IOPRIO_CLASS_BE;
@@ -46,7 +38,7 @@ static void run(void)
 
 	/* Bump prio down two notches */
 	if (!prio_in_range(prio - 2)) {
-		tst_res(TFAIL, "ioprio increase out of range (%d)", prio - 2);
+		tst_res(TFAIL, "ioprio decrease out of range (%d)", prio - 2);
 		return;
 	}
 	prio = (prio - 2);
@@ -58,6 +50,21 @@ static void run(void)
 		ioprio_check_setting(class, prio, 1);
 }
 
+static void setup(void)
+{
+	/* Get the I/O priority for the current process */
+	TEST(sys_ioprio_get(IOPRIO_WHO_PROCESS, 0));
+	if (TST_RET == -1)
+		tst_brk(TBROK | TTERRNO, "ioprio_get failed");
+
+	orig_class = IOPRIO_PRIO_CLASS(TST_RET);
+	orig_prio = IOPRIO_PRIO_LEVEL(TST_RET);
+
+	tst_res(TINFO, "ioprio_get returned class %s prio %d",
+		to_class_str[orig_class], orig_prio);
+}
+
 static struct tst_test test = {
+	.setup = setup,
 	.test_all = run,
 };
-- 
2.21.0



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
