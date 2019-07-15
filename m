Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AA16982E
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 17:16:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 62E923C1D05
	for <lists+linux-ltp@lfdr.de>; Mon, 15 Jul 2019 17:16:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 0139D3C1CE4
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 17:16:43 +0200 (CEST)
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by in-2.smtp.seeweb.it (Postfix) with ESMTP id 2F0646018B2
 for <ltp@lists.linux.it>; Mon, 15 Jul 2019 17:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=91J+NoRwZCbFKNx/V2
 /zcsU6HdC8PH29pQ2wU34ioBo=; b=bNsuyeDYOOIOV/JWx4HKufP1I+HjyQFU6m
 eZn/EQH0tMReeM4Yqd76cqj5b8RNQ8Amk2x5Z4ufzMHg9KcX4lqheRP7TuZRgMPg
 wrO9wsFqYBEPC9l02xS53hCNQUoFc6AGtvdajsksWju4Ht9BPHg+tKbZ9kzcdDuU
 VPRvVe+CM=
Received: from RHEL7U5GA_Intel64.localdomain (unknown [183.210.51.51])
 by smtp8 (Coremail) with SMTP id DMCowAAHxAjWmCxdjX0oCg--.40800S2;
 Mon, 15 Jul 2019 23:16:39 +0800 (CST)
From: Xiao Yang <ice_yangxiao@163.com>
To: ltp@lists.linux.it
Date: Mon, 15 Jul 2019 23:16:36 +0800
Message-Id: <1563203796-22102-1-git-send-email-ice_yangxiao@163.com>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: DMCowAAHxAjWmCxdjX0oCg--.40800S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruFWkAr4rKrWUGw4DZr4xJFb_yoWkurb_C3
 W7Ka48KFWUA3y7tr15Aw4kXry0y3y7Jrs5Kr1DKFWfGrW7W3s8Kas8ZF13Jrn5WF4v9r9x
 Zrs3WFs5Kry3AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKHUDJUUUUU==
X-Originating-IP: [183.210.51.51]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/1tbiTAPyXlSIglZDVQAAs9
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH] syscalls/acct02.c: Read threshold from
 /proc/sys/kernel/acct
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Don't use hardcoded threshold(default 4%) to check free space
because it can be changed by writing "/proc/sys/kernel/acct"
or using sysctl.

Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
---
 testcases/kernel/syscalls/acct/acct02.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/testcases/kernel/syscalls/acct/acct02.c b/testcases/kernel/syscalls/acct/acct02.c
index c2c2066..9e2f934 100644
--- a/testcases/kernel/syscalls/acct/acct02.c
+++ b/testcases/kernel/syscalls/acct/acct02.c
@@ -150,18 +150,21 @@ static void run(void)
 static void setup(void)
 {
 	struct statfs buf;
+	float limit;
 
 	clock_ticks = SAFE_SYSCONF(_SC_CLK_TCK);
 
 	SAFE_STATFS(".", &buf);
 
 	float avail = (100.00 * buf.f_bavail) / buf.f_blocks;
+	SAFE_FILE_SCANF("/proc/sys/kernel/acct", "%f %*i %*i", &limit);
+	limit += 0.1;
 
 	/* The accounting data are silently discarded on nearly FS */
-	if (avail < 4.1) {
+	if (avail < limit) {
 		tst_brk(TCONF,
-			"Less than 4.1%% (%.2f) of free space on filesystem",
-			avail);
+			"Less than (%.2f)%% (%.2f) of free space on filesystem",
+			limit, avail);
 	}
 
 	TEST(acct(NULL));
-- 
1.8.3.1



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
