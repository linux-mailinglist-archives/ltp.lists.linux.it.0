Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C49142C33
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 14:37:10 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E42753C2350
	for <lists+linux-ltp@lfdr.de>; Mon, 20 Jan 2020 14:37:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3AFE33C0EAF
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 14:37:00 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 1A9DC6011B7
 for <ltp@lists.linux.it>; Mon, 20 Jan 2020 14:36:56 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD23AADDA;
 Mon, 20 Jan 2020 13:36:55 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 20 Jan 2020 14:36:46 +0100
Message-Id: <20200120133646.8629-2-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120133646.8629-1-pvorel@suse.cz>
References: <20200120133646.8629-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] tst_device: Move tst_dev_sync() into from header
 to source file
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

While socketcall01.c was already fixed by previous commit and we expect
nothing else was broken by 9e83513eb, it's still better not include
lapi/syscalls.h to everything which uses new C API.

Fixes: 9e83513eb "tst_device.h: Use lapi/syscalls.h instead of <sys/syscall.h>"

Suggested-by: Martin Doucha <mdoucha@suse.cz>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Feel free to reject this one.

Kind regards,
Petr

 include/tst_device.h | 6 +-----
 lib/tst_device.c     | 6 ++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index 13d92ee54..64ea77768 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -19,7 +19,6 @@
 #define TST_DEVICE_H__
 
 #include <unistd.h>
-#include "lapi/syscalls.h"
 
 struct tst_device {
 	const char *dev;
@@ -76,10 +75,7 @@ int tst_detach_device(const char *dev_path);
  * simply before the tst_dev_bytes_written invocation. For easy to use,
  * we create this inline function tst_dev_sync.
  */
-static inline int tst_dev_sync(int fd)
-{
-	return syscall(__NR_syncfs, fd);
-}
+static int tst_dev_sync(int fd);
 
 /*
  * Reads test block device stat file and returns the bytes written since the
diff --git a/lib/tst_device.c b/lib/tst_device.c
index e78549c94..ade6fdd52 100644
--- a/lib/tst_device.c
+++ b/lib/tst_device.c
@@ -31,6 +31,7 @@
 #include <linux/loop.h>
 #include <stdint.h>
 #include <inttypes.h>
+#include "lapi/syscalls.h"
 #include "test.h"
 #include "safe_macros.h"
 
@@ -222,6 +223,11 @@ int tst_detach_device(const char *dev)
 	return 1;
 }
 
+static int tst_dev_sync(int fd)
+{
+	return syscall(__NR_syncfs, fd);
+}
+
 const char *tst_acquire_device__(unsigned int size)
 {
 	int fd;
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
