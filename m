Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B881625DA
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 12:59:40 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C9CAC3C2585
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 12:59:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 9FE073C2360
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 12:59:35 +0100 (CET)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by in-6.smtp.seeweb.it (Postfix) with ESMTP id 3D4791400B90
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 12:59:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582027172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hIsabLu+E/lEvXUfwk2OToIF20zSM69AkQRCZeSN+lk=;
 b=Mh6hALY20x1s+Zo2UodTvWUkJDXpFby2u9pGtsNHU7NWYsRbUbLbyljGeKHdOK12z9d2AN
 eotPWjo7ZEXFgMwqEoRsnTAUqBYBIj/TRlWp6o/+vnQNy6hKRBQci422jPrvOhvoUdf+zo
 K9jBqHxaobwV0kf7E4iTuLAYa+6SVhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419--J1E_BkpP8mng0VogrSIFg-1; Tue, 18 Feb 2020 06:59:27 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EFCF1005512
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 11:59:26 +0000 (UTC)
Received: from bootp-66-81-246.lab.eng.nay.redhat.com (unknown [10.66.81.246])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F3C05D9E2
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 11:59:25 +0000 (UTC)
From: Li Wang <liwang@redhat.com>
To: ltp@lists.linux.it
Date: Tue, 18 Feb 2020 19:59:18 +0800
Message-Id: <20200218115918.32203-1-liwang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: -J1E_BkpP8mng0VogrSIFg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] [PATCH] cleanup: avoid to generate many redundant obj files
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

Signed-off-by: Li Wang <liwang@redhat.com>
---

Notes:
    Travis: https://travis-ci.com/wangli5665/ltp/builds/149424324

 testcases/kernel/fs/ftest/Makefile               | 2 +-
 testcases/kernel/input/Makefile                  | 2 +-
 testcases/kernel/io/direct_io/Makefile           | 2 +-
 testcases/kernel/sched/clisrv/Makefile           | 2 +-
 testcases/kernel/sched/sched_stress/Makefile     | 2 +-
 testcases/kernel/syscalls/memfd_create/Makefile  | 2 +-
 testcases/kernel/syscalls/migrate_pages/Makefile | 2 +-
 testcases/kernel/syscalls/move_pages/Makefile    | 2 +-
 testcases/kernel/syscalls/swapoff/Makefile       | 2 +-
 testcases/kernel/syscalls/swapon/Makefile        | 2 +-
 testcases/network/nfs/nfslock01/Makefile         | 2 +-
 testcases/network/stress/ns-tools/Makefile       | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/testcases/kernel/fs/ftest/Makefile b/testcases/kernel/fs/ftest/Makefile
index 1566c5c31..e5672d5b1 100644
--- a/testcases/kernel/fs/ftest/Makefile
+++ b/testcases/kernel/fs/ftest/Makefile
@@ -28,4 +28,4 @@ FILTER_OUT_MAKE_TARGETS		:= libftest
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-$(MAKE_TARGETS): %: %.o libftest.o
+$(MAKE_TARGETS): %: libftest.o
diff --git a/testcases/kernel/input/Makefile b/testcases/kernel/input/Makefile
index 5f1db9328..f4d35ab39 100644
--- a/testcases/kernel/input/Makefile
+++ b/testcases/kernel/input/Makefile
@@ -24,4 +24,4 @@ FILTER_OUT_MAKE_TARGETS		:= input_helper
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-$(MAKE_TARGETS): %: %.o input_helper.o
+$(MAKE_TARGETS): %: input_helper.o
diff --git a/testcases/kernel/io/direct_io/Makefile b/testcases/kernel/io/direct_io/Makefile
index b522136ca..6d26a7ff3 100644
--- a/testcases/kernel/io/direct_io/Makefile
+++ b/testcases/kernel/io/direct_io/Makefile
@@ -30,4 +30,4 @@ INSTALL_TARGETS			:= test_dma_thread_diotest7.sh
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-$(MAKE_TARGETS): %: %.o diotest_routines.o
+$(MAKE_TARGETS): %: diotest_routines.o
diff --git a/testcases/kernel/sched/clisrv/Makefile b/testcases/kernel/sched/clisrv/Makefile
index af43b7efd..3e311b65b 100644
--- a/testcases/kernel/sched/clisrv/Makefile
+++ b/testcases/kernel/sched/clisrv/Makefile
@@ -31,6 +31,6 @@ INSTALL_TARGETS		:= data run_sched_cliserv.sh
 
 MAKE_TARGETS		:= pthcli pthserv
 
-$(MAKE_TARGETS): %: %.o readline.o writen.o
+$(MAKE_TARGETS): %: readline.o writen.o
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/sched/sched_stress/Makefile b/testcases/kernel/sched/sched_stress/Makefile
index 60bdc6936..2303f6950 100644
--- a/testcases/kernel/sched/sched_stress/Makefile
+++ b/testcases/kernel/sched/sched_stress/Makefile
@@ -32,7 +32,7 @@ MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(
 
 RM			+= -r
 
-$(filter-out sched_datafile,$(MAKE_TARGETS)): %: %.o sched.o
+$(filter-out sched_datafile,$(MAKE_TARGETS)): %: sched.o
 
 MAKE_TARGETS		+= sched_datafile
 
diff --git a/testcases/kernel/syscalls/memfd_create/Makefile b/testcases/kernel/syscalls/memfd_create/Makefile
index f23b8732c..40ccf7f7f 100644
--- a/testcases/kernel/syscalls/memfd_create/Makefile
+++ b/testcases/kernel/syscalls/memfd_create/Makefile
@@ -20,4 +20,4 @@ FILTER_OUT_MAKE_TARGETS         := memfd_create_common
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-$(MAKE_TARGETS): %: %.o memfd_create_common.o
+$(MAKE_TARGETS): %: memfd_create_common.o
diff --git a/testcases/kernel/syscalls/migrate_pages/Makefile b/testcases/kernel/syscalls/migrate_pages/Makefile
index 46a35d3e0..55174f3b8 100644
--- a/testcases/kernel/syscalls/migrate_pages/Makefile
+++ b/testcases/kernel/syscalls/migrate_pages/Makefile
@@ -21,7 +21,7 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 
 MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
-$(MAKE_TARGETS): %: %.o migrate_pages_common.o
+$(MAKE_TARGETS): %: migrate_pages_common.o
 
 CPPFLAGS		+= -I$(abs_srcdir)/../utils/
 
diff --git a/testcases/kernel/syscalls/move_pages/Makefile b/testcases/kernel/syscalls/move_pages/Makefile
index 27cf0f7a8..96ff7368f 100644
--- a/testcases/kernel/syscalls/move_pages/Makefile
+++ b/testcases/kernel/syscalls/move_pages/Makefile
@@ -24,7 +24,7 @@ CPPFLAGS		+= -I$(abs_srcdir)/../utils
 
 MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
 
-$(MAKE_TARGETS): %: %.o move_pages_support.o
+$(MAKE_TARGETS): %: move_pages_support.o
 
 LDLIBS			+= -lpthread -lrt
 
diff --git a/testcases/kernel/syscalls/swapoff/Makefile b/testcases/kernel/syscalls/swapoff/Makefile
index 536b2dbac..790a2a74e 100644
--- a/testcases/kernel/syscalls/swapoff/Makefile
+++ b/testcases/kernel/syscalls/swapoff/Makefile
@@ -21,4 +21,4 @@ top_srcdir		?= ../../../..
 include $(top_srcdir)/include/mk/testcases.mk
 include $(abs_srcdir)/./Makefile.inc
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-$(MAKE_TARGETS): %: %.o ../swapon/libswapon.o
+$(MAKE_TARGETS): %: ../swapon/libswapon.o
diff --git a/testcases/kernel/syscalls/swapon/Makefile b/testcases/kernel/syscalls/swapon/Makefile
index a109ecdf8..a9bd8f19f 100644
--- a/testcases/kernel/syscalls/swapon/Makefile
+++ b/testcases/kernel/syscalls/swapon/Makefile
@@ -29,4 +29,4 @@ FILTER_OUT_MAKE_TARGETS         := libswapon
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-$(MAKE_TARGETS): %: %.o libswapon.o
+$(MAKE_TARGETS): %: libswapon.o
diff --git a/testcases/network/nfs/nfslock01/Makefile b/testcases/network/nfs/nfslock01/Makefile
index a07a99ea9..978749a81 100644
--- a/testcases/network/nfs/nfslock01/Makefile
+++ b/testcases/network/nfs/nfslock01/Makefile
@@ -12,4 +12,4 @@ INSTALL_TARGETS			:= nfslock01
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-$(MAKE_TARGETS): %: %.o nfs_flock_func.o
+$(MAKE_TARGETS): %: nfs_flock_func.o
diff --git a/testcases/network/stress/ns-tools/Makefile b/testcases/network/stress/ns-tools/Makefile
index 49a05232f..a288066c8 100644
--- a/testcases/network/stress/ns-tools/Makefile
+++ b/testcases/network/stress/ns-tools/Makefile
@@ -35,4 +35,4 @@ FILTER_OUT_MAKE_TARGETS	:= ns-common
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
 
-$(MAKE_TARGETS): %: %.o ns-common.o
+$(MAKE_TARGETS): %: ns-common.o
-- 
2.20.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
