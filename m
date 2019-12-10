Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82611919F
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 21:13:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D73BE3C22CF
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Dec 2019 21:13:43 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id DCC723C2275
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:13:32 +0100 (CET)
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 858A2602100
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 21:13:32 +0100 (CET)
Received: by mail-wr1-x442.google.com with SMTP id d16so21527953wre.10
 for <ltp@lists.linux.it>; Tue, 10 Dec 2019 12:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NtHig6IdOrtfDBNa9AzwB3y/pPsCsVuCrdnfcppIH0s=;
 b=e3K4HUHPSw+YIUMDUhqzzMorT3KGQo0sDKUSusYYgmFQwCF9+43+QlDhZOLbvFa87I
 bctkROblR/2eILyR0n0a4G2tzPjAJ10lgn/dlE6Ec1ecTKjIfs3mswt0NOtgnTvTQksg
 GU7z87hErH9EkQ0OUHxLBcMxFyzHMDZ7gbot/Lh3a5GVaJrwYQtv1qsFF7uIWuqxRASk
 qGvMbsDneRUaWPFu3GDivPbp6C1vFBm+QMQgdMnxv5JQOrm8vJx755j1O2Po6FVX4ax1
 yuby8HJoA3G8HfaDVF8JSpiaR+TZW55cROoqbIaaJcPyLMaojXBXCrYhyv84qeaYOyil
 PWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NtHig6IdOrtfDBNa9AzwB3y/pPsCsVuCrdnfcppIH0s=;
 b=uCRL3jp08L6Iq6xXUqpBmOynx8SJ07/wDjOxZ6lBGf0auGgeUldpTumGQrhOeJ2TqB
 1Xk21R8IXZAE7I0FxKGr+alY3uIwr1klx0u7/sxVnVXkVPfW0uX9f9EX0aakUsBjBH6u
 50GqszKbIYQ1OoBpnXVZtU/1eA6TkVdSSTd/YL1VN7KC52vGqwhrNTginfgIK6l0ZfqS
 elHPlDhAtwkIU+MIgk/OR4GLSMgn85fCdFTwaL4ptYZCwHGrZg8LI5SOEa175cnZx5jJ
 z6LyFZuXTGcDTWfWYpVC0WozP7DkczpxxT/2bmygmI0mRNb7hgjULioIjbNhaBbUREA0
 nWqg==
X-Gm-Message-State: APjAAAXBoPoIIyN7Er6Y68ERuYETWN1NydqoJN+YtUOa12Z4b22miIIN
 h/c72teDd97Zqp2dt8CP3VQ6Z/ua
X-Google-Smtp-Source: APXvYqxRWslJabhxt0hM3s2Ne/jj3nbwv1fpAszMs9hSpg0qZ+mbTrZQHYeB7iRnIK6GI0BXpHTX6Q==
X-Received: by 2002:adf:f605:: with SMTP id t5mr5217172wrp.282.1576008811463; 
 Tue, 10 Dec 2019 12:13:31 -0800 (PST)
Received: from x230.suse.de ([62.201.25.198])
 by smtp.gmail.com with ESMTPSA id z18sm4208205wmf.21.2019.12.10.12.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 12:13:30 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 10 Dec 2019 21:13:19 +0100
Message-Id: <20191210201321.1430984-2-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191210201321.1430984-1-petr.vorel@gmail.com>
References: <20191210201321.1430984-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 1/3] travis: Add musl build (with Alpine Linux)
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

it was needed to temporarily remove test broken on musl
to fix compilation.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 .travis.yml      |  7 +++++++
 travis/alpine.sh | 51 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100755 travis/alpine.sh

diff --git a/.travis.yml b/.travis.yml
index 51040b0f0..51efa22e3 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -19,6 +19,13 @@ matrix:
           env: DISTRO=debian:stable VARIANT=cross-compile.aarch64 TREE="out"
           compiler: aarch64-linux-gnu-gcc
 
+        # musl (native)
+        - os: linux
+          # Message: WARNING: xsltproc: cannot process http://docbook.sourceforge.net/release/xsl-ns/current/manpages/docbook.xsl
+          # doc/meson.build:70:1: ERROR: Problem encountered: Docs cannot be built: xsltproc does not work correctly
+          env: DISTRO=alpine:latest
+          compiler: gcc
+
         # build with minimal dependencies
         - os: linux
           env: DISTRO=debian:stable VARIANT=minimal TREE="out"
diff --git a/travis/alpine.sh b/travis/alpine.sh
new file mode 100755
index 000000000..cef627b65
--- /dev/null
+++ b/travis/alpine.sh
@@ -0,0 +1,51 @@
+#!/bin/sh
+# Copyright (c) 2019 Petr Vorel <petr.vorel@gmail.com>
+set -e
+
+apk update
+
+apk add \
+	acl-dev \
+	autoconf \
+	automake \
+	clang \
+	gcc \
+	keyutils-dev \
+	libaio-dev \
+	libacl \
+	libcap-dev \
+	libselinux-dev \
+	libsepol-dev \
+	libtirpc-dev \
+	linux-headers \
+	make \
+	musl-dev \
+	numactl-dev \
+	openssl-dev \
+	pkgconfig
+
+echo "=== /etc/os-release ==="
+cat /etc/os-release
+
+echo "WARNING: remove unsupported tests (until they're fixed)"
+cd ..
+rm -rfv \
+	testcases/kernel/pty/pty01.c \
+	testcases/kernel/pty/pty02.c \
+	testcases/kernel/pty/ptem01.c \
+	testcases/kernel/sched/process_stress/process.c \
+	testcases/kernel/syscalls/accept4/accept4_01.c \
+	testcases/kernel/syscalls/confstr/confstr01.c \
+	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
+	testcases/kernel/syscalls/getcontext/getcontext01.c \
+	testcases/kernel/syscalls/getdents/getdents01.c \
+	testcases/kernel/syscalls/getdents/getdents02.c \
+	testcases/kernel/syscalls/ioctl/ioctl01.c \
+	testcases/kernel/syscalls/ioctl/ioctl02.c \
+	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
+	testcases/kernel/syscalls/sched_getaffinity/sched_getaffinity01.c \
+	testcases/kernel/syscalls/timer_create/timer_create01.c \
+	testcases/kernel/syscalls/timer_create/timer_create03.c \
+	testcases/misc/crash/crash01.c \
+	utils/benchmark/ebizzy-0.3
+cd -
-- 
2.24.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
