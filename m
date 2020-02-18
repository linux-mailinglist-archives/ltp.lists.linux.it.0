Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 27FBA1627A8
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 15:06:15 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A0A173C259E
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 15:06:14 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 3546D3C2358
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 15:06:09 +0100 (CET)
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id F22991A011F8
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 15:06:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=Sd9ky
 QZUpYHdNhuCNnkskl+HD46x36IkBLUDdvtRbGM=; b=ilv60itN499MvxEsdDBZ8
 eQMPtrxm1bKkqIvBR2gz0th8ykjpQwBeiMvaT1Hc/igItMleZ9zE5tofqDBK7x8h
 sNu0bKUEtmKNW6bcI3+TZS9Lxzwci6C6s90xmpEJJ8SMTcYt2h3xmLxwHYb8okjB
 GL0WR++rRcgOrYYcFEk4dM=
Received: from [192.168.0.106] (unknown [223.64.142.36])
 by smtp13 (Coremail) with SMTP id EcCowAAXafI470temTJIig--.11233S2;
 Tue, 18 Feb 2020 22:05:56 +0800 (CST)
To: Li Wang <liwang@redhat.com>, ltp@lists.linux.it
References: <20200218115918.32203-1-liwang@redhat.com>
From: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <a3d98743-8c77-3282-97dd-a2864886e8c6@163.com>
Date: Tue, 18 Feb 2020 22:05:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200218115918.32203-1-liwang@redhat.com>
X-CM-TRANSID: EcCowAAXafI470temTJIig--.11233S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3AFWftFWfCryrtFWkXrW5Jrb_yoWxKw4rpr
 savr48Cw4DJFy8t3yrXrs8K3y8Xw15Xw4rWF40vrs09ws2vryUtrW2qF9rAr12grWUZayS
 9a1xWrW7t3y5ZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jmD73UUUUU=
X-Originating-IP: [223.64.142.36]
X-CM-SenderInfo: p0x1t05jbm5saquriqqrwthudrp/xtbBdhrNhFUMMOe5ngABsN
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.3 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,HTML_MESSAGE,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] cleanup: avoid to generate many redundant obj
 files
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
Content-Type: multipart/mixed; boundary="===============0935770562=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0935770562==
Content-Type: multipart/alternative;
 boundary="------------6B904EFFF7F37188BC2B5393"

This is a multi-part message in MIME format.
--------------6B904EFFF7F37188BC2B5393
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 7bit

Hi Li

This patch looks good to me, feel free to add
Reviewed-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>

Also, I think we can replace GPL with SPDX-License-Identifier in these makefiles(Also for
all ltp makefiles, we have converted SPDX-License-Identifier in few header since commit b288957a88b1 ).

Best Regard
Yang Xu

> Signed-off-by: Li Wang <liwang@redhat.com>
> ---
>
> Notes:
>      Travis: https://travis-ci.com/wangli5665/ltp/builds/149424324
>
>   testcases/kernel/fs/ftest/Makefile               | 2 +-
>   testcases/kernel/input/Makefile                  | 2 +-
>   testcases/kernel/io/direct_io/Makefile           | 2 +-
>   testcases/kernel/sched/clisrv/Makefile           | 2 +-
>   testcases/kernel/sched/sched_stress/Makefile     | 2 +-
>   testcases/kernel/syscalls/memfd_create/Makefile  | 2 +-
>   testcases/kernel/syscalls/migrate_pages/Makefile | 2 +-
>   testcases/kernel/syscalls/move_pages/Makefile    | 2 +-
>   testcases/kernel/syscalls/swapoff/Makefile       | 2 +-
>   testcases/kernel/syscalls/swapon/Makefile        | 2 +-
>   testcases/network/nfs/nfslock01/Makefile         | 2 +-
>   testcases/network/stress/ns-tools/Makefile       | 2 +-
>   12 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/testcases/kernel/fs/ftest/Makefile b/testcases/kernel/fs/ftest/Makefile
> index 1566c5c31..e5672d5b1 100644
> --- a/testcases/kernel/fs/ftest/Makefile
> +++ b/testcases/kernel/fs/ftest/Makefile
> @@ -28,4 +28,4 @@ FILTER_OUT_MAKE_TARGETS		:= libftest
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>   
> -$(MAKE_TARGETS): %: %.o libftest.o
> +$(MAKE_TARGETS): %: libftest.o
> diff --git a/testcases/kernel/input/Makefile b/testcases/kernel/input/Makefile
> index 5f1db9328..f4d35ab39 100644
> --- a/testcases/kernel/input/Makefile
> +++ b/testcases/kernel/input/Makefile
> @@ -24,4 +24,4 @@ FILTER_OUT_MAKE_TARGETS		:= input_helper
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>   
> -$(MAKE_TARGETS): %: %.o input_helper.o
> +$(MAKE_TARGETS): %: input_helper.o
> diff --git a/testcases/kernel/io/direct_io/Makefile b/testcases/kernel/io/direct_io/Makefile
> index b522136ca..6d26a7ff3 100644
> --- a/testcases/kernel/io/direct_io/Makefile
> +++ b/testcases/kernel/io/direct_io/Makefile
> @@ -30,4 +30,4 @@ INSTALL_TARGETS			:= test_dma_thread_diotest7.sh
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>   
> -$(MAKE_TARGETS): %: %.o diotest_routines.o
> +$(MAKE_TARGETS): %: diotest_routines.o
> diff --git a/testcases/kernel/sched/clisrv/Makefile b/testcases/kernel/sched/clisrv/Makefile
> index af43b7efd..3e311b65b 100644
> --- a/testcases/kernel/sched/clisrv/Makefile
> +++ b/testcases/kernel/sched/clisrv/Makefile
> @@ -31,6 +31,6 @@ INSTALL_TARGETS		:= data run_sched_cliserv.sh
>   
>   MAKE_TARGETS		:= pthcli pthserv
>   
> -$(MAKE_TARGETS): %: %.o readline.o writen.o
> +$(MAKE_TARGETS): %: readline.o writen.o
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> diff --git a/testcases/kernel/sched/sched_stress/Makefile b/testcases/kernel/sched/sched_stress/Makefile
> index 60bdc6936..2303f6950 100644
> --- a/testcases/kernel/sched/sched_stress/Makefile
> +++ b/testcases/kernel/sched/sched_stress/Makefile
> @@ -32,7 +32,7 @@ MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(
>   
>   RM			+= -r
>   
> -$(filter-out sched_datafile,$(MAKE_TARGETS)): %: %.o sched.o
> +$(filter-out sched_datafile,$(MAKE_TARGETS)): %: sched.o
>   
>   MAKE_TARGETS		+= sched_datafile
>   
> diff --git a/testcases/kernel/syscalls/memfd_create/Makefile b/testcases/kernel/syscalls/memfd_create/Makefile
> index f23b8732c..40ccf7f7f 100644
> --- a/testcases/kernel/syscalls/memfd_create/Makefile
> +++ b/testcases/kernel/syscalls/memfd_create/Makefile
> @@ -20,4 +20,4 @@ FILTER_OUT_MAKE_TARGETS         := memfd_create_common
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>   
> -$(MAKE_TARGETS): %: %.o memfd_create_common.o
> +$(MAKE_TARGETS): %: memfd_create_common.o
> diff --git a/testcases/kernel/syscalls/migrate_pages/Makefile b/testcases/kernel/syscalls/migrate_pages/Makefile
> index 46a35d3e0..55174f3b8 100644
> --- a/testcases/kernel/syscalls/migrate_pages/Makefile
> +++ b/testcases/kernel/syscalls/migrate_pages/Makefile
> @@ -21,7 +21,7 @@ top_srcdir		?= ../../../..
>   include $(top_srcdir)/include/mk/testcases.mk
>   
>   MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
> -$(MAKE_TARGETS): %: %.o migrate_pages_common.o
> +$(MAKE_TARGETS): %: migrate_pages_common.o
>   
>   CPPFLAGS		+= -I$(abs_srcdir)/../utils/
>   
> diff --git a/testcases/kernel/syscalls/move_pages/Makefile b/testcases/kernel/syscalls/move_pages/Makefile
> index 27cf0f7a8..96ff7368f 100644
> --- a/testcases/kernel/syscalls/move_pages/Makefile
> +++ b/testcases/kernel/syscalls/move_pages/Makefile
> @@ -24,7 +24,7 @@ CPPFLAGS		+= -I$(abs_srcdir)/../utils
>   
>   MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
>   
> -$(MAKE_TARGETS): %: %.o move_pages_support.o
> +$(MAKE_TARGETS): %: move_pages_support.o
>   
>   LDLIBS			+= -lpthread -lrt
>   
> diff --git a/testcases/kernel/syscalls/swapoff/Makefile b/testcases/kernel/syscalls/swapoff/Makefile
> index 536b2dbac..790a2a74e 100644
> --- a/testcases/kernel/syscalls/swapoff/Makefile
> +++ b/testcases/kernel/syscalls/swapoff/Makefile
> @@ -21,4 +21,4 @@ top_srcdir		?= ../../../..
>   include $(top_srcdir)/include/mk/testcases.mk
>   include $(abs_srcdir)/./Makefile.inc
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
> -$(MAKE_TARGETS): %: %.o ../swapon/libswapon.o
> +$(MAKE_TARGETS): %: ../swapon/libswapon.o
> diff --git a/testcases/kernel/syscalls/swapon/Makefile b/testcases/kernel/syscalls/swapon/Makefile
> index a109ecdf8..a9bd8f19f 100644
> --- a/testcases/kernel/syscalls/swapon/Makefile
> +++ b/testcases/kernel/syscalls/swapon/Makefile
> @@ -29,4 +29,4 @@ FILTER_OUT_MAKE_TARGETS         := libswapon
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>   
> -$(MAKE_TARGETS): %: %.o libswapon.o
> +$(MAKE_TARGETS): %: libswapon.o
> diff --git a/testcases/network/nfs/nfslock01/Makefile b/testcases/network/nfs/nfslock01/Makefile
> index a07a99ea9..978749a81 100644
> --- a/testcases/network/nfs/nfslock01/Makefile
> +++ b/testcases/network/nfs/nfslock01/Makefile
> @@ -12,4 +12,4 @@ INSTALL_TARGETS			:= nfslock01
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>   
> -$(MAKE_TARGETS): %: %.o nfs_flock_func.o
> +$(MAKE_TARGETS): %: nfs_flock_func.o
> diff --git a/testcases/network/stress/ns-tools/Makefile b/testcases/network/stress/ns-tools/Makefile
> index 49a05232f..a288066c8 100644
> --- a/testcases/network/stress/ns-tools/Makefile
> +++ b/testcases/network/stress/ns-tools/Makefile
> @@ -35,4 +35,4 @@ FILTER_OUT_MAKE_TARGETS	:= ns-common
>   
>   include $(top_srcdir)/include/mk/generic_leaf_target.mk
>   
> -$(MAKE_TARGETS): %: %.o ns-common.o
> +$(MAKE_TARGETS): %: ns-common.o

--------------6B904EFFF7F37188BC2B5393
Content-Type: text/html; charset=gbk
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
  </head>
  <body>
    <pre>Hi Li

This patch looks good to me, feel free to add
Reviewed-by: Yang Xu <a class="moz-txt-link-rfc2396E" href="mailto:xuyang2018.jy@cn.fujitsu.com">&lt;xuyang2018.jy@cn.fujitsu.com&gt;</a>

Also, I think we can replace GPL with SPDX-License-Identifier in these makefiles(Also for
all ltp makefiles, we have converted SPDX-License-Identifier in few header since commit b288957a88b1 ).

Best Regard
Yang Xu
</pre>
    <blockquote type="cite"
      cite="mid:20200218115918.32203-1-liwang@redhat.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Li Wang <a class="moz-txt-link-rfc2396E" href="mailto:liwang@redhat.com">&lt;liwang@redhat.com&gt;</a>
---

Notes:
    Travis: <a class="moz-txt-link-freetext" href="https://travis-ci.com/wangli5665/ltp/builds/149424324">https://travis-ci.com/wangli5665/ltp/builds/149424324</a>

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
</pre>
    </blockquote>
  </body>
</html>

--------------6B904EFFF7F37188BC2B5393--


--===============0935770562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0935770562==--

