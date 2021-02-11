Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 098433188EC
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 12:04:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7FA93C6CFA
	for <lists+linux-ltp@lfdr.de>; Thu, 11 Feb 2021 12:04:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9C9FD3C6D0C
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 12:03:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E27DC2002C3
 for <ltp@lists.linux.it>; Thu, 11 Feb 2021 12:03:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1613041412; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ce3WKeyMR61LU7odLpkvAhQwFXOxWCcvn18j7lmUnA8=;
 b=gpkK96AdMKXf9OZDkEgadMJgEXMhCGBecujG4+iQ3VV+XS5TgRy83to2K8sai7H8Qv7CC1
 j3fK59FUQh/B6rA0VcT86Olj50+pEu2bId1yrgC4E6qVO56pHJze3LLuilOvMU8Md+3/io
 6mZhMBHlwdx7FFQf9MhOZ7c1aKwPbBM=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 64007ADCD;
 Thu, 11 Feb 2021 11:03:32 +0000 (UTC)
To: ltp@lists.linux.it
Date: Thu, 11 Feb 2021 11:03:13 +0000
Message-Id: <20210211110317.31942-2-rpalethorpe@suse.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211110317.31942-1-rpalethorpe@suse.com>
References: <20210211110317.31942-1-rpalethorpe@suse.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 1/5] close_range: Add syscall number
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
From: Richard Palethorpe via ltp <ltp@lists.linux.it>
Reply-To: Richard Palethorpe <rpalethorpe@suse.com>
Cc: Richard Palethorpe <rpalethorpe@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Richard Palethorpe <rpalethorpe@suse.com>
---
 include/lapi/syscalls/aarch64.in   | 1 +
 include/lapi/syscalls/arc.in       | 1 +
 include/lapi/syscalls/arm.in       | 1 +
 include/lapi/syscalls/hppa.in      | 1 +
 include/lapi/syscalls/i386.in      | 1 +
 include/lapi/syscalls/ia64.in      | 1 +
 include/lapi/syscalls/mips_n32.in  | 1 +
 include/lapi/syscalls/mips_n64.in  | 1 +
 include/lapi/syscalls/mips_o32.in  | 1 +
 include/lapi/syscalls/powerpc.in   | 1 +
 include/lapi/syscalls/powerpc64.in | 1 +
 include/lapi/syscalls/s390.in      | 1 +
 include/lapi/syscalls/s390x.in     | 1 +
 include/lapi/syscalls/sh.in        | 1 +
 include/lapi/syscalls/sparc.in     | 1 +
 include/lapi/syscalls/sparc64.in   | 1 +
 include/lapi/syscalls/x86_64.in    | 1 +
 17 files changed, 17 insertions(+)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 07556933f..2def6ba3d 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -310,6 +310,7 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
 _sysctl 1078
diff --git a/include/lapi/syscalls/arc.in b/include/lapi/syscalls/arc.in
index 0cadb150c..9bcd84706 100644
--- a/include/lapi/syscalls/arc.in
+++ b/include/lapi/syscalls/arc.in
@@ -310,5 +310,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index 395d53a68..98c840cb8 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -388,5 +388,6 @@ fsmount (__NR_SYSCALL_BASE+432)
 fspick (__NR_SYSCALL_BASE+433)
 pidfd_open (__NR_SYSCALL_BASE+434)
 clone3 (__NR_SYSCALL_BASE+435)
+close_range (__NR_SYSCALL_BASE+436)
 openat2 (__NR_SYSCALL_BASE+437)
 pidfd_getfd (__NR_SYSCALL_BASE+438)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index 7f9b5e0a0..e1628c4b1 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -39,3 +39,4 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+close_range 436
\ No newline at end of file
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index d6773abcb..aaa02c7bf 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -424,5 +424,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 427b711b1..5467f80f2 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -337,5 +337,6 @@ fsconfig 1455
 fsmount 1456
 fspick 1457
 pidfd_open 1458
+close_range 1460
 openat2 1461
 pidfd_getfd 1462
diff --git a/include/lapi/syscalls/mips_n32.in b/include/lapi/syscalls/mips_n32.in
index eb6140ebc..a509ca5c6 100644
--- a/include/lapi/syscalls/mips_n32.in
+++ b/include/lapi/syscalls/mips_n32.in
@@ -362,5 +362,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/mips_n64.in b/include/lapi/syscalls/mips_n64.in
index 5480aa3c9..532c69dd8 100644
--- a/include/lapi/syscalls/mips_n64.in
+++ b/include/lapi/syscalls/mips_n64.in
@@ -338,5 +338,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/mips_o32.in b/include/lapi/syscalls/mips_o32.in
index feee8fbf3..c71a62a35 100644
--- a/include/lapi/syscalls/mips_o32.in
+++ b/include/lapi/syscalls/mips_o32.in
@@ -408,5 +408,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index cdbebc62d..2d287a606 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -417,5 +417,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index cdbebc62d..2d287a606 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -417,5 +417,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index c3f249aed..c978b6660 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -404,5 +404,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 88cc9b86b..d123db6cb 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -352,5 +352,6 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 06055ed10..22da7d6ff 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -398,5 +398,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 522e3c997..7324b4ac6 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -403,5 +403,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index 6f884a7bf..862d806fa 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -368,5 +368,6 @@ fsconfig 431
 fsmount 432
 fspick 433
 pidfd_open 434
+close_range 436
 openat2 437
 pidfd_getfd 438
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index c76328c93..1345002f5 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -345,6 +345,7 @@ fsmount 432
 fspick 433
 pidfd_open 434
 clone3 435
+close_range 436
 openat2 437
 pidfd_getfd 438
 rt_sigaction 512
-- 
2.30.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
