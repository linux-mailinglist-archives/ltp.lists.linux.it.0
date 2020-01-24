Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 56167147C08
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:48:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 24A863C2393
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:48:42 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 3D7EC3C2379
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:48:40 +0100 (CET)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 8EFE31000540
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:48:38 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id g6so559379plt.2
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 01:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wa17AkViCZAC//FDkb7N/byTfZC83UHHxgAfLlEjpgI=;
 b=FxNUlDCqWNCxyb3gKjqgpvHyToR0mWOv4vkvvCDROpkjp9JMdSMfcScf5WrzX2RfXW
 /fCQ+b1S/AeVglm3hvn+FMIiFwNEk16nvaLpm8vZkCtqFHb5gUYsc1OFNy4GxD+IHvbz
 /eOKNu91jAS5Y8IzkkvSwvc7/n58KXYQv+O5aESE2d+EsnxdTW14mMv8VEa5DRJz5gGI
 QiYEFD8gY307sbhiVWCnVHtpiFd3+RZSokni+/tiLXMCbVhMJvuxnKt4F6eswCGVbK9H
 Ok5SoUuSIlyKTJBAUn+sXdnlybtU6eLVupIyhuopd8M0C2Y8vVXYlie9nonct7weIaeh
 kqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wa17AkViCZAC//FDkb7N/byTfZC83UHHxgAfLlEjpgI=;
 b=T/ctQxpEvda4qaxRPLgdxtX8N6wi2yyIjpFExgbhkgUxNyYdwq5dMhJdDtb9f98VFj
 mMzAo66V890A49zcUUSootwBVvwz5HITH3zLk848FEFtGRsh2Fc20EcIl9/n5xQlQSPr
 ugz4ub0ba8/Yf4NAXhdtMS5goAQw69Ak6TAD+79As1mDriyAQRZ3Ubm/kjnm0KsX4iGD
 zkzp7vRr6asiuEz3v3Hb7NVsFcakJJtc7qW+lem6yBS/pyQrTlAh3ngmFTVyoNRouCcy
 HnUaT1G26+uz/Z0qKvfGLcwiXVIELiYM/nkmQhaKyOo1S6ltMJNxerWmmyUQXfCEF62k
 cfBQ==
X-Gm-Message-State: APjAAAW0fA/5SgjuskOAzVTPVt2U7qji820KE5Xmxfsh3SKeT7yLZk/C
 l+iApfHkG1usjFcBcYq3NN+maA==
X-Google-Smtp-Source: APXvYqwrC9tCKFr1XzIJZ2jFm3rxOQZkABcN2rb9mb24jCEE07NvCvDQynsF/f1dHiYF5DgTQEv2Ew==
X-Received: by 2002:a17:902:968c:: with SMTP id
 n12mr2787749plp.144.1579859317529; 
 Fri, 24 Jan 2020 01:48:37 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id g11sm5954899pgd.26.2020.01.24.01.48.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 01:48:36 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 24 Jan 2020 15:18:26 +0530
Message-Id: <1dbcadb1781ba1f0584eb92c83aec5f66abb109c.1579858930.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH V3 1/2] Add Syscall numbers for pidfd_open
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V1->V3:
- No changes

 include/lapi/syscalls/aarch64.in   | 1 +
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
 13 files changed, 13 insertions(+)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 0e00641bcf4d..19f3aa4475bd 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -270,4 +270,5 @@ pkey_mprotect 288
 pkey_alloc 289
 pkey_free 290
 pidfd_send_signal 424
+pidfd_open 434
 _sysctl 1078
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index a6a594c2e85d..979a0183d4f5 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -355,3 +355,4 @@ pkey_alloc (__NR_SYSCALL_BASE+395)
 pkey_free (__NR_SYSCALL_BASE+396)
 statx (__NR_SYSCALL_BASE+397)
 pidfd_send_signal (__NR_SYSCALL_BASE+424)
+pidfd_open (__NR_SYSCALL_BASE+434)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index d92f33f40a50..b0807ca6b69f 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -27,3 +27,4 @@ copy_file_range 346
 preadv2 347
 pwritev2 348
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index bad6e409fbdc..f19e24bd63c9 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -354,3 +354,4 @@ pkey_alloc 381
 pkey_free 382
 statx 383
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 0e6ba54a8f76..92cc881d933b 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -310,3 +310,4 @@ pkey_mprotect 1354
 pkey_alloc 1355
 pkey_free 1356
 pidfd_send_signal 1448
+pidfd_open 1458
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index 91467f326ed2..f83f7d233e61 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -357,6 +357,7 @@ preadv2 380
 pwritev2 381
 statx 383
 pidfd_send_signal 424
+pidfd_open 434
 pkey_mprotect 386
 pkey_alloc 384
 pkey_free 385
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 91467f326ed2..f83f7d233e61 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -357,6 +357,7 @@ preadv2 380
 pwritev2 381
 statx 383
 pidfd_send_signal 424
+pidfd_open 434
 pkey_mprotect 386
 pkey_alloc 384
 pkey_free 385
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index dcf0a71482ef..f99aceb71a81 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -344,3 +344,4 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 2dce00f900a2..9666095b6bea 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -342,3 +342,4 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 996ebc956a9a..73549b46e6dd 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -371,3 +371,4 @@ copy_file_range 391
 preadv2 392
 pwritev2 393
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 65902e00aa23..6c610ba67308 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -349,3 +349,4 @@ pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index d303622b46df..d20e87926913 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -324,3 +324,4 @@ pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index 3e9e19ae6af0..cba0080dd27a 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -321,3 +321,4 @@ pkey_alloc 330
 pkey_free 331
 statx 332
 pidfd_send_signal 424
+pidfd_open 434
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
