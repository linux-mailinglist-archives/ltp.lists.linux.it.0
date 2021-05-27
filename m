Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF643926EB
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 07:36:38 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 49FD23C5E63
	for <lists+linux-ltp@lfdr.de>; Thu, 27 May 2021 07:36:38 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id CE00D3C2A93
 for <ltp@lists.linux.it>; Thu, 27 May 2021 07:36:33 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5CA571401237
 for <ltp@lists.linux.it>; Thu, 27 May 2021 07:36:26 +0200 (CEST)
Received: from localhost (unknown [192.168.167.70])
 by vipregular1.263.net (Postfix) with ESMTP id 3539F352
 for <ltp@lists.linux.it>; Thu, 27 May 2021 13:36:21 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P3122T139987723405056S1622093777128042_; 
 Thu, 27 May 2021 13:36:20 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <eec01e3fd76227ee00ef4f96535b8699>
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
Date: Thu, 27 May 2021 13:36:15 +0800
Message-Id: <20210527053615.13254-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH v2] read02: Fix the failure of mips architecture test
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
index 9199a95f6..650449e92 100644
--- a/testcases/kernel/syscalls/read/read02.c
+++ b/testcases/kernel/syscalls/read/read02.c
@@ -52,7 +52,9 @@ static struct tcase {
 } tcases[] = {
 	{&badfd, &bufaddr, 1, EBADF},
 	{&fd2, &bufaddr, 1, EISDIR},
-#ifndef UCLINUX
+#if defined(__mips)
+	{&fd3, &outside_buf, 1, EPERM},
+#elif !defined(UCLINUX)
 	{&fd3, &outside_buf, 1, EFAULT},
 #endif
 	{&fd4, &addr4, 1, EINVAL},
@@ -98,7 +100,7 @@ static void setup(void)

 	fd3 = SAFE_OPEN("test_file", O_RDWR);

-#if !defined(UCLINUX)
+#if !defined(UCLINUX) || defined(__mips)
 	outside_buf = SAFE_MMAP(0, 1, PROT_NONE,
 				MAP_PRIVATE | MAP_ANONYMOUS, 0, 0);
 #endif
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
