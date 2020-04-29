Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C68B1BDB61
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 14:06:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ED2563C5EC8
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 14:06:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 1BA783C27F2
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 14:06:13 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 65B722013D4
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 14:06:13 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EC289ACCC;
 Wed, 29 Apr 2020 12:06:11 +0000 (UTC)
Date: Wed, 29 Apr 2020 14:06:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <20200429120611.GA10236@dell5510>
References: <20200428113501.24711-1-pvorel@suse.cz>
 <20200428113501.24711-2-pvorel@suse.cz>
 <CAOQ4uxjTh5r3JWVzt6Gazh61Cb1Fr7Y90k1mXn=q2WbsSRs2NQ@mail.gmail.com>
 <20200428133748.GA5349@dell5510>
 <CAOQ4uxjJ7qFZVf4YNNK=JYDSc=_+fRoU6v+OAwQ3Vp7soNSAbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxjJ7qFZVf4YNNK=JYDSc=_+fRoU6v+OAwQ3Vp7soNSAbQ@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] fanotify: Test with tst_variant both raw
 syscall and libc
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Amir,

> My confusion is because you removed the HAVE_SYS_FANOTIFY_H ifdef
> and now you include sys/fanotify.h unconditionally.
> So I meant if this code builds with all supported system configurations.
Thanks! I overlook an obvious error. Patch is wrong, because fanotify.h must be
included in tests below #if defined(HAVE_SYS_FANOTIFY_H).
Below is fix to posted patch, tested without <sys/fanotify.h>.

Kind regards,
Petr

diff --git testcases/kernel/syscalls/fanotify/fanotify01.c testcases/kernel/syscalls/fanotify/fanotify01.c
index 77c18e67f..83bcfccb4 100644
--- testcases/kernel/syscalls/fanotify/fanotify01.c
+++ testcases/kernel/syscalls/fanotify/fanotify01.c
@@ -18,10 +18,10 @@
 #include <string.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 /* size of the event structure, not counting name */
diff --git testcases/kernel/syscalls/fanotify/fanotify02.c testcases/kernel/syscalls/fanotify/fanotify02.c
index 32c842804..eedf00105 100644
--- testcases/kernel/syscalls/fanotify/fanotify02.c
+++ testcases/kernel/syscalls/fanotify/fanotify02.c
@@ -18,10 +18,10 @@
 #include <string.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 /* size of the event structure, not counting name */
diff --git testcases/kernel/syscalls/fanotify/fanotify03.c testcases/kernel/syscalls/fanotify/fanotify03.c
index fdb0d0f58..cf7b30800 100644
--- testcases/kernel/syscalls/fanotify/fanotify03.c
+++ testcases/kernel/syscalls/fanotify/fanotify03.c
@@ -22,10 +22,10 @@
 #include <sys/syscall.h>
 #include <stdlib.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 /* size of the event structure, not counting name */
diff --git testcases/kernel/syscalls/fanotify/fanotify04.c testcases/kernel/syscalls/fanotify/fanotify04.c
index 8b738b3ae..725162f5b 100644
--- testcases/kernel/syscalls/fanotify/fanotify04.c
+++ testcases/kernel/syscalls/fanotify/fanotify04.c
@@ -19,10 +19,10 @@
 #include <string.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 /* size of the event structure, not counting name */
diff --git testcases/kernel/syscalls/fanotify/fanotify05.c testcases/kernel/syscalls/fanotify/fanotify05.c
index 24edec19c..97c921886 100644
--- testcases/kernel/syscalls/fanotify/fanotify05.c
+++ testcases/kernel/syscalls/fanotify/fanotify05.c
@@ -22,10 +22,10 @@
 #include <string.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define MOUNT_PATH "fs_mnt"
 
diff --git testcases/kernel/syscalls/fanotify/fanotify06.c testcases/kernel/syscalls/fanotify/fanotify06.c
index 85dbe5b82..5aea43e33 100644
--- testcases/kernel/syscalls/fanotify/fanotify06.c
+++ testcases/kernel/syscalls/fanotify/fanotify06.c
@@ -36,10 +36,10 @@
 #include <sys/mount.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 /* size of the event structure, not counting name */
diff --git testcases/kernel/syscalls/fanotify/fanotify07.c testcases/kernel/syscalls/fanotify/fanotify07.c
index be42d1a0b..81fe8f443 100644
--- testcases/kernel/syscalls/fanotify/fanotify07.c
+++ testcases/kernel/syscalls/fanotify/fanotify07.c
@@ -30,10 +30,10 @@
 #include <sys/syscall.h>
 #include "tst_test.h"
 #include "lapi/syscalls.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define BUF_SIZE 256
 static char fname[BUF_SIZE];
diff --git testcases/kernel/syscalls/fanotify/fanotify08.c testcases/kernel/syscalls/fanotify/fanotify08.c
index b61a5509a..b40f95cc9 100644
--- testcases/kernel/syscalls/fanotify/fanotify08.c
+++ testcases/kernel/syscalls/fanotify/fanotify08.c
@@ -18,10 +18,10 @@
 #include <string.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 static int fd_notify;
 
diff --git testcases/kernel/syscalls/fanotify/fanotify09.c testcases/kernel/syscalls/fanotify/fanotify09.c
index a023cd8f6..4e2c6f3e1 100644
--- testcases/kernel/syscalls/fanotify/fanotify09.c
+++ testcases/kernel/syscalls/fanotify/fanotify09.c
@@ -33,10 +33,10 @@
 #include <sys/syscall.h>
 #include <stdint.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 /* size of the event structure, not counting name */
diff --git testcases/kernel/syscalls/fanotify/fanotify10.c testcases/kernel/syscalls/fanotify/fanotify10.c
index eb7e4efcf..cbef4b943 100644
--- testcases/kernel/syscalls/fanotify/fanotify10.c
+++ testcases/kernel/syscalls/fanotify/fanotify10.c
@@ -30,10 +30,10 @@
 #include <sys/mount.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 /* size of the event structure, not counting name */
diff --git testcases/kernel/syscalls/fanotify/fanotify11.c testcases/kernel/syscalls/fanotify/fanotify11.c
index b8da46eff..de72d10ef 100644
--- testcases/kernel/syscalls/fanotify/fanotify11.c
+++ testcases/kernel/syscalls/fanotify/fanotify11.c
@@ -29,10 +29,10 @@
 #include <linux/limits.h>
 #include "tst_test.h"
 #include "tst_safe_pthread.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define gettid() syscall(SYS_gettid)
 static int tid;
diff --git testcases/kernel/syscalls/fanotify/fanotify12.c testcases/kernel/syscalls/fanotify/fanotify12.c
index 24fb712d4..916444f78 100644
--- testcases/kernel/syscalls/fanotify/fanotify12.c
+++ testcases/kernel/syscalls/fanotify/fanotify12.c
@@ -21,10 +21,10 @@
 #include <sys/types.h>
 #include <sys/wait.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 1024
 #define EVENT_SIZE (sizeof (struct fanotify_event_metadata))
diff --git testcases/kernel/syscalls/fanotify/fanotify13.c testcases/kernel/syscalls/fanotify/fanotify13.c
index 065aac646..0fc82d6df 100644
--- testcases/kernel/syscalls/fanotify/fanotify13.c
+++ testcases/kernel/syscalls/fanotify/fanotify13.c
@@ -25,10 +25,10 @@
 #include <errno.h>
 #include <unistd.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define PATH_LEN 128
 #define BUF_SIZE 256
diff --git testcases/kernel/syscalls/fanotify/fanotify14.c testcases/kernel/syscalls/fanotify/fanotify14.c
index d78c3f3ca..85c6cf401 100644
--- testcases/kernel/syscalls/fanotify/fanotify14.c
+++ testcases/kernel/syscalls/fanotify/fanotify14.c
@@ -12,12 +12,12 @@
  */
 #define _GNU_SOURCE
 #include "tst_test.h"
-#include "fanotify.h"
 
 #include <errno.h>
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define MNTPOINT "mntpoint"
 #define FILE1 MNTPOINT"/file1"
diff --git testcases/kernel/syscalls/fanotify/fanotify15.c testcases/kernel/syscalls/fanotify/fanotify15.c
index 7aebe19c7..39c2c9275 100644
--- testcases/kernel/syscalls/fanotify/fanotify15.c
+++ testcases/kernel/syscalls/fanotify/fanotify15.c
@@ -24,10 +24,10 @@
 #include <sys/types.h>
 
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 10
 
diff --git testcases/kernel/syscalls/fanotify/fanotify16.c testcases/kernel/syscalls/fanotify/fanotify16.c
index 35729aa7b..66dd4057d 100644
--- testcases/kernel/syscalls/fanotify/fanotify16.c
+++ testcases/kernel/syscalls/fanotify/fanotify16.c
@@ -19,11 +19,11 @@
 #include <sys/mount.h>
 #include <sys/syscall.h>
 #include "tst_test.h"
-#include "fanotify.h"
 
 #if defined(HAVE_SYS_FANOTIFY_H)
 #include <sys/fanotify.h>
 #include <sys/inotify.h>
+#include "fanotify.h"
 
 #define EVENT_MAX 10
 

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
