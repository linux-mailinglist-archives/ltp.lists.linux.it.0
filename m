Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4714C646
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 06:58:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 955473C2452
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 06:58:15 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id CBA2F3C2437
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 06:58:05 +0100 (CET)
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id B6887600ACF
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 06:58:04 +0100 (CET)
Received: by mail-pj1-x1042.google.com with SMTP id r67so2103396pjb.0
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 21:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LAPdriP+T7SEruAzDIvR4CawYW3JVv22aymOgFOhhyY=;
 b=G9caUdgmD7kvA/XO7g4JcPQXqUsqQ3X4bUcGyt4I/ymsUzn/aAbn5nsvxtToJPupOY
 OtPf0uEyzqm4AsTd2nIYj4jMiEAlGPNvsdEWlG+9AreHY4PVrGJiPIN21+n2YRRGezXr
 dsSLrJBNf7GAEexF73kBSWAE/eyfJ3EFyhgp7xBA0qTdDKH4yT2PLzzXt3xHfEZRZH3n
 vscWbvlx54fDsFS9eUA0W6PkN/BfpKhK/F6XKqWh1mYFYsvIDRYvnM9a9F3mrhWZvM85
 lcYzpXtsvh94JOaiGNSgEluW4Mgai82+20O+HQ1cjw7Ef+gVJjA6PQ0ax6ruV2R3UH19
 Rocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LAPdriP+T7SEruAzDIvR4CawYW3JVv22aymOgFOhhyY=;
 b=r+O6U3Sy92G6sHhP5h+PRl61d/BzOeHufK36hc/rZGztrn1+JdzVsWNjMfNpmpRRhh
 xQv6sTzHFIMYVv0RmLxVIqnqM+qB/RqI9nyVA2gGew1tHcxHkhccc6LXcD2l1PF63jiy
 05OtNmIq9CHElxWGzuAoRAe4AvIegCqilr0MfHZ0CkP36WZBcLEos9zef7V/fK8L7d6g
 FSZBe9Lxg4MZjRYI3duCjXHqmtpy1XxEGQz2Q0ZMQg+0fasIrNo/GF6fppxjarb+5Chg
 Mql9ItExdChTdNpA9hggZUrDw9S1DNs+iw/bj3rvze5wGo5soz//XG27jgDQzb5EKyBq
 F6cA==
X-Gm-Message-State: APjAAAUliAwbdtIOeKJThI7Z24eXbDaylSyF226mqq2ZK3gz2zpkb1uC
 kgRKl+uK9joaP85nSKMZQ/ZubA==
X-Google-Smtp-Source: APXvYqyTqo3XyYTipOqXnf6d7v5c9uqFVd479XYtSaHhZgFRhX8An91cX+ahFvEQk//14aLqE+xtAA==
X-Received: by 2002:a17:90a:db0b:: with SMTP id
 g11mr8924159pjv.140.1580277483313; 
 Tue, 28 Jan 2020 21:58:03 -0800 (PST)
Received: from localhost ([122.172.141.204])
 by smtp.gmail.com with ESMTPSA id d22sm947507pgg.52.2020.01.28.21.58.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jan 2020 21:58:02 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 29 Jan 2020 11:27:56 +0530
Message-Id: <818498fc5fa11618aba150929c35b86325188316.1580277453.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
In-Reply-To: <6ea999de18b214e694d336582d2c19e507eabade.1580277453.git.viresh.kumar@linaro.org>
References: <6ea999de18b214e694d336582d2c19e507eabade.1580277453.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: [LTP] [PATCH 2/2] Add Syscall numbers for io_uring_* syscalls
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

This add syscall numbers for io_uring_setup, io_uring_enter and
io_uring_register syscalls.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/syscalls/aarch64.in   | 3 +++
 include/lapi/syscalls/arm.in       | 3 +++
 include/lapi/syscalls/hppa.in      | 3 +++
 include/lapi/syscalls/i386.in      | 3 +++
 include/lapi/syscalls/ia64.in      | 3 +++
 include/lapi/syscalls/powerpc.in   | 3 +++
 include/lapi/syscalls/powerpc64.in | 3 +++
 include/lapi/syscalls/s390.in      | 3 +++
 include/lapi/syscalls/s390x.in     | 3 +++
 include/lapi/syscalls/sh.in        | 3 +++
 include/lapi/syscalls/sparc.in     | 3 +++
 include/lapi/syscalls/sparc64.in   | 3 +++
 include/lapi/syscalls/x86_64.in    | 3 +++
 13 files changed, 39 insertions(+)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 7892b2203b73..4a3b4981df99 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -271,6 +271,9 @@ pkey_alloc 289
 pkey_free 290
 io_pgetevents 292
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index 1ffad674f913..8720a982a159 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -356,6 +356,9 @@ pkey_free (__NR_SYSCALL_BASE+396)
 statx (__NR_SYSCALL_BASE+397)
 io_pgetevents (__NR_SYSCALL_BASE+399)
 pidfd_send_signal (__NR_SYSCALL_BASE+424)
+io_uring_setup (__NR_SYSCALL_BASE+425)
+io_uring_enter (__NR_SYSCALL_BASE+426)
+io_uring_register (__NR_SYSCALL_BASE+427)
 open_tree (__NR_SYSCALL_BASE+428)
 move_mount (__NR_SYSCALL_BASE+429)
 fsopen (__NR_SYSCALL_BASE+430)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index 0f3b4533e0c8..e00d2dc6d37d 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -28,6 +28,9 @@ preadv2 347
 pwritev2 348
 io_pgetevents 350
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index 28b6fc0072d3..35162a251e86 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -355,6 +355,9 @@ pkey_free 382
 statx 383
 io_pgetevents 385
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 2dea5c6beabc..9e491b54bded 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -311,6 +311,9 @@ pkey_mprotect 1354
 pkey_alloc 1355
 pkey_free 1356
 pidfd_send_signal 1448
+io_uring_setup 1449
+io_uring_enter 1450
+io_uring_register 1451
 open_tree 1452
 move_mount 1453
 fsopen 1454
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index 8a3a99e847b9..af31bf929319 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -362,6 +362,9 @@ pidfd_open 434
 pkey_mprotect 386
 pkey_alloc 384
 pkey_free 385
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index e4089e572696..2c1f105c1a9e 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -358,6 +358,9 @@ pwritev2 381
 statx 383
 io_pgetevents 388
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index 397bc7be26f1..c23db6514fa6 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -345,6 +345,9 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index dac0bd1b49b1..1acd488a20bc 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -343,6 +343,9 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 4e0693cdd056..0b06313ae3fc 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -371,6 +371,9 @@ copy_file_range 391
 preadv2 392
 pwritev2 393
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 6b0e4136fcdb..9a8b8d03860e 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -350,6 +350,9 @@ pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index 3a3bf86241a2..efdaa76a1de1 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -325,6 +325,9 @@ pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index 414c26b7b459..dd12b7ff838d 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -322,6 +322,9 @@ pkey_free 331
 statx 332
 io_pgetevents 333
 pidfd_send_signal 424
+io_uring_setup 425
+io_uring_enter 426
+io_uring_register 427
 open_tree 428
 move_mount 429
 fsopen 430
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
