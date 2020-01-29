Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F097C14C645
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 06:58:05 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 75B593C23F2
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Jan 2020 06:58:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1094B3C238C
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 06:58:03 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id A720A601710
 for <ltp@lists.linux.it>; Wed, 29 Jan 2020 06:58:02 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id 12so2165433pjb.5
 for <ltp@lists.linux.it>; Tue, 28 Jan 2020 21:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mb+eH5Y5nHW9HMBb3tj4aWgcQtYbv7auXR5HEyS6zQo=;
 b=ZyJ6Ona5POMURyOb8Jr0eYBanlJgpyCHyK6bHmorE9C/oPFwSueo7BhlfLhVulJp8U
 KHHHvOR19CfG/1cFePmT1eCG2amxLFNUhcDziLGDhgmCX82PbQ1XAOcAxV6oYGIDIcO1
 HGzQPAqRxzrCJZKHWpae98yeo7LPg5gfXfZxFMkc6zu2Pf9uBMj4drtvSwCn9l12XJ5i
 2VfEYs1W/UIHAAnT45dfetCoOWfB3YZT19oZl69hgTRHMyHFrD3rZQgvzM1E1XvCaOME
 uDDnVYuRowuXhcnGHFni6TzEKOuI3slvMIcpM/CEiZlbOXF7POjnMCTmQEJZWqYNcCAA
 z+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mb+eH5Y5nHW9HMBb3tj4aWgcQtYbv7auXR5HEyS6zQo=;
 b=WWJ6N37DDlWObzid1gYB/mBInmwBC9d8yaKnhvJREMOj2zcrrOJkCP5SWplsv8M/2a
 1tJZm+ZBBCZ/gVBfCky82dat1n6eIwKp4P9nMiruUyPdt5vZ70wy/66AzOrRSMlT7kau
 qdkh6UXD7Ra61Xs8eBRcpfrCpK50pI+FxTfVhlpdUM4ccQ5ZiVs2mhApLP3k3UdMWXHh
 F9ZcTth7k9KQFOm6/jL5Nd1VAJck1VwTyaqZJSwq9wFvU7Qrr6DZ+SOxD5PP0jcv3H+z
 5KlbTNU7HNsF3m+X3Khhlllke4niojx1Qn+hHXjSl6N06eQbMjA5DedHvf02JuQDTqGv
 nC6A==
X-Gm-Message-State: APjAAAU8oC3b32biH8B7CqDYinWGIL/ydwni4mgrZtYqITfaziCAnrup
 rR1NEwJBmD7e0wnhCg91wfpVpw==
X-Google-Smtp-Source: APXvYqyHloi+dL6CHeFEdrBCubBEGNOwu70OGWeH64ie/RTRRJTcYOpilAKmaZsb9mykk7JxfTRKZg==
X-Received: by 2002:a17:90a:3268:: with SMTP id
 k95mr9356817pjb.48.1580277480731; 
 Tue, 28 Jan 2020 21:58:00 -0800 (PST)
Received: from localhost ([122.172.141.204])
 by smtp.gmail.com with ESMTPSA id j14sm957181pgs.57.2020.01.28.21.57.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jan 2020 21:57:59 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Cyril Hrubis <chrubis@suse.cz>
Date: Wed, 29 Jan 2020 11:27:55 +0530
Message-Id: <6ea999de18b214e694d336582d2c19e507eabade.1580277453.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add syscall numbers for new file-system related
 syscalls
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

This add syscall numbers for open_tree, move_mount, fsopen, fsconfig,
fsmount and fspick syscalls.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/lapi/syscalls/aarch64.in   | 6 ++++++
 include/lapi/syscalls/arm.in       | 6 ++++++
 include/lapi/syscalls/hppa.in      | 6 ++++++
 include/lapi/syscalls/i386.in      | 6 ++++++
 include/lapi/syscalls/ia64.in      | 6 ++++++
 include/lapi/syscalls/powerpc.in   | 6 ++++++
 include/lapi/syscalls/powerpc64.in | 6 ++++++
 include/lapi/syscalls/s390.in      | 6 ++++++
 include/lapi/syscalls/s390x.in     | 6 ++++++
 include/lapi/syscalls/sh.in        | 6 ++++++
 include/lapi/syscalls/sparc.in     | 6 ++++++
 include/lapi/syscalls/sparc64.in   | 6 ++++++
 include/lapi/syscalls/x86_64.in    | 6 ++++++
 13 files changed, 78 insertions(+)

diff --git a/include/lapi/syscalls/aarch64.in b/include/lapi/syscalls/aarch64.in
index 25e1b27e9867..7892b2203b73 100644
--- a/include/lapi/syscalls/aarch64.in
+++ b/include/lapi/syscalls/aarch64.in
@@ -271,5 +271,11 @@ pkey_alloc 289
 pkey_free 290
 io_pgetevents 292
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
 _sysctl 1078
diff --git a/include/lapi/syscalls/arm.in b/include/lapi/syscalls/arm.in
index c4e162662c3e..1ffad674f913 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -356,4 +356,10 @@ pkey_free (__NR_SYSCALL_BASE+396)
 statx (__NR_SYSCALL_BASE+397)
 io_pgetevents (__NR_SYSCALL_BASE+399)
 pidfd_send_signal (__NR_SYSCALL_BASE+424)
+open_tree (__NR_SYSCALL_BASE+428)
+move_mount (__NR_SYSCALL_BASE+429)
+fsopen (__NR_SYSCALL_BASE+430)
+fsconfig (__NR_SYSCALL_BASE+431)
+fsmount (__NR_SYSCALL_BASE+432)
+fspick (__NR_SYSCALL_BASE+433)
 pidfd_open (__NR_SYSCALL_BASE+434)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index 71486f30d8ca..0f3b4533e0c8 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -28,4 +28,10 @@ preadv2 347
 pwritev2 348
 io_pgetevents 350
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index ec47ca123a1f..28b6fc0072d3 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -355,4 +355,10 @@ pkey_free 382
 statx 383
 io_pgetevents 385
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index e9ae3f0093bf..2dea5c6beabc 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -311,4 +311,10 @@ pkey_mprotect 1354
 pkey_alloc 1355
 pkey_free 1356
 pidfd_send_signal 1448
+open_tree 1452
+move_mount 1453
+fsopen 1454
+fsconfig 1455
+fsmount 1456
+fspick 1457
 pidfd_open 1458
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index 3d27d2f2d0f6..8a3a99e847b9 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -362,3 +362,9 @@ pidfd_open 434
 pkey_mprotect 386
 pkey_alloc 384
 pkey_free 385
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 3d27d2f2d0f6..e4089e572696 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -358,6 +358,12 @@ pwritev2 381
 statx 383
 io_pgetevents 388
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
 pkey_mprotect 386
 pkey_alloc 384
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index 460a17884735..397bc7be26f1 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -345,4 +345,10 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 00236356df73..dac0bd1b49b1 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -343,4 +343,10 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 73549b46e6dd..4e0693cdd056 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -371,4 +371,10 @@ copy_file_range 391
 preadv2 392
 pwritev2 393
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index b56b1ae5c748..6b0e4136fcdb 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -350,4 +350,10 @@ pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index 8f04d730a5d5..3a3bf86241a2 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -325,4 +325,10 @@ pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index 8656a84d9b93..414c26b7b459 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -322,4 +322,10 @@ pkey_free 331
 statx 332
 io_pgetevents 333
 pidfd_send_signal 424
+open_tree 428
+move_mount 429
+fsopen 430
+fsconfig 431
+fsmount 432
+fspick 433
 pidfd_open 434
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
