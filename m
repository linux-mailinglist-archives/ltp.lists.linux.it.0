Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7789836D0AB
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 04:51:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD5F13C6643
	for <lists+linux-ltp@lfdr.de>; Wed, 28 Apr 2021 04:51:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 010293C1813
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 04:50:57 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.20])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9487C6002C8
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 04:50:51 +0200 (CEST)
Received: from localhost (unknown [192.168.167.139])
 by vipregular1.263.net (Postfix) with ESMTP id EEBF4458
 for <ltp@lists.linux.it>; Wed, 28 Apr 2021 10:50:46 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P12770T140230526973696S1619578240725031_; 
 Wed, 28 Apr 2021 10:50:47 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <9c2e6616594b565aa6ea275696b401cb>
X-RL-SENDER: zhanglianjie@uniontech.com
X-SENDER: zhanglianjie@uniontech.com
X-LOGIN-NAME: zhanglianjie@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 2
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: zhanglianjie <zhanglianjie@uniontech.com>
To: ltp@lists.linux.it
Date: Wed, 28 Apr 2021 10:50:39 +0800
Message-Id: <20210428025039.14351-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH] Set exfat file system to skip symlink
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

If the kernel configuration CONF_EXFAT_FS=m, then the exfat test
result is TCONF. If the kernel is not configured with CONF_EXFAT_FS=m,
then the exfat test result will be TBROK (TBROK makes subsequent tests
impossible). Because the exfat file system does not support symlink,
the test should skip calling symlink.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
---
 testcases/kernel/syscalls/chdir/chdir01.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/testcases/kernel/syscalls/chdir/chdir01.c b/testcases/kernel/syscalls/chdir/chdir01.c
index 23cd455d6..aa25adf6a 100644
--- a/testcases/kernel/syscalls/chdir/chdir01.c
+++ b/testcases/kernel/syscalls/chdir/chdir01.c
@@ -69,7 +69,7 @@ static void setup(void)

 	if (!TST_RET)
 		SAFE_SYMLINK(LINK_NAME2, LINK_NAME1);
-	else if (TST_RET == -1 && TST_ERR == EPERM)
+	else if (TST_RET == -1 && (TST_ERR == EPERM || TST_ERR == ENOSYS))
 		skip_symlinks = 1;
 	else
 		tst_brk(TBROK | TTERRNO, "Cannot create symlinks");
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
