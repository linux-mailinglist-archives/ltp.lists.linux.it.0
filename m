Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 995833CB5F3
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:22:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1B9693C72D9
	for <lists+linux-ltp@lfdr.de>; Fri, 16 Jul 2021 12:22:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C75B63C7269
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:19 +0200 (CEST)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 23FA66011E4
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 12:22:14 +0200 (CEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GR6bK6Xnvz1CKT8
 for <ltp@lists.linux.it>; Fri, 16 Jul 2021 18:16:29 +0800 (CST)
Received: from dggpemm500022.china.huawei.com (7.185.36.162) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:10 +0800
Received: from ubuntu1804.huawei.com (10.67.174.209) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 16 Jul 2021 18:22:09 +0800
From: Xie Ziyao <xieziyao@huawei.com>
To: <ltp@lists.linux.it>
Date: Fri, 16 Jul 2021 18:22:53 +0800
Message-ID: <20210716102257.20882-2-xieziyao@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716102257.20882-1-xieziyao@huawei.com>
References: <20210628080424.245911-3-xieziyao@huawei.com>
 <20210716102257.20882-1-xieziyao@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.209]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5 v2] lapi/syscalls: Add syscall number for
 epoll_pwait2
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

Add syscall number for epoll_pwait2.

Suggested-by: Cyril Hrubis <chrubis@suse.cz>
Signed-off-by: Xie Ziyao <xieziyao@huawei.com>
---
 include/lapi/syscalls/aarch64.in   | 1 +
 include/lapi/syscalls/arc.in       | 1 +
 include/lapi/syscalls/arm.in       | 1 +
 include/lapi/syscalls/hppa.in      | 3 ++-
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
 14 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 2def6ba3d..5a2816099 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -313,4 +313,5 @@ clone3 435
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
 _sysctl 1078
diff --git a/include/lapi/syscalls/arc.in b/include/lapi/syscalls/arc.in
index 9bcd84706..9c1654b0b 100644
--- a/include/lapi/syscalls/arc.in
+++ b/include/lapi/syscalls/arc.in
@@ -313,3 +313,4 @@ clone3 435
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index 98c840cb8..ded2f5e03 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -391,3 +391,4 @@ clone3 (__NR_SYSCALL_BASE+435)
 close_range (__NR_SYSCALL_BASE+436)
 openat2 (__NR_SYSCALL_BASE+437)
 pidfd_getfd (__NR_SYSCALL_BASE+438)
+epoll_pwait2 (__NR_SYSCALL_BASE+441)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index e1628c4b1..d8f142b6a 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -39,4 +39,5 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
-close_range 436
\ No newline at end of file
+close_range 436
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index aaa02c7bf..f69268e10 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -427,3 +427,4 @@ clone3 435
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 5467f80f2..3ba2406c4 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -340,3 +340,4 @@ pidfd_open 1458
 close_range 1460
 openat2 1461
 pidfd_getfd 1462
+epoll_pwait2 1465
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index 2d287a606..a4ed2169c 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -420,3 +420,4 @@ clone3 435
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 2d287a606..a4ed2169c 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -420,3 +420,4 @@ clone3 435
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index c978b6660..d99e5fd9e 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -407,3 +407,4 @@ clone3 435
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index d123db6cb..f26cdaaae 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -355,3 +355,4 @@ clone3 435
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 22da7d6ff..20ee61ccc 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -401,3 +401,4 @@ pidfd_open 434
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 7324b4ac6..86decdd82 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -406,3 +406,4 @@ pidfd_open 434
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index 862d806fa..02dfe473a 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -371,3 +371,4 @@ pidfd_open 434
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index 1345002f5..cf6d78bf6 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -348,6 +348,7 @@ clone3 435
 close_range 436
 openat2 437
 pidfd_getfd 438
+epoll_pwait2 441
 rt_sigaction 512
 rt_sigreturn 513
 ioctl 514
--
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
