Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2769934E5C5
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 12:49:41 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 810573C8BCD
	for <lists+linux-ltp@lfdr.de>; Tue, 30 Mar 2021 12:49:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0548B3C2453
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 12:49:35 +0200 (CEST)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.131])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 31CD120007D
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 12:49:32 +0200 (CEST)
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id E3CFAB9DA5
 for <ltp@lists.linux.it>; Tue, 30 Mar 2021 18:49:27 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P22964T140517081863936S1617101363903001_; 
 Tue, 30 Mar 2021 18:49:28 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <95cba2c67075bc7d9262449325d8fe6d>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Tue, 30 Mar 2021 18:46:13 +0800
Message-Id: <20210330104613.1059-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] Modify the test logic of mincore.
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

Currently mincore has a vulnerability and is easy to be attacked.
CVE has fixed the vulnerability.
Please see https://www.linuxkernelcves.com/cves/CVE-2019-5489

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
---
 testcases/kernel/syscalls/mincore/mincore04.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/testcases/kernel/syscalls/mincore/mincore04.c b/testcases/kernel/syscalls/mincore/mincore04.c
index ed0ab7dfa..345dedd9a 100644
--- a/testcases/kernel/syscalls/mincore/mincore04.c
+++ b/testcases/kernel/syscalls/mincore/mincore04.c
@@ -95,12 +95,12 @@ static void test_mincore(void)
 	locked_pages = count_pages_in_cache();
 	tst_reap_children();

-	if (locked_pages == NUM_PAGES)
-		tst_res(TPASS, "mincore reports all %d pages locked by child process "
-			"are resident", locked_pages);
-	else
-		tst_res(TFAIL, "mincore reports %d pages resident but %d pages "
+	if (locked_pages == 0)
+		tst_res(TPASS, "mincore reports %d pages resident but %d pages "
 			"locked by child process", locked_pages, NUM_PAGES);
+	else
+		tst_res(TFAIL, "mincore reports all %d pages locked by child process "
+			"are resident", locked_pages);
 }

 static struct tst_test test = {
@@ -109,4 +109,9 @@ static struct tst_test test = {
 	.forks_child = 1,
 	.test_all = test_mincore,
 	.needs_checkpoints = 1,
+	.tags = (const struct tst_tag[]) {
+		{"linux-git", "574823bfab82"},
+		{"CVE", "2019-5489"},
+		{}
+	}
 };
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
