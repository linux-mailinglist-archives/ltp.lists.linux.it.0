Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 963221BD2FC
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 05:35:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5F1443C2925
	for <lists+linux-ltp@lfdr.de>; Wed, 29 Apr 2020 05:35:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A44D73C2850
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 05:35:17 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 472171000C7E
 for <ltp@lists.linux.it>; Wed, 29 Apr 2020 05:35:16 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id t16so333939plo.7
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 20:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4CAkg04R94JJ5K42UhvakLlLV2jHvT+vGqWbIqGzWA=;
 b=GmjWir5NT9YPwOvPM4XtARjUJhw+V+M0FuPLAs8o5h2G5F77iW2jdUBQlpLV5e09Ay
 zAAtFZnlj/fgJZUHxN2hmvgqNZYwW3pTkII/+cpnJQnCFACeRoU0a/ZQgpgn6OpiAtee
 wZOIP89YPN5AkoQACrb2OjQ5DDecg9cI7pbl9mKFBCAtZzIeM2PfLNYmY99vdJIHPlCD
 nyhcIaL7GsIQ0K6g4tor9QCq9pjB1/Vak1S+3V5FgcdnQ79tkK4Gc/mBFuDopNKdfMq9
 Y2fXf0vvjlQQG/K6bCl6NG1xqjPmVlTyI0bwj2IbUMzT5i+qKbwoUhe3ZIby6FZIMDnQ
 mqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4CAkg04R94JJ5K42UhvakLlLV2jHvT+vGqWbIqGzWA=;
 b=uWK4LIf6CXMT9dG8nfAniGY+vpNs4lQx1xvtXhmULBguzPGfad89TZBSZFibREufba
 DeLCoO1G/IBwM7y+9S0RjsrSseVUCHnrX1nLMfImpI7sWGpc9nAathPTlxBhOUr8sQIo
 pUrDIPn9yXUnetj93L+WUCwGSAy0qaK1q4oosuJAT3DgVy7s0JwSCZOHkC2TiR2hetoA
 Ce7P+w587n1P7wi7U0euyTezoiYWPJRbnEMIQ4JlnJb8bl9Nti3ydcznzo2SitYMqrWc
 fsivKwW0IKlN733F9pP52we+sMB6ayNyufoa5OvVGLFWC5rOBi7AkKfhjuB9RfMjZL8t
 MBhA==
X-Gm-Message-State: AGi0PuYneKPXn5uOFm+oyMYC1m7lwH1ggg6+gp+vgZehmUi0zfWhzVQI
 7/l7YY42kziyUpxLirdo3HS6YHyial8=
X-Google-Smtp-Source: APiQypK3BO/3U+YAM05tnBTozZgxm3lvZ6o1GW4CJC7KghBdrvaFu3RzUwFBLw+ZlrcZ3E4QuFbvAg==
X-Received: by 2002:a17:90a:db46:: with SMTP id u6mr728358pjx.15.1588131313978; 
 Tue, 28 Apr 2020 20:35:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e11c])
 by smtp.gmail.com with ESMTPSA id i10sm16433738pfa.166.2020.04.28.20.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 20:35:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: ltp@lists.linux.it
Date: Tue, 28 Apr 2020 20:35:11 -0700
Message-Id: <20200429033511.1848449-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH] Define __NR_futex to be __NR_futex_time64 on riscv32
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

RISCV glibc has decided to use 64bit time_t from get go unlike
other 32bit architecture therefore aliasing __NR_futex to
__NR_futex_time64 helps avoid the below errors on rv32

tst_checkpoint.c:99:17: error: use of undeclared identifier 'SYS_futex'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 lib/tst_checkpoint.c                        | 4 ++++
 testcases/kernel/syscalls/clone/clone08.c   | 4 ++++
 testcases/kernel/syscalls/futex/futextest.h | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/lib/tst_checkpoint.c b/lib/tst_checkpoint.c
index 5e5b11496c..0388e9db2f 100644
--- a/lib/tst_checkpoint.c
+++ b/lib/tst_checkpoint.c
@@ -21,6 +21,10 @@
  * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
  */
 
+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
+# define __NR_futex __NR_futex_time64
+#endif
+
 #include <stdint.h>
 #include <limits.h>
 #include <errno.h>
diff --git a/testcases/kernel/syscalls/clone/clone08.c b/testcases/kernel/syscalls/clone/clone08.c
index aace308068..85a2bd9246 100644
--- a/testcases/kernel/syscalls/clone/clone08.c
+++ b/testcases/kernel/syscalls/clone/clone08.c
@@ -5,6 +5,10 @@
  * Author: Zeng Linggang <zenglg.jy@cn.fujitsu.com>
  */
 
+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
+# define __NR_futex __NR_futex_time64
+#endif
+
 #define _GNU_SOURCE
 #include <stdlib.h>
 #include <stdio.h>
diff --git a/testcases/kernel/syscalls/futex/futextest.h b/testcases/kernel/syscalls/futex/futextest.h
index 5754d36dae..59d877e30f 100644
--- a/testcases/kernel/syscalls/futex/futextest.h
+++ b/testcases/kernel/syscalls/futex/futextest.h
@@ -34,6 +34,10 @@
 #ifndef _FUTEXTEST_H
 #define _FUTEXTEST_H
 
+#if !defined(__NR_futex) && defined(__riscv) && __riscv_xlen == 32
+# define __NR_futex __NR_futex_time64
+#endif
+
 #include <unistd.h>
 #include <sys/syscall.h>
 #include <sys/types.h>
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
