Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314036E57B
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 09:03:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DC0733C6139
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Apr 2021 09:03:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id F0B873C19C3
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 09:03:24 +0200 (CEST)
Received: from vipregular1.263.net (vipregular1.263.net [211.150.80.19])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 295FF1401227
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 09:03:20 +0200 (CEST)
Received: from localhost (unknown [192.168.167.70])
 by vipregular1.263.net (Postfix) with ESMTP id BA2749FD
 for <ltp@lists.linux.it>; Thu, 29 Apr 2021 15:03:17 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.240.82.166])
 by smtp.263.net (postfix) whith ESMTP id
 P26232T140423056025344S1619679792674968_; 
 Thu, 29 Apr 2021 15:03:17 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <912b8771857cbe9679ee9290ae4681f3>
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
Date: Thu, 29 Apr 2021 15:03:12 +0800
Message-Id: <20210429070312.16404-1-zhanglianjie@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] proc01: Close the opened file
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

Signed-off-by: zhanglianjie <zhanglianjie@uniontech.com>
---
 testcases/kernel/fs/proc/proc01.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/testcases/kernel/fs/proc/proc01.c b/testcases/kernel/fs/proc/proc01.c
index 96441d153..0fae6754f 100644
--- a/testcases/kernel/fs/proc/proc01.c
+++ b/testcases/kernel/fs/proc/proc01.c
@@ -368,6 +368,7 @@ static long readproc(const char *obj)
 		if ((statbuf.st_mode & S_IRUSR) == 0 &&
 		    (statbuf.st_mode & S_IWUSR) != 0) {
 			tst_resm(TINFO, "%s: is write-only.", obj);
+			(void)close(fd);
 			return 0;
 		}

@@ -376,6 +377,7 @@ static long readproc(const char *obj)
 			if (!strcmp(obj, error_nonblock[i])) {
 				tst_resm(TINFO, "%s: does not honor "
 					 "O_NONBLOCK", obj);
+				(void)close(fd);
 				return 0;
 			}
 		}
--
2.20.1




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
