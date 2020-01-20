Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 71697142895
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 11:55:02 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 05F8D3C244E
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 11:55:02 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 85C673C2259
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 11:54:55 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CEF6114016B7
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 11:54:54 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E5FCCAB98;
 Mon, 20 Jan 2020 10:54:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 20 Jan 2020 11:54:41 +0100
Message-Id: <20200120105441.19418-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_device.h: Use <sys/syscall.h> and fallback to
 sync()
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

This partly reverts commit 9e83513eb, which unconditionally included
lapi/syscalls.h. Put back <sys/syscall.h> and fallback to sync() for
these rare cases where __NR_syncfs.

Hope this is final fix for syncfs() issues.

Fixes: 9e83513eb "tst_device.h: Use lapi/syscalls.h instead of <sys/syscall.h>"
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/tst_device.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index 13d92ee54..1456cb2ff 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -19,7 +19,7 @@
 #define TST_DEVICE_H__
 
 #include <unistd.h>
-#include "lapi/syscalls.h"
+#include <sys/syscall.h>
 
 struct tst_device {
 	const char *dev;
@@ -78,7 +78,12 @@ int tst_detach_device(const char *dev_path);
  */
 static inline int tst_dev_sync(int fd)
 {
+#ifdef __NR_syncfs
 	return syscall(__NR_syncfs, fd);
+#else
+	sync();
+	return 0;
+#endif
 }
 
 /*
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
