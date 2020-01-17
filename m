Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00173140919
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:37:38 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6F7013C2245
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:37:38 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 49A9D3C2055
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:37:24 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id A14A910005EC
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:37:23 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4D3ECAEDC;
 Fri, 17 Jan 2020 11:37:23 +0000 (UTC)
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 17 Jan 2020 12:37:15 +0100
Message-Id: <20200117113715.22786-4-pvorel@suse.cz>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117113715.22786-1-pvorel@suse.cz>
References: <20200117113715.22786-1-pvorel@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 3/3] lapi/syscalls: Add syncfs
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

for old distros, which don't define it. Added for all architectures
(including very old ones), as the dependency is in the library itself.

This was needed on SLES 11 (kernel 2.6.32).

Fixes: 74aeb88c9 ("tst_device: use raw syscall in the tst_device.h")

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
 include/lapi/syscalls/arm.in       | 1 +
 include/lapi/syscalls/hppa.in      | 1 +
 include/lapi/syscalls/i386.in      | 1 +
 include/lapi/syscalls/ia64.in      | 1 +
 include/lapi/syscalls/powerpc.in   | 1 +
 include/lapi/syscalls/powerpc64.in | 1 +
 include/lapi/syscalls/s390.in      | 1 +
 include/lapi/syscalls/s390x.in     | 1 +
 include/lapi/syscalls/sh.in        | 1 +
 include/lapi/syscalls/sparc.in     | 1 +
 include/lapi/syscalls/sparc64.in   | 1 +
 include/lapi/syscalls/x86_64.in    | 1 +
 12 files changed, 12 insertions(+)

diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index 00e99f2b9..a6a594c2e 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -334,6 +334,7 @@ accept4 (__NR_SYSCALL_BASE+366)
 fanotify_init (__NR_SYSCALL_BASE+367)
 fanotify_mark (__NR_SYSCALL_BASE+368)
 prlimit64 (__NR_SYSCALL_BASE+369)
+syncfs (__NR_SYSCALL_BASE+373)
 process_vm_readv (__NR_SYSCALL_BASE+376)
 process_vm_writev (__NR_SYSCALL_BASE+377)
 kcmp (__NR_SYSCALL_BASE+378)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index 4cdd109fb..d92f33f40 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -16,6 +16,7 @@ faccessat (__NR_openat + 12)
 splice 291
 tee 293
 vmsplice 294
+syncfs 327
 process_vm_readv 330
 process_vm_writev 331
 memfd_create 340
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index 87ab46933..bad6e409f 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -332,6 +332,7 @@ recvmmsg 337
 fanotify_init 338
 fanotify_mark 339
 prlimit64 340
+syncfs 344
 process_vm_readv 347
 process_vm_writev 348
 kcmp 349
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index cf9f73e85..0e6ba54a8 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -293,6 +293,7 @@ recvmmsg 1322
 fanotify_init 1323
 fanotify_mark 1324
 prlimit64 1325
+syncfs 1329
 process_vm_readv 1332
 process_vm_writev 1333
 renameat2 1338
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index 660165d7a..91467f326 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -339,6 +339,7 @@ recvmsg 342
 recvmmsg 343
 accept4 344
 syscalls 345
+syncfs 348
 process_vm_readv  351
 process_vm_writev 352
 kcmp 354
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 660165d7a..91467f326 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -339,6 +339,7 @@ recvmsg 342
 recvmmsg 343
 accept4 344
 syscalls 345
+syncfs 348
 process_vm_readv  351
 process_vm_writev 352
 kcmp 354
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index d3f7eb1f6..dcf0a7148 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -323,6 +323,7 @@ setgid 214
 setfsuid 215
 setfsgid 216
 newfstatat 293
+syncfs 338
 process_vm_readv 340
 process_vm_writev 341
 kcmp 343
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 7d632d1dc..2dce00f90 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -322,6 +322,7 @@ setgid 214
 setfsuid 215
 setfsgid 216
 newfstatat 293
+syncfs 338
 process_vm_readv 340
 process_vm_writev 341
 kcmp 343
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 132492922..996ebc956 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -360,6 +360,7 @@ accept4 366
 fanotify_init 367
 fanotify_mark 368
 prlimit64 369
+syncfs 373
 process_vm_readv 376
 process_vm_writev 377
 kcmp 378
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 94a672428..65902e00a 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -330,6 +330,7 @@ recvmmsg 328
 fanotify_init 329
 fanotify_mark 330
 prlimit64 331
+syncfs 335
 process_vm_readv 338
 process_vm_writev 339
 kcmp 341
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index d17dce5cd..d303622b4 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -306,6 +306,7 @@ recvmmsg 328
 fanotify_init 329
 fanotify_mark 330
 prlimit64 331
+syncfs 335
 process_vm_readv 338
 process_vm_writev 339
 kcmp 341
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index b1cbd4f2f..3e9e19ae6 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -299,6 +299,7 @@ recvmmsg 299
 fanotify_init 300
 fanotify_mark 301
 prlimit64 302
+syncfs 306
 process_vm_readv 310
 process_vm_writev 311
 kcmp 312
-- 
2.24.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
