Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E43D395E3C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 14:20:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E20D3C1D1B
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Aug 2019 14:20:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 50A1D3C13D8
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 14:20:26 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id 90CE61A00F37
 for <ltp@lists.linux.it>; Tue, 20 Aug 2019 14:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=NtGlo
 3Rm5Ch68aCeyQzvEGwyOX2KRMPvmWPYq04nf30=; b=one/1FC14WKCSKFVvUPKJ
 uhq6kyIDhqjnWlfBO1EAGRpl4DB7C6ki8TKOoR4V9tUSvw4mYxhYACVUsXUnm0oQ
 Oj2U7tWV4Qb6I8ljnIXh0fHlORJrWf7uaMZb+9KtoJbhNtwlExoW4OfB3redhIeh
 ppqo+r3qgZ+pV6qC5Yq1tc=
Received: from localhost.localdomain (unknown [183.210.53.88])
 by smtp8 (Coremail) with SMTP id DMCowABHdu6E5VtdDrNWIA--.4630S3;
 Tue, 20 Aug 2019 20:20:24 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Tue, 20 Aug 2019 20:20:17 +0800
Message-Id: <20190820122017.26015-2-ice_yangxiao@163.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820122017.26015-1-ice_yangxiao@163.com>
References: <20190820122017.26015-1-ice_yangxiao@163.com>
MIME-Version: 1.0
X-CM-TRANSID: DMCowABHdu6E5VtdDrNWIA--.4630S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFWUZw13Gw13Ww4UJryrZwb_yoW8Kw4rpr
 13Gr43ur10yF1xJwn8JF1kAr18tw45JF4rJrsxJr48Cr18Zr1UJr4YgFyfJry5ArWUA34Y
 qF4rXFyUAF1UXwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UazuZUUUUU=
X-Originating-IP: [183.210.53.88]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiFhIXXlWBjIhKKwAAs8
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] syscalls/ioprio_set01.c: Improve process for
 priority overflow
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

1) If original priority is 0, We should report TCONF for priority overflow
   in second subtest.
   e.g. running ionice -n 0 ./ioprio_set01:
   ----------------------------------------------------------
   ...
   ioprio_set01.c:65: INFO: ioprio_get returned class BEST-EFFORT prio 0
   ioprio.h:89: PASS: ioprio_set new class BEST-EFFORT, new prio 1
   ioprio_set01.c:43: CONF: ioprio decrease out of range (-1)
   ...
   ----------------------------------------------------------

2) If original priority is 7, we should report TCONF for priority overflow
   in first subtest and continue to run second subtest.
   e.g. running ionice -n 7 ./ioprio_set01:
   ----------------------------------------------------------
   ...
   ioprio_set01.c:65: INFO: ioprio_get returned class BEST-EFFORT prio 7
   ioprio_set01.c:28: CONF: ioprio increase out of range (8)
   ioprio.h:89: PASS: ioprio_set new class BEST-EFFORT, new prio 6
   ...
   ---------------------------------------------------------

Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 testcases/kernel/syscalls/ioprio/ioprio_set01.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/testcases/kernel/syscalls/ioprio/ioprio_set01.c b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
index 5b89ac81e..19953ba36 100644
--- a/testcases/kernel/syscalls/ioprio/ioprio_set01.c
+++ b/testcases/kernel/syscalls/ioprio/ioprio_set01.c
@@ -23,11 +23,11 @@ static void run(void)
 
 	/* Bump prio to what it was + 1 */
 	class = IOPRIO_CLASS_BE;
-	if (!prio_in_range(prio + 1)) {
-		tst_res(TFAIL, "ioprio increase out of range (%d)", prio + 1);
-		return;
+	prio = prio + 1;
+	if (!prio_in_range(prio)) {
+		tst_res(TCONF, "ioprio increase out of range (%d)", prio);
+		goto second;
 	}
-	prio = (prio + 1);
 
 	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
 			    IOPRIO_PRIO_VALUE(class, prio)));
@@ -36,12 +36,14 @@ static void run(void)
 	else
 		ioprio_check_setting(class, prio, 1);
 
+second:
 	/* Bump prio down two notches */
-	if (!prio_in_range(prio - 2)) {
-		tst_res(TFAIL, "ioprio decrease out of range (%d)", prio - 2);
+	prio = prio - 2;
+	if (!prio_in_range(prio)) {
+		tst_res(TCONF, "ioprio decrease out of range (%d)", prio);
 		return;
 	}
-	prio = (prio - 2);
+
 	TEST(sys_ioprio_set(IOPRIO_WHO_PROCESS, 0,
 			    IOPRIO_PRIO_VALUE(class, prio)));
 	if (TST_RET == -1)
-- 
2.21.0



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
