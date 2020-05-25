Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 412741E0BCB
	for <lists+linux-ltp@lfdr.de>; Mon, 25 May 2020 12:28:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6EF313C3357
	for <lists+linux-ltp@lfdr.de>; Mon, 25 May 2020 12:28:05 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 23F403C02C2
 for <ltp@lists.linux.it>; Mon, 25 May 2020 12:27:59 +0200 (CEST)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C36D2011FF
 for <ltp@lists.linux.it>; Mon, 25 May 2020 12:27:56 +0200 (CEST)
IronPort-SDR: mLHRKC0AiilGQ5gTFEy8IxfefncqzHwiMsqe2xtb2WhjiJ1PWvUQYBjGVP+L73LB/xOu4M75fB
 0kjdkYQ/8JqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2020 03:27:54 -0700
IronPort-SDR: O8u2A8afGIOnV8B1JNd4NTVbo56fgFz0F6HZakiK140Ztm8C77FRSwqWbUio7yqNCSt4BsrqWv
 NbzcJ7krOSdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,433,1583222400"; d="scan'208";a="441687888"
Received: from yixin-dev.sh.intel.com ([10.239.161.27])
 by orsmga005.jf.intel.com with ESMTP; 25 May 2020 03:27:53 -0700
From: Yixin Zhang <yixin.zhang@intel.com>
To: ltp@lists.linux.it,
	Yixin Zhang <yixin.zhang@intel.com>
Date: Mon, 25 May 2020 18:22:42 +0800
Message-Id: <20200525102242.5656-1-yixin.zhang@intel.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH ltp] testcases/kernel: fix "No newline at end of file"
 warning
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Use below 1 line script to fix all files without a new line at EOF.

for dir in $(ls .); do \
  echo "dir: $dir"; \
  for f in $(find "$dir" -type f) ; do \
    echo "$f"; \
    if file "$f" | grep -qv 'ASCII'; then \
      continue; \
    fi; \
    if diff /dev/null "$f" | tail -1 | grep -q '^\\ No newline'; then \
      echo >> "$f"; \
    fi; \
  done; \
done

Use a $(ls .) at the most outer level to prevent modification of ".git"
folder.

Signed-off-by: Yixin Zhang <yixin.zhang@intel.com>
---
 testcases/kernel/device-drivers/pci/tpci_kernel/Makefile | 2 +-
 testcases/kernel/syscalls/clock_adjtime/Makefile         | 2 +-
 testcases/kernel/syscalls/clock_gettime/Makefile         | 2 +-
 testcases/kernel/syscalls/fgetxattr/Makefile             | 2 +-
 testcases/kernel/syscalls/fremovexattr/Makefile          | 2 +-
 testcases/kernel/syscalls/fsetxattr/Makefile             | 2 +-
 testcases/kernel/syscalls/membarrier/Makefile            | 2 +-
 testcases/kernel/syscalls/memfd_create/.gitignore        | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/testcases/kernel/device-drivers/pci/tpci_kernel/Makefile b/testcases/kernel/device-drivers/pci/tpci_kernel/Makefile
index 02496afb8226..6e1284d6cf53 100644
--- a/testcases/kernel/device-drivers/pci/tpci_kernel/Makefile
+++ b/testcases/kernel/device-drivers/pci/tpci_kernel/Makefile
@@ -32,4 +32,4 @@ MAKE_TARGETS := ltp_tpci.ko
 include $(top_srcdir)/include/mk/module.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-endif
\ No newline at end of file
+endif
diff --git a/testcases/kernel/syscalls/clock_adjtime/Makefile b/testcases/kernel/syscalls/clock_adjtime/Makefile
index 79f671f1c597..e49cb9b357a4 100644
--- a/testcases/kernel/syscalls/clock_adjtime/Makefile
+++ b/testcases/kernel/syscalls/clock_adjtime/Makefile
@@ -7,4 +7,4 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS+=-lrt
 
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
\ No newline at end of file
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/clock_gettime/Makefile b/testcases/kernel/syscalls/clock_gettime/Makefile
index 79f671f1c597..e49cb9b357a4 100644
--- a/testcases/kernel/syscalls/clock_gettime/Makefile
+++ b/testcases/kernel/syscalls/clock_gettime/Makefile
@@ -7,4 +7,4 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS+=-lrt
 
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
\ No newline at end of file
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/fgetxattr/Makefile b/testcases/kernel/syscalls/fgetxattr/Makefile
index f71e4fc25a2e..e6674a6b216c 100644
--- a/testcases/kernel/syscalls/fgetxattr/Makefile
+++ b/testcases/kernel/syscalls/fgetxattr/Makefile
@@ -5,4 +5,4 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
\ No newline at end of file
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/fremovexattr/Makefile b/testcases/kernel/syscalls/fremovexattr/Makefile
index f71e4fc25a2e..e6674a6b216c 100644
--- a/testcases/kernel/syscalls/fremovexattr/Makefile
+++ b/testcases/kernel/syscalls/fremovexattr/Makefile
@@ -5,4 +5,4 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
\ No newline at end of file
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/fsetxattr/Makefile b/testcases/kernel/syscalls/fsetxattr/Makefile
index f71e4fc25a2e..e6674a6b216c 100644
--- a/testcases/kernel/syscalls/fsetxattr/Makefile
+++ b/testcases/kernel/syscalls/fsetxattr/Makefile
@@ -5,4 +5,4 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
\ No newline at end of file
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/membarrier/Makefile b/testcases/kernel/syscalls/membarrier/Makefile
index f71e4fc25a2e..e6674a6b216c 100644
--- a/testcases/kernel/syscalls/membarrier/Makefile
+++ b/testcases/kernel/syscalls/membarrier/Makefile
@@ -5,4 +5,4 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-include $(top_srcdir)/include/mk/generic_leaf_target.mk
\ No newline at end of file
+include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/memfd_create/.gitignore b/testcases/kernel/syscalls/memfd_create/.gitignore
index 71b898c34fd0..b79adfa65357 100644
--- a/testcases/kernel/syscalls/memfd_create/.gitignore
+++ b/testcases/kernel/syscalls/memfd_create/.gitignore
@@ -1,4 +1,4 @@
 /memfd_create01
 /memfd_create02
 /memfd_create03
-/memfd_create04
\ No newline at end of file
+/memfd_create04
-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
