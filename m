Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4A367B0B
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 09:26:35 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 010AA3C6A9B
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Apr 2021 09:26:35 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4A13F3C6A93
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 09:26:32 +0200 (CEST)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.133])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 19073100128E
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 09:26:28 +0200 (CEST)
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 8389ECD5E4
 for <ltp@lists.linux.it>; Thu, 22 Apr 2021 15:26:23 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P2750T140648770434816S1619076373929612_; 
 Thu, 22 Apr 2021 15:26:23 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <4cda0a40ac665de16f04816f1784c289>
X-RL-SENDER: sujiaxun@uniontech.com
X-SENDER: sujiaxun@uniontech.com
X-LOGIN-NAME: sujiaxun@uniontech.com
X-FST-TO: ltp@lists.linux.it
X-RCPT-COUNT: 2
X-SENDER-IP: 58.240.82.166
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: sujiaxun <sujiaxun@uniontech.com>
To: ltp@lists.linux.it
Date: Thu, 22 Apr 2021 15:26:09 +0800
Message-Id: <20210422072609.9938-1-sujiaxun@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] Fix the 64-bit macro definition of mips architecture
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
Cc: sujiaxun <sujiaxun@uniontech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

https://github.com/torvalds/linux/blob/master/arch/mips/include/uapi/asm/shmbuf.h
The mips 64-bit macro definition in the kernel is "__mips64",
 and the mips 64-bit macro definition in the ltp is "__arch64__".

Signed-off-by: sujiaxun <sujiaxun@uniontech.com>
---
 include/lapi/msgbuf.h | 2 +-
 include/lapi/sembuf.h | 2 +-
 include/lapi/shmbuf.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/lapi/msgbuf.h b/include/lapi/msgbuf.h
index f3277270d..f010695f1 100644
--- a/include/lapi/msgbuf.h
+++ b/include/lapi/msgbuf.h
@@ -17,7 +17,7 @@
 #if defined(__mips__)
 #define HAVE_MSQID64_DS

-#if defined(__arch64__)
+#if defined(__mips64)
 /*
  * The msqid64_ds structure for the MIPS architecture.
  * Note extra padding because this structure is passed back and forth
diff --git a/include/lapi/sembuf.h b/include/lapi/sembuf.h
index 4ef0483a0..58ad9dff5 100644
--- a/include/lapi/sembuf.h
+++ b/include/lapi/sembuf.h
@@ -24,7 +24,7 @@
  * Pad space is left for 2 miscellaneous 64-bit values on mips64,
  * but used for the upper 32 bit of the time values on mips32.
  */
-#if defined(__arch64__)
+#if defined(__mips64)
 struct semid64_ds {
 	struct ipc64_perm sem_perm;		/* permissions .. see ipc.h */
 	long		 sem_otime;		/* last semop time */
diff --git a/include/lapi/shmbuf.h b/include/lapi/shmbuf.h
index 28ee33620..fe405ffe8 100644
--- a/include/lapi/shmbuf.h
+++ b/include/lapi/shmbuf.h
@@ -27,7 +27,7 @@
  * data structure when moving to 64-bit time_t.
  */

-#if defined(__arch64__)
+#if defined(__mips64)
 struct shmid64_ds {
 	struct ipc64_perm	shm_perm;	/* operation perms */
 	size_t			shm_segsz;	/* size of segment (bytes) */
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
