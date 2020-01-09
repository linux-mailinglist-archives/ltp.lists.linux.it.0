Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0DC135397
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 08:15:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A20703C24A4
	for <lists+linux-ltp@lfdr.de>; Thu,  9 Jan 2020 08:15:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A38693C242C
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 08:15:23 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id 0FC901000F62
 for <ltp@lists.linux.it>; Thu,  9 Jan 2020 08:15:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578554121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eSUxzxzSlCfxkyenzSSvFWoe3It52MT7pE0h9oa+OYk=;
 b=JVEAecAyZlrlQCFIq4F+KUPiIoZ2vnYNCkngdVSaZY29w7qZvpKp5+X/FftPuBu3sbdOlo
 cykFmaTUSvh/Zl7/zJSCzssYIxzQc4VJK2dLfJhKHa7kdeSLixp6coltwIajpHturIxfgX
 PewnhzatawUb0IDc4/cTFgXZkMUmwLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-rmiCRaAqNn-m3BvgDQSLuQ-1; Thu, 09 Jan 2020 02:15:17 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B34A100550E;
 Thu,  9 Jan 2020 07:15:16 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B47FB272A3;
 Thu,  9 Jan 2020 07:15:13 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Thu,  9 Jan 2020 15:15:10 +0800
Message-Id: <20200109071510.11223-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: rmiCRaAqNn-m3BvgDQSLuQ-1
X-Mimecast-Spam-Score: 0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] tst_device: use raw syscall in the tst_device.h
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

To follow up commit 447c223dba538efc7be23edc.

Signed-off-by: Li Wang <liwang@redhat.com>
Tested-by: Li Wang <liwang@redhat.com>
Cc: Petr Vorel <pvorel@suse.cz>
Cc: Cyril Hrubis <chrubis@suse.cz>
---
 include/tst_device.h                                | 6 ++++--
 testcases/kernel/syscalls/fadvise/posix_fadvise01.c | 1 +
 testcases/kernel/syscalls/fadvise/posix_fadvise02.c | 1 +
 testcases/kernel/syscalls/fadvise/posix_fadvise03.c | 1 +
 testcases/kernel/syscalls/fadvise/posix_fadvise04.c | 1 +
 testcases/kernel/syscalls/fstat/fstat03.c           | 1 +
 testcases/kernel/syscalls/pwrite/pwrite02.c         | 1 +
 7 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/include/tst_device.h b/include/tst_device.h
index f277afd77..b4067be52 100644
--- a/include/tst_device.h
+++ b/include/tst_device.h
@@ -18,7 +18,9 @@
 #ifndef TST_DEVICE_H__
 #define TST_DEVICE_H__
 
+#define _GNU_SOURCE
 #include <unistd.h>
+#include <sys/syscall.h>
 
 struct tst_device {
 	const char *dev;
@@ -75,9 +77,9 @@ int tst_detach_device(const char *dev_path);
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
index 2af040840..f5d7ca8ac 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise01.c
@@ -20,6 +20,7 @@
  *	None
  */
 
+#define _GNU_SOURCE
 #define _XOPEN_SOURCE 600
 #include <fcntl.h>
 
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise02.c b/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
index d533a7953..899f58af8 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise02.c
@@ -20,6 +20,7 @@
  *	None
  */
 
+#define _GNU_SOURCE
 #define _XOPEN_SOURCE 600
 #include <fcntl.h>
 #include <unistd.h>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise03.c b/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
index 5bada5f3d..efd3ab378 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise03.c
@@ -20,6 +20,7 @@
  *	None
  */
 
+#define _GNU_SOURCE
 #define _XOPEN_SOURCE 600
 #include <fcntl.h>
 #include <unistd.h>
diff --git a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
index d8d8fb601..58162c6fb 100644
--- a/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
+++ b/testcases/kernel/syscalls/fadvise/posix_fadvise04.c
@@ -20,6 +20,7 @@
  *	None
  */
 
+#define _GNU_SOURCE
 #define _XOPEN_SOURCE 600
 #include <fcntl.h>
 #include <unistd.h>
diff --git a/testcases/kernel/syscalls/fstat/fstat03.c b/testcases/kernel/syscalls/fstat/fstat03.c
index 68fae43df..51637cdd7 100644
--- a/testcases/kernel/syscalls/fstat/fstat03.c
+++ b/testcases/kernel/syscalls/fstat/fstat03.c
@@ -13,6 +13,7 @@
  *    -> EFAULT (or receive signal SIGSEGV)
  */
 
+#define _GNU_SOURCE
 #include <errno.h>
 #include <stdlib.h>
 #include <unistd.h>
diff --git a/testcases/kernel/syscalls/pwrite/pwrite02.c b/testcases/kernel/syscalls/pwrite/pwrite02.c
index 056d44da2..4582d4e94 100644
--- a/testcases/kernel/syscalls/pwrite/pwrite02.c
+++ b/testcases/kernel/syscalls/pwrite/pwrite02.c
@@ -18,6 +18,7 @@
  *      accessible address space, returns EFAULT.
  */
 
+#define _GNU_SOURCE
 #define _XOPEN_SOURCE 500
 
 #include <errno.h>
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
