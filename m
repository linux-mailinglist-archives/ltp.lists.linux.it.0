Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 301E35B6B0
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 10:19:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D50203C1DC0
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Jul 2019 10:19:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 386C53C1D7C
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 10:19:24 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5569210009E3
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 10:19:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D231981DE0
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 08:19:21 +0000 (UTC)
Received: from dhcp-3-207.nay.redhat.com (dhcp-3-207.nay.redhat.com
 [10.66.3.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D56E5D71C
 for <ltp@lists.linux.it>; Mon,  1 Jul 2019 08:19:20 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Mon,  1 Jul 2019 16:19:16 +0800
Message-Id: <20190701081917.32051-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 01 Jul 2019 08:19:21 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH v5 1/2] pkey: add syscall numbers for pkey
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

Signed-off-by: Li Wang <liwang@redhat.com>
---
 include/lapi/syscalls/aarch64.in   | 3 +++
 include/lapi/syscalls/arm.in       | 3 +++
 include/lapi/syscalls/i386.in      | 3 +++
 include/lapi/syscalls/ia64.in      | 3 +++
 include/lapi/syscalls/powerpc.in   | 3 +++
 include/lapi/syscalls/powerpc64.in | 3 +++
 include/lapi/syscalls/s390.in      | 3 +++
 include/lapi/syscalls/s390x.in     | 3 +++
 include/lapi/syscalls/sparc.in     | 3 +++
 include/lapi/syscalls/sparc64.in   | 3 +++
 include/lapi/syscalls/x86_64.in    | 3 +++
 11 files changed, 33 insertions(+)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index ce6080894..7db6e281c 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -265,5 +265,8 @@ mlock2 284
 copy_file_range 285
 preadv2 286
 pwritev2 287
+pkey_mprotect 288
+pkey_alloc 289
+pkey_free 290
 pidfd_send_signal 424
 _sysctl 1078
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index 33168889f..00e99f2b9 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -349,5 +349,8 @@ mlock2 (__NR_SYSCALL_BASE+390)
 copy_file_range (__NR_SYSCALL_BASE+391)
 preadv2 (__NR_SYSCALL_BASE+392)
 pwritev2 (__NR_SYSCALL_BASE+393)
+pkey_mprotect (__NR_SYSCALL_BASE+394)
+pkey_alloc (__NR_SYSCALL_BASE+395)
+pkey_free (__NR_SYSCALL_BASE+396)
 statx (__NR_SYSCALL_BASE+397)
 pidfd_send_signal (__NR_SYSCALL_BASE+424)
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index 3355b9127..02f3955ba 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -347,5 +347,8 @@ mlock2 376
 copy_file_range 377
 preadv2 378
 pwritev2 379
+pkey_mprotect 380
+pkey_alloc 381
+pkey_free 382
 statx 383
 pidfd_send_signal 424
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 9ac81e91e..cf9f73e85 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -305,4 +305,7 @@ mlock2 1346
 copy_file_range 1347
 preadv2 1348
 pwritev2 1349
+pkey_mprotect 1354
+pkey_alloc 1355
+pkey_free 1356
 pidfd_send_signal 1448
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index 488d6dfa9..660165d7a 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -356,3 +356,6 @@ preadv2 380
 pwritev2 381
 statx 383
 pidfd_send_signal 424
+pkey_mprotect 386
+pkey_alloc 384
+pkey_free 385
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 488d6dfa9..660165d7a 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -356,3 +356,6 @@ preadv2 380
 pwritev2 381
 statx 383
 pidfd_send_signal 424
+pkey_mprotect 386
+pkey_alloc 384
+pkey_free 385
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index 69b49eac0..c304ef4b7 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -338,4 +338,7 @@ mlock2 374
 copy_file_range 375
 preadv2 376
 pwritev2 377
+pkey_mprotect 384
+pkey_alloc 385
+pkey_free 386
 pidfd_send_signal 424
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 685c16f68..7d632d1dc 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -337,4 +337,7 @@ mlock2 374
 copy_file_range 375
 preadv2 376
 pwritev2 377
+pkey_mprotect 384
+pkey_alloc 385
+pkey_free 386
 pidfd_send_signal 424
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index e74b48170..ab7204663 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -343,4 +343,7 @@ mlock2 356
 copy_file_range 357
 preadv2 358
 pwritev2 359
+pkey_mprotect 362
+pkey_alloc 363
+pkey_free 364
 pidfd_send_signal 424
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index 577aa9b35..d17dce5cd 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -319,4 +319,7 @@ mlock2 356
 copy_file_range 357
 preadv2 358
 pwritev2 359
+pkey_mprotect 362
+pkey_alloc 363
+pkey_free 364
 pidfd_send_signal 424
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index 99d387277..fdb414c10 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -314,5 +314,8 @@ mlock2 325
 copy_file_range 326
 preadv2 327
 pwritev2 328
+pkey_mprotect 329
+pkey_alloc 330
+pkey_free 331
 statx 332
 pidfd_send_signal 424
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
