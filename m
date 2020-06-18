Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2258F1FF304
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 15:28:20 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E70EC3C2C8E
	for <lists+linux-ltp@lfdr.de>; Thu, 18 Jun 2020 15:28:19 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id CCD653C2C7C
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 15:28:18 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 79C88100044C
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 15:28:18 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 28CEBAFF2
 for <ltp@lists.linux.it>; Thu, 18 Jun 2020 13:28:17 +0000 (UTC)
From: Martin Doucha <mdoucha@suse.cz>
To: ltp@lists.linux.it
Date: Thu, 18 Jun 2020 15:28:16 +0200
Message-Id: <20200618132816.22086-1-mdoucha@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] pty03: Add CVE reference and add it to the CVE runfile
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

Signed-off-by: Martin Doucha <mdoucha@suse.cz>
---
 runtest/cve                  | 1 +
 testcases/kernel/pty/pty03.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/runtest/cve b/runtest/cve
index bbbe965d4..a3a25dbe1 100644
--- a/runtest/cve
+++ b/runtest/cve
@@ -53,3 +53,4 @@ cve-2018-1000204 ioctl_sg01
 cve-2018-18559 bind06
 cve-2018-19854 crypto_user01
 cve-2020-11494 pty04
+cve-2020-14416 pty03
diff --git a/testcases/kernel/pty/pty03.c b/testcases/kernel/pty/pty03.c
index 8e05ad3be..e71739a71 100644
--- a/testcases/kernel/pty/pty03.c
+++ b/testcases/kernel/pty/pty03.c
@@ -2,6 +2,8 @@
 /*
  * Copyright (c) 2020 SUSE
  *
+ * CVE-2020-14416
+ *
  * Test based on Syzkaller reproducer:
  * https://syzkaller.appspot.com/bug?id=680c24ff647dd7241998e19da52e8136d2fd3523
  *
@@ -148,6 +150,7 @@ static struct tst_test test = {
 	.needs_root = 1,
 	.tags = (const struct tst_tag[]) {
 		{"linux-git", "0ace17d568241"},
+		{"CVE", "2020-14416"},
 		{}
 	}
 };
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
