Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FAB71408BB
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:15:33 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BA84D3C2275
	for <lists+linux-ltp@lfdr.de>; Fri, 17 Jan 2020 12:15:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 959633C220B
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:15:31 +0100 (CET)
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 5C5871401A60
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 12:15:30 +0100 (CET)
Received: by mail-pj1-x1043.google.com with SMTP id r67so3027059pjb.0
 for <ltp@lists.linux.it>; Fri, 17 Jan 2020 03:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPkkBppjrkdlqIa4x7ppcTPgLkWitu85pqnCJSWkdqA=;
 b=zCdxaJdhZIr+HEOkKTNp+l53lBQY0SLSif5AA9f9DIYwS0PPR20bWMnamVj7BoIK3e
 NmdSktaUcYLHWJHaWP11Cj0/AV6pHMYOFLb7PY8BimA/DfpGkr8jFf6DrlL6ceWWcYcD
 uQtIKL78ydolMMBu1eY3Lae9aGwiMa6gk4mUQeHGvt1MyHkLapz5lU/Sy1NishnQ8TUG
 0ApjrJvFlqFmg6B7fgfV3yOCs3fSzQrvwehTdbjzT8XaQWlSv2LWXNXVxtk8ZH9qAlG6
 QQ6CxIMlLxH4zQhpL3fLQA5r/4R+7Vm7UsKHYVi9Gb8dxJnxfzjKoadMkj4qgDnialVv
 b6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPkkBppjrkdlqIa4x7ppcTPgLkWitu85pqnCJSWkdqA=;
 b=TKx335xDMIauKXF0bHABzuvXT36A/UMQyuB+y1b3hnLPFc+niZmlMxgXdXGdnEcNQ2
 A94GsbVN+/PdFDCugvaeOHU0gsTE7fD9LvAj1drszfsunEYBWD9+Xe9OuBU59apR7KXH
 rXQDRlY2tLcXs43zAQTwhN8LyIzDQ0XN4nyZpkjsI7uQERZWu3c1Vc70WqnaSSpp6f0S
 ukiW3TBdDRnJA5fSUn1sXlDSYRrd16F+6A4XhqVVYTw6K1/GioJNZWR+MiMeDxgCa4pD
 ErAj0ei0ikDUPVEV+c926xBiXFnoiPnlNzy0DqECBck/NVVBBkhE7kqA4MS0ESyCfliI
 sm1w==
X-Gm-Message-State: APjAAAUMOTBP5JlLv67Le7qoWPRvxDIjs83Ml1Ph/lLC6/lF5YikUcAX
 WYuW2lFffXVQv+9NjT50eK2O5VNLnNE=
X-Google-Smtp-Source: APXvYqzToomSIMGb2eW1iMqzswoNAhs2yMV3y/wESdmduA4n+33jiiBu+m6dzkdbVvdNLaxTacYjRg==
X-Received: by 2002:a17:902:8545:: with SMTP id
 d5mr41946865plo.116.1579259728391; 
 Fri, 17 Jan 2020 03:15:28 -0800 (PST)
Received: from localhost ([122.172.71.156])
 by smtp.gmail.com with ESMTPSA id k21sm28158033pgt.22.2020.01.17.03.15.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 17 Jan 2020 03:15:27 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: ltp@lists.linux.it
Date: Fri, 17 Jan 2020 16:45:09 +0530
Message-Id: <b4f5242fdca1659b2f71e1b3290fd32194e7340a.1579259595.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.21.0.rc0.269.g1a574e7a288b
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH 1/2] Add Syscall numbers for pidfd_open
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
index 00e99f2b99b8..29538ba50d3b 100644
--- a/include/lapi/syscalls/arm.in
+++ b/include/lapi/syscalls/arm.in
@@ -354,3 +354,4 @@ pkey_alloc (__NR_SYSCALL_BASE+395)
 pkey_free (__NR_SYSCALL_BASE+396)
 statx (__NR_SYSCALL_BASE+397)
 pidfd_send_signal (__NR_SYSCALL_BASE+424)
+pidfd_open (__NR_SYSCALL_BASE+434)
diff --git a/include/lapi/syscalls/hppa.in b/include/lapi/syscalls/hppa.in
index 4cdd109fb50e..b578d886516d 100644
--- a/include/lapi/syscalls/hppa.in
+++ b/include/lapi/syscalls/hppa.in
@@ -26,3 +26,4 @@ copy_file_range 346
 preadv2 347
 pwritev2 348
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/i386.in b/include/lapi/syscalls/i386.in
index 87ab4693343e..696563ebba48 100644
--- a/include/lapi/syscalls/i386.in
+++ b/include/lapi/syscalls/i386.in
@@ -353,3 +353,4 @@ pkey_alloc 381
 pkey_free 382
 statx 383
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/ia64.in b/include/lapi/syscalls/ia64.in
index cf9f73e8529b..11b236c7c507 100644
--- a/include/lapi/syscalls/ia64.in
+++ b/include/lapi/syscalls/ia64.in
@@ -309,3 +309,4 @@ pkey_mprotect 1354
 pkey_alloc 1355
 pkey_free 1356
 pidfd_send_signal 1448
+pidfd_open 1458
diff --git a/include/lapi/syscalls/powerpc.in b/include/lapi/syscalls/powerpc.in
index 660165d7a37b..293d86ba54c4 100644
--- a/include/lapi/syscalls/powerpc.in
+++ b/include/lapi/syscalls/powerpc.in
@@ -356,6 +356,7 @@ preadv2 380
 pwritev2 381
 statx 383
 pidfd_send_signal 424
+pidfd_open 434
 pkey_mprotect 386
 pkey_alloc 384
 pkey_free 385
diff --git a/include/lapi/syscalls/powerpc64.in b/include/lapi/syscalls/powerpc64.in
index 660165d7a37b..293d86ba54c4 100644
--- a/include/lapi/syscalls/powerpc64.in
+++ b/include/lapi/syscalls/powerpc64.in
@@ -356,6 +356,7 @@ preadv2 380
 pwritev2 381
 statx 383
 pidfd_send_signal 424
+pidfd_open 434
 pkey_mprotect 386
 pkey_alloc 384
 pkey_free 385
diff --git a/include/lapi/syscalls/s390.in b/include/lapi/syscalls/s390.in
index d3f7eb1f60f7..4f4b2dbed5ef 100644
--- a/include/lapi/syscalls/s390.in
+++ b/include/lapi/syscalls/s390.in
@@ -343,3 +343,4 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/s390x.in b/include/lapi/syscalls/s390x.in
index 7d632d1dc0bb..673538a7217e 100644
--- a/include/lapi/syscalls/s390x.in
+++ b/include/lapi/syscalls/s390x.in
@@ -341,3 +341,4 @@ pkey_mprotect 384
 pkey_alloc 385
 pkey_free 386
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/sh.in b/include/lapi/syscalls/sh.in
index 132492922659..ef877fa9c25f 100644
--- a/include/lapi/syscalls/sh.in
+++ b/include/lapi/syscalls/sh.in
@@ -370,3 +370,4 @@ copy_file_range 391
 preadv2 392
 pwritev2 393
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/sparc.in b/include/lapi/syscalls/sparc.in
index 94a672428973..2b33c4983088 100644
--- a/include/lapi/syscalls/sparc.in
+++ b/include/lapi/syscalls/sparc.in
@@ -348,3 +348,4 @@ pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/sparc64.in b/include/lapi/syscalls/sparc64.in
index d17dce5cd9a3..a6157adef7b3 100644
--- a/include/lapi/syscalls/sparc64.in
+++ b/include/lapi/syscalls/sparc64.in
@@ -323,3 +323,4 @@ pkey_mprotect 362
 pkey_alloc 363
 pkey_free 364
 pidfd_send_signal 424
+pidfd_open 434
diff --git a/include/lapi/syscalls/x86_64.in b/include/lapi/syscalls/x86_64.in
index b1cbd4f2fb04..8bd6b66d3bef 100644
--- a/include/lapi/syscalls/x86_64.in
+++ b/include/lapi/syscalls/x86_64.in
@@ -320,3 +320,4 @@ pkey_alloc 330
 pkey_free 331
 statx 332
 pidfd_send_signal 424
+pidfd_open 434
-- 
2.21.0.rc0.269.g1a574e7a288b


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
