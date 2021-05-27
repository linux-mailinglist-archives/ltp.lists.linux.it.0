Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D05813926D2
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 07:23:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3F64B3C4ED5
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 07:23:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CB6533C2A93
 for <ltp@lists.linux.it>; Thu, 27 May 2021 07:23:22 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0E30D100035F
 for <ltp@lists.linux.it>; Thu, 27 May 2021 07:23:17 +0200 (CEST)
Received: from localhost (unknown [192.168.167.235])
 by vipregular1.263.net (Postfix) with ESMTP id DFE3F837
 for <ltp@lists.linux.it>; Thu, 27 May 2021 13:23:06 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P31748T140095126476544S1622092979765600_; 
 Thu, 27 May 2021 13:23:07 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <da0e280a8e0cba052331ed7288dac887>
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
Date: Thu, 27 May 2021 13:22:57 +0800
Message-Id: <20210527052257.366-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] read02: Fix the failure of mips architecture test
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

under mips architecture, writing to the buf of mmap PROT_NONE will
report an error EPERM.

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>

diff --git a/testcases/kernel/syscalls/read/read02.c b/testcases/kernel/syscalls/read/read02.c
index 9199a95f6..ab1c15970 100644
--- a/testcases/kernel/syscalls/read/read02.c
+++ b/testcases/kernel/syscalls/read/read02.c
@@ -52,7 +52,9 @@ static struct tcase {
 } tcases[] = {
 	{&badfd, &bufaddr, 1, EBADF},
 	{&fd2, &bufaddr, 1, EISDIR},
-#ifndef UCLINUX
+#if defined( __mips)
+	{&fd3, &outside_buf, 1, EPERM},
+#elif !defined(UCLINUX)
 	{&fd3, &outside_buf, 1, EFAULT},
 #endif
 	{&fd4, &addr4, 1, EINVAL},
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
