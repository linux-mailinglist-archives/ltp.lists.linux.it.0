Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B7C147C9D
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:53:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04FB63C2393
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 10:53:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id D890E3C2379
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:53:35 +0100 (CET)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id DDF041402F95
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 10:53:34 +0100 (CET)
Received: by mail-pg1-x541.google.com with SMTP id l24so762472pgk.2
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 01:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PAdm/V1UsHN8PiHAWqs5OkdgW4nwASOxkzBdk3X3mAw=;
 b=ucgVvK4QcwRA/H3TD4iiUysPcPGKpTUU5i9jWU1svR9COW5oMBFznmfUkWDlNgpQxz
 G7LNXvaMqg9dosmHVqXQREc8iMPcIkhfGZKDRRfltg/9tOyj/A9FgE9ZkDYBASv0hdDb
 4Sgvfk5gjzUzCMh0NCKZpQHyf7oR1a6fbz5P7/dcVQGrje1g1kqQ2CaxzbMiNNAcdAHs
 c6n9EgLXPBsv1HsafPlVl+u5G8VavTtfjp9vGIp6J1YVESiX7vvGAg5HraWOEJYt+2NM
 mILWsZNglFj/TItt7Lkm4u6VURYGIoJ/A3CwaUQIieR2JIVTtbWTeiw4jsp2G1TyeC/b
 T/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PAdm/V1UsHN8PiHAWqs5OkdgW4nwASOxkzBdk3X3mAw=;
 b=I0P4xnm7NXllUjRpdV4VmY+c+Y2Pd/a123dSUBPlFb9sGeD9wRrpIMzxGY2eslgbVY
 ACGwjEr7MpNajQIu0wzft8ujet63RpPQlQ8LgqID1+vlW64fpUxpku8SNUVXWuU5acV8
 3nkAvTmzm6ka19WIPRObkZlHFXUVuV6/MV9i5MgEIkd4E0PTzBp7e5tvRILHQHzvDfI/
 obTkcfDTfTRzy7q0J4RuHWwIzhDtJpm50MNHqJ/lcpAdabtL+aocswmAnwM9yoWTNyGT
 wRHpUrAYi0uUIka0SFovU5ZOe1TCnC7QwN6OLPE12h3ni64q/mYzwouaKfgNJR+xCYwg
 UJoA==
X-Gm-Message-State: APjAAAV3HZBfaCmdd4xnlOcO2po7ASMi7G248EW6DkvSnyKkmPT0dDz7
 mXSzKUCZ6nUstVAv4kSIZmdDDLWjYgA=
X-Google-Smtp-Source: APXvYqw/lYTh0siKXY0TdFcbSrT0Uxs7xz+9O0muTbRPILC3aJT0gG378PBsqZLQ/sj/lU2zucXx+Q==
X-Received: by 2002:a63:6b82:: with SMTP id g124mr3110522pgc.418.1579859613331; 
 Fri, 24 Jan 2020 01:53:33 -0800 (PST)
Received: from localhost ([122.167.18.14])
 by smtp.gmail.com with ESMTPSA id d14sm5860552pjz.12.2020.01.24.01.53.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Jan 2020 01:53:32 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Fri, 24 Jan 2020 15:23:28 +0530
Message-Id: <d3a4f3d5740a64a51752bba89f2b8e2c5326b78c.1579859350.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH V2 1/2] Add Syscall numbers for io_pgetevents
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
V1->V2:
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
index 979a0183d4f5..c4e162662c3e 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -354,5 +354,6 @@ pkey_mprotect (__NR_SYSCALL_BASE+394)
 pkey_alloc (__NR_SYSCALL_BASE+395)
 pkey_free (__NR_SYSCALL_BASE+396)
 statx (__NR_SYSCALL_BASE+397)
+io_pgetevents (__NR_SYSCALL_BASE+399)
 pidfd_send_signal (__NR_SYSCALL_BASE+424)
 pidfd_open (__NR_SYSCALL_BASE+434)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index b0807ca6b69f..71486f30d8ca 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -26,5 +26,6 @@ mlock2 345
 copy_file_range 346
 preadv2 347
 pwritev2 348
+io_pgetevents 350
 pidfd_send_signal 424
 pidfd_open 434
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index f19e24bd63c9..ec47ca123a1f 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -353,5 +353,6 @@ pkey_mprotect 380
 pkey_alloc 381
 pkey_free 382
 statx 383
+io_pgetevents 385
 pidfd_send_signal 424
 pidfd_open 434
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index 92cc881d933b..e9ae3f0093bf 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -306,6 +306,7 @@ mlock2 1346
 copy_file_range 1347
 preadv2 1348
 pwritev2 1349
+io_pgetevents 1351
 pkey_mprotect 1354
 pkey_alloc 1355
 pkey_free 1356
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index f83f7d233e61..3d27d2f2d0f6 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -356,6 +356,7 @@ copy_file_range 379
 preadv2 380
 pwritev2 381
 statx 383
+io_pgetevents 388
 pidfd_send_signal 424
 pidfd_open 434
 pkey_mprotect 386
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index f83f7d233e61..3d27d2f2d0f6 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -356,6 +356,7 @@ copy_file_range 379
 preadv2 380
 pwritev2 381
 statx 383
+io_pgetevents 388
 pidfd_send_signal 424
 pidfd_open 434
 pkey_mprotect 386
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index f99aceb71a81..460a17884735 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -340,6 +340,7 @@ mlock2 374
 copy_file_range 375
 preadv2 376
 pwritev2 377
+io_pgetevents 382
 pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 9666095b6bea..00236356df73 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -338,6 +338,7 @@ mlock2 374
 copy_file_range 375
 preadv2 376
 pwritev2 377
+io_pgetevents 382
 pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 6c610ba67308..b56b1ae5c748 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -345,6 +345,7 @@ mlock2 356
 copy_file_range 357
 preadv2 358
 pwritev2 359
+io_pgetevents 361
 pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index d20e87926913..8f04d730a5d5 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -320,6 +320,7 @@ mlock2 356
 copy_file_range 357
 preadv2 358
 pwritev2 359
+io_pgetevents 361
 pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index cba0080dd27a..8656a84d9b93 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -320,5 +320,6 @@ pkey_mprotect 329
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
