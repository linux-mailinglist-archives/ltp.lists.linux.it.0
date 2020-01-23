Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D158A14613C
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 06:01:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0CD83C2026
	for <lists+linux-ltp@lfdr.de>; Thu, 23 Jan 2020 06:01:33 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 522A13C180D
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 06:01:31 +0100 (CET)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id CEC20140138D
 for <ltp@lists.linux.it>; Thu, 23 Jan 2020 06:01:30 +0100 (CET)
Received: by mail-pg1-x541.google.com with SMTP id a33so744126pgm.5
 for <ltp@lists.linux.it>; Wed, 22 Jan 2020 21:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDuQkLHdPwpe4LmYxE0XVyg6/wTj9LVOuAr+hdqC9Pk=;
 b=tijI/Pk5twLtJ34Rc2UxzUFZDUJMn6We02VlCLCOL+63PmfNYh4l+ZR4BweRgLqJwA
 NMy2rsW2zJvqu0FGOywjozuwug2bsXtsv9PsAeLGBL+/tElBGZ5Upc/TO/9pAk+EisgM
 5/5+2HzrJpz9i1d8XRP/W7Ph8cSKBWKo3dOWr61HyGjzt3sLjMWwni6vfJ8YdqI50c5d
 b+lkKJeIMzTecGprFc6t4RKhO8by9IdJz2BhocLZfFyiHpfywvgYO0RRMoWAc0Q6e4Y8
 RBlf2UUj1JQZWY1czAifTQEaw8mTLYrcRQj2XtomBOgQbN086RxTUN45HnHLxjwTsjYt
 D/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PDuQkLHdPwpe4LmYxE0XVyg6/wTj9LVOuAr+hdqC9Pk=;
 b=o4nVhGDdQ8M3n6ndO615DUx0kLqzvYkAe1292KaVLptwH3JVJGzleBDXBYh06T1F42
 GtdoW28GEF5LkKJfIggLXQk5IOBw2ene52zTsYaow4P9kKoqlztBqOBXMOoTpVq9a0AB
 SbXQ+e9SXtgAWYP/PyvzglRk5nn8sIKWT+J+I1ZfvvNbhkEGMfiCv7kb0vOUXrZ+E2Fx
 x9UDStvIlqqRlX8QyIpFCgBZi7HHTFz5ls/aXXGfHvxqGwx39L/pdq3sjlm8uobI12cF
 CYyrCW751rgTDeOOdoXHBDWR/hFgolbnyKo60bKsiK8OyX5FPR3EO3homlR0wrZz3fwY
 xriQ==
X-Gm-Message-State: APjAAAVVJKERfVQx7mQmVdo4G9vksjCCX7oxF/Oc1GlH8YiVIgmxWAEj
 T+R9MOWPZP+tMIH1rc2n279YqSjVn20=
X-Google-Smtp-Source: APXvYqzeygt9tJBHGpJAsrXVHtt514vhADZg05UjKZX7TcwfxMT7vXuI8vqltUlDw6FZ/njAb8E6og==
X-Received: by 2002:a63:2a49:: with SMTP id q70mr1955149pgq.265.1579755688792; 
 Wed, 22 Jan 2020 21:01:28 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id j9sm616883pfn.152.2020.01.22.21.01.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Jan 2020 21:01:27 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Thu, 23 Jan 2020 10:31:23 +0530
Message-Id: <f9e9bc067d1153199440512d6ece01f7a001b660.1579755655.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add Syscall numbers for io_pgetevents
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
 Vincent Guittot <vincent.guittot@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/syscalls/aarch64.in   | 1 +
 include/lapi/syscalls/arm.in       | 1 +
 include/lapi/syscalls/hppa.in      | 1 +
 include/lapi/syscalls/i386.in      | 1 +
 include/lapi/syscalls/ia64.in      | 1 +
 include/lapi/syscalls/powerpc.in   | 1 +
 include/lapi/syscalls/powerpc64.in | 1 +
 include/lapi/syscalls/s390.in      | 1 +
 include/lapi/syscalls/s390x.in     | 1 +
 include/lapi/syscalls/sparc.in     | 1 +
 include/lapi/syscalls/sparc64.in   | 1 +
 include/lapi/syscalls/x86_64.in    | 1 +
 12 files changed, 12 insertions(+)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 19f3aa4475bd..25e1b27e9867 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -269,6 +269,7 @@ pwritev2 287
 pkey_mprotect 288
 pkey_alloc 289
 pkey_free 290
+io_pgetevents 292
 pidfd_send_signal 424
 pidfd_open 434
 _sysctl 1078
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index 29538ba50d3b..49be125a755c 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -353,5 +353,6 @@ pkey_mprotect (__NR_SYSCALL_BASE+394)
 pkey_alloc (__NR_SYSCALL_BASE+395)
 pkey_free (__NR_SYSCALL_BASE+396)
 statx (__NR_SYSCALL_BASE+397)
+io_pgetevents (__NR_SYSCALL_BASE+399)
 pidfd_send_signal (__NR_SYSCALL_BASE+424)
 pidfd_open (__NR_SYSCALL_BASE+434)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index b578d886516d..b11c8fbcf71f 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -25,5 +25,6 @@ mlock2 345
 copy_file_range 346
 preadv2 347
 pwritev2 348
+io_pgetevents 350
 pidfd_send_signal 424
 pidfd_open 434
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index 696563ebba48..40b84ca89f9b 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -352,5 +352,6 @@ pkey_mprotect 380
 pkey_alloc 381
 pkey_free 382
 statx 383
+io_pgetevents 385
 pidfd_send_signal 424
 pidfd_open 434
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 11b236c7c507..675adda18703 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -305,6 +305,7 @@ mlock2 1346
 copy_file_range 1347
 preadv2 1348
 pwritev2 1349
+io_pgetevents 1351
 pkey_mprotect 1354
 pkey_alloc 1355
 pkey_free 1356
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index 293d86ba54c4..88c42924b306 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -355,6 +355,7 @@ copy_file_range 379
 preadv2 380
 pwritev2 381
 statx 383
+io_pgetevents 388
 pidfd_send_signal 424
 pidfd_open 434
 pkey_mprotect 386
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 293d86ba54c4..88c42924b306 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -355,6 +355,7 @@ copy_file_range 379
 preadv2 380
 pwritev2 381
 statx 383
+io_pgetevents 388
 pidfd_send_signal 424
 pidfd_open 434
 pkey_mprotect 386
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index 4f4b2dbed5ef..dbeaea70f59c 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -339,6 +339,7 @@ mlock2 374
 copy_file_range 375
 preadv2 376
 pwritev2 377
+io_pgetevents 382
 pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 673538a7217e..6bacacba1468 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -337,6 +337,7 @@ mlock2 374
 copy_file_range 375
 preadv2 376
 pwritev2 377
+io_pgetevents 382
 pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 2b33c4983088..b5f269222f8b 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -344,6 +344,7 @@ mlock2 356
 copy_file_range 357
 preadv2 358
 pwritev2 359
+io_pgetevents 361
 pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index a6157adef7b3..ea191d4745e1 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -319,6 +319,7 @@ mlock2 356
 copy_file_range 357
 preadv2 358
 pwritev2 359
+io_pgetevents 361
 pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index 8bd6b66d3bef..d9370b9032d1 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -319,5 +319,6 @@ pkey_mprotect 329
 pkey_alloc 330
 pkey_free 331
 statx 332
+io_pgetevents 333
 pidfd_send_signal 424
 pidfd_open 434
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
