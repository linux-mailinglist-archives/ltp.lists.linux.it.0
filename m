Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF731370E2
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:14:59 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A94D93C25BC
	for <lists+linux-ltp@lfdr.de>; Fri, 10 Jan 2020 16:14:58 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 7D84F3C252C
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:14:54 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C39FB1401D85
 for <ltp@lists.linux.it>; Fri, 10 Jan 2020 16:14:53 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 05FEBAD2C;
 Fri, 10 Jan 2020 15:14:53 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 10 Jan 2020 16:14:43 +0100
Message-Id: <20200110151443.212842-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/1] tst_device: use raw syscall in the tst_device.h
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

From: Li Wang <liwang@redhat.com>

To follow up commit 447c223db ("tst_device: include unistd.h").

Reported-by: Petr Vorel <pvorel@suse.cz>
Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Li Wang <liwang@redhat.com>
Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
[pvorel: Removed _XOPEN_SOURCE from affected tests to really fix
the issue and aren't needed]
Reviewed-by: Petr Vorel <pvorel@suse.cz>
Tested-by: Petr Vorel <pvorel@suse.cz>

Fixes: eca0fa3c3 ("tst_device: add new tst_dev_sync")
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi,

tested on
https://travis-ci.org/pevik/ltp/builds/635305638

Please anybody ack and merge, so we can move on with merging other
things before git freeze.

NOTE: Debian failures are caused by bug in libtirpc 1.2.5,
will be fixed by https://patchwork.ozlabs.org/patch/1216506/

Kind regards,
Petr

 include/tst_device.h                                | 5 +++--
 testcases/kernel/syscalls/fadvise/posix_fadvise01.c | 1 -
 testcases/kernel/syscalls/fadvise/posix_fadvise02.c | 1 -
 testcases/kernel/syscalls/fadvise/posix_fadvise03.c | 1 -
 testcases/kernel/syscalls/fadvise/posix_fadvise04.c | 1 -
 testcases/kernel/syscalls/pwrite/pwrite02.c         | 2 --
 6 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index f277afd77..3db5275c9 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -19,6 +19,7 @@
 #define TST_DEVICE_H__
 
 #include <unistd.h>
+#include <sys/syscall.h>
 
 struct tst_device {
 	const char *dev;
@@ -75,9 +76,9 @@ int tst_detach_device(const char *dev_path);
  * simply before the tst_dev_bytes_written invocation. For easy to use,
  * we create this inline function tst_dev_sync.
  */
-static inline void tst_dev_sync(int fd)
+static inline int tst_dev_sync(int fd)
 {
-	syncfs(fd);
+	return syscall(__NR_syncfs, fd);
 }
 
 /*
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
index 2af040840..71e6454d8 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
@@ -20,7 +20,6 @@
  *	None
  */
 
-#define _XOPEN_SOURCE 600
 #include <fcntl.h>
 
 #include <unistd.h>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise02.c b/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
index d533a7953..303f776e4 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
@@ -20,7 +20,6 @@
  *	None
  */
 
-#define _XOPEN_SOURCE 600
 #include <fcntl.h>
 #include <unistd.h>
 #include <signal.h>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise03.c b/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
index 5bada5f3d..98d8d2930 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
@@ -20,7 +20,6 @@
  *	None
  */
 
-#define _XOPEN_SOURCE 600
 #include <fcntl.h>
 #include <unistd.h>
 #include <signal.h>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
index d8d8fb601..f389a219b 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
@@ -20,7 +20,6 @@
  *	None
  */
 
-#define _XOPEN_SOURCE 600
 #include <fcntl.h>
 #include <unistd.h>
 #include <signal.h>
diff --git a/testcases/kernel/syscalls/pwrite/pwrite02.c b/testcases/kernel/syscalls/pwrite/pwrite02.c
index 056d44da2..221904cd7 100644
--- a/testcases/kernel/syscalls/pwrite/pwrite02.c
+++ b/testcases/kernel/syscalls/pwrite/pwrite02.c
@@ -18,8 +18,6 @@
  *      accessible address space, returns EFAULT.
  */
 
-#define _XOPEN_SOURCE 500
-
 #include <errno.h>
 #include <unistd.h>
 #include <string.h>
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
