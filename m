Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DAB332B2D
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 16:56:47 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 417C83C6A90
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Mar 2021 16:56:47 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id BF0313C556F
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 16:56:25 +0100 (CET)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 137B5600A00
 for <ltp@lists.linux.it>; Tue,  9 Mar 2021 16:56:25 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id a18so16581561wrc.13
 for <ltp@lists.linux.it>; Tue, 09 Mar 2021 07:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bD9VuacCfR8HkxYNTHdp7T444aPq8x+x5/Hnn8yUQFs=;
 b=eLFTSruiU3ZWDKPOoGs6/y5s0W3Rw74Sv9JujA23+1GO6lg8B2qTttcxZWiMSjFF8h
 vaTxp1Y/Ljt/yt7jkwbf7NZityj3jyLGHvNiQiMsUJuewdusCRObThdP5DMSJpljKLIK
 8c2c25FhAKnEwg+rLxU8/UBpAUF2fcdZOwqF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bD9VuacCfR8HkxYNTHdp7T444aPq8x+x5/Hnn8yUQFs=;
 b=hhBhmb3s5ljpC+Mk7k9xkliEZpCoSzogpehlrUeUdxv/gReF77ry/6d+bKr3dBafBf
 r6U9Yy+uT3eUGV82hRW1QQzjkiCx7jqhDhudv/SlCjl+sJ89oD6jesctPXJe6HJlm2oJ
 tBCwYUMVNzio3udmxz8PKNz/dETKOPYwHNvT3bQuvcbvo9BxIndigoxm7mG5T3kC0Rv+
 ApfBkkqUMAq3gRKuCatD7dECiwZ2AlZZ3Ul3VCjOQdDc6HQsu/ykLzvdfEGUtD41vyHM
 p4Bf+MUHNc7GtnNb0rVwh62gVg5x15xITjwXMWUEKFcC8Oq2+o/5YyGNaa/mt2VZ81OK
 qsqQ==
X-Gm-Message-State: AOAM533Bd/5pG03mdx7J/ZgY0mG65/a0qn1IIamscgfx17W1RswTAI3Y
 zXyHqo/YZmQQqmWkJlcj7lPrnphujghEwA==
X-Google-Smtp-Source: ABdhPJwS8fTIsPxM5MwnfXdh3C2XwvLRIoBYPxR8RN8GF6D4JJg2jl9ofL79CEmc7U6/XAAIXdAQFA==
X-Received: by 2002:a5d:6a4c:: with SMTP id t12mr4948848wrw.289.1615305384276; 
 Tue, 09 Mar 2021 07:56:24 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e1d9:50e9:2ad6:a226])
 by smtp.gmail.com with ESMTPSA id u23sm4721418wmn.26.2021.03.09.07.56.23
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 07:56:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: LTP List <ltp@lists.linux.it>
Date: Tue,  9 Mar 2021 15:56:22 +0000
Message-Id: <20210309155623.2457857-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210309155623.2457857-1-richard.purdie@linuxfoundation.org>
References: <20210309155623.2457857-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] Makefile: Avoid wildcard determinism issues
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

wildcard used in Makefiles preserves the order of the files on disk
which leads to differences in the order the binaries are linked.

This patch tweaks the usage of wildcard to also have a sort, making
the binaries reproducible. A previous patch massively improved
the situation but wider testing showed that these other changes can
have an effect on some binaries, this patch avoids those issues as
exposed by our wider testing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 include/mk/env_post.mk                                     | 2 +-
 include/mk/module.mk                                       | 2 +-
 runtest/Makefile                                           | 2 +-
 scenario_groups/Makefile                                   | 2 +-
 testcases/commands/ldd/datafiles/Makefile                  | 2 +-
 testcases/kernel/hotplug/memory_hotplug/Makefile           | 3 ++-
 testcases/kernel/io/disktest/Makefile                      | 2 +-
 testcases/kernel/io/disktest/Makefile.linux                | 4 ++--
 testcases/kernel/sched/hyperthreading/ht_affinity/Makefile | 2 +-
 testcases/kernel/sched/hyperthreading/ht_enabled/Makefile  | 2 +-
 testcases/kernel/sched/sched_stress/Makefile               | 2 +-
 testcases/kernel/syscalls/lchown/Makefile                  | 2 +-
 testcases/kernel/syscalls/migrate_pages/Makefile           | 2 +-
 testcases/kernel/syscalls/move_pages/Makefile              | 2 +-
 testcases/kernel/syscalls/utils/compat_16.mk               | 2 +-
 testcases/kernel/syscalls/utils/newer_64.mk                | 2 +-
 testcases/misc/math/float/Makefile                         | 2 +-
 testcases/network/nfs/nfs_stress/nfs05_make_tree.c         | 4 ++--
 testcases/network/nfsv4/locks/Makefile                     | 2 +-
 utils/sctp/func_tests/Makefile                             | 2 +-
 20 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/include/mk/env_post.mk b/include/mk/env_post.mk
index d52ad9f0b..1d22f9c53 100644
--- a/include/mk/env_post.mk
+++ b/include/mk/env_post.mk
@@ -47,7 +47,7 @@ LDFLAGS				+= -L$(top_builddir)/lib/android_libpthread
 LDFLAGS				+= -L$(top_builddir)/lib/android_librt
 endif
 
-MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(wildcard $(abs_srcdir)/*.c)))
+MAKE_TARGETS			?= $(notdir $(patsubst %.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
 MAKE_TARGETS			:= $(filter-out $(FILTER_OUT_MAKE_TARGETS),$(MAKE_TARGETS))
 
 # with only *.dwo, .[0-9]+.dwo can not be cleaned
diff --git a/include/mk/module.mk b/include/mk/module.mk
index 95fb8336a..6c8814b96 100644
--- a/include/mk/module.mk
+++ b/include/mk/module.mk
@@ -42,7 +42,7 @@ endif
 
 ifneq ($(filter install clean,$(MAKECMDGOALS)),)
 MAKE_TARGETS := $(filter-out %.ko, $(MAKE_TARGETS))
-MAKE_TARGETS += $(wildcard *.ko)
+MAKE_TARGETS += $(sort $(wildcard *.ko))
 endif
 
 CLEAN_TARGETS += .dep_modules *.mod built-in.a
diff --git a/runtest/Makefile b/runtest/Makefile
index b7caaee06..6a1565b6a 100644
--- a/runtest/Makefile
+++ b/runtest/Makefile
@@ -36,7 +36,7 @@ ifneq ($(WITH_POWER_MANAGEMENT_TESTSUITE),yes)
 UNWANTED_FILES		+= power_management_tests
 endif
 
-INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
+INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
 
 MAKE_TARGETS		:=
 
diff --git a/scenario_groups/Makefile b/scenario_groups/Makefile
index 2978675d9..fcbc92708 100644
--- a/scenario_groups/Makefile
+++ b/scenario_groups/Makefile
@@ -31,7 +31,7 @@ UNWANTED_FILES		:= Makefile
 
 INSTALL_MODE		:= 00644
 
-INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(wildcard $(abs_srcdir)/*))))
+INSTALL_TARGETS		:= $(filter-out $(UNWANTED_FILES),$(notdir $(patsubst $(abs_srcdir)/%,%,$(sort $(wildcard $(abs_srcdir)/*)))))
 
 MAKE_TARGETS		:=
 
diff --git a/testcases/commands/ldd/datafiles/Makefile b/testcases/commands/ldd/datafiles/Makefile
index d8bcf5c06..01c352052 100644
--- a/testcases/commands/ldd/datafiles/Makefile
+++ b/testcases/commands/ldd/datafiles/Makefile
@@ -21,7 +21,7 @@ CPPFLAGS		+= -fpic
 
 INSTALL_TARGETS		:= ldd*.so lddfile.out
 
-LDD_C_FILES		:= $(wildcard $(abs_srcdir)/lddfile*.c)
+LDD_C_FILES		:= $(sort $(wildcard $(abs_srcdir)/lddfile*.c))
 LDD_SO_FILES		:= $(patsubst $(abs_srcdir)/%.c,%.obj.so,$(LDD_C_FILES))
 MAKE_TARGETS		:= lddfile.out
 CLEAN_TARGETS		+= *.obj $(LDD_SO_FILES)
diff --git a/testcases/kernel/hotplug/memory_hotplug/Makefile b/testcases/kernel/hotplug/memory_hotplug/Makefile
index d1ba65e65..38a77a2ba 100644
--- a/testcases/kernel/hotplug/memory_hotplug/Makefile
+++ b/testcases/kernel/hotplug/memory_hotplug/Makefile
@@ -31,6 +31,7 @@ LDLIBS		:= $(filter-out -lltp,$(LDLIBS))
 
 MAKE_TARGETS	:= memtoy
 
-memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
+memtoy: $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
+
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/io/disktest/Makefile b/testcases/kernel/io/disktest/Makefile
index d10d98434..3a3a9cbf0 100644
--- a/testcases/kernel/io/disktest/Makefile
+++ b/testcases/kernel/io/disktest/Makefile
@@ -209,7 +209,7 @@ LDLIBS		+= -lpthread
 
 MAKE_TARGETS	:= disktest
 
-OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
+OBJS		:= $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
 
 disktest-$(VER):
 	mkdir -p "$@"
diff --git a/testcases/kernel/io/disktest/Makefile.linux b/testcases/kernel/io/disktest/Makefile.linux
index ea45b5a57..0f3aab622 100644
--- a/testcases/kernel/io/disktest/Makefile.linux
+++ b/testcases/kernel/io/disktest/Makefile.linux
@@ -167,8 +167,8 @@ mandir=/usr/share/man
 
 VER=`grep VER_STR main.h | awk -F\" '{print $$2}'`
 GBLHDRS=main.h globals.h defs.h
-ALLHDRS=$(wildcard *.h)
-SRCS=$(wildcard *.c)
+ALLHDRS=$(sort $(wildcard *.h))
+SRCS=$(sort $(wildcard *.c))
 OBJS=$(SRCS:.c=.o)
 
 CFLAGS += -g -Wall -O -D"LINUX" -D"_THREAD_SAFE" -D"_GNU_SOURCE" -D"_LARGE_FILES" -D"_LARGEFILE64_SOURCE" -D"_FILE_OFFSET_BITS=64" $(RPM_OPT_FLAGS)
diff --git a/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile b/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
index 10fec96dc..6b64bd261 100644
--- a/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
+++ b/testcases/kernel/sched/hyperthreading/ht_affinity/Makefile
@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_affinity.sh
 
 MAKE_TARGETS		:= ht_affinity
 
-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile b/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
index 9c1e139d6..585ff1383 100644
--- a/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
+++ b/testcases/kernel/sched/hyperthreading/ht_enabled/Makefile
@@ -28,6 +28,6 @@ INSTALL_TARGETS		:= smt_smp_enabled.sh
 
 MAKE_TARGETS		:= ht_enabled
 
-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/sched/sched_stress/Makefile b/testcases/kernel/sched/sched_stress/Makefile
index b76126c73..4dbbf3477 100644
--- a/testcases/kernel/sched/sched_stress/Makefile
+++ b/testcases/kernel/sched/sched_stress/Makefile
@@ -10,7 +10,7 @@ INSTALL_TARGETS		:= sched_stress.sh
 
 LDLIBS			+= -lpthread
 
-MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c)))
+MAKE_TARGETS		:= $(filter-out sched,$(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c))))
 
 RM			+= -r
 
diff --git a/testcases/kernel/syscalls/lchown/Makefile b/testcases/kernel/syscalls/lchown/Makefile
index 13d39cb81..305fee281 100644
--- a/testcases/kernel/syscalls/lchown/Makefile
+++ b/testcases/kernel/syscalls/lchown/Makefile
@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-SRCS			:= $(wildcard $(abs_srcdir)/lchown*.c)
+SRCS			:= $(sort $(wildcard $(abs_srcdir)/lchown*.c))
 
 include $(abs_srcdir)/../utils/compat_16.mk
 
diff --git a/testcases/kernel/syscalls/migrate_pages/Makefile b/testcases/kernel/syscalls/migrate_pages/Makefile
index 46912b025..9cf3ce526 100644
--- a/testcases/kernel/syscalls/migrate_pages/Makefile
+++ b/testcases/kernel/syscalls/migrate_pages/Makefile
@@ -5,7 +5,7 @@ top_srcdir		?= ../../../..
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
+MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
 $(MAKE_TARGETS): %: migrate_pages_common.o
 
 CPPFLAGS		+= -I$(abs_srcdir)/../utils/
diff --git a/testcases/kernel/syscalls/move_pages/Makefile b/testcases/kernel/syscalls/move_pages/Makefile
index cd7ff6349..4b22160ed 100644
--- a/testcases/kernel/syscalls/move_pages/Makefile
+++ b/testcases/kernel/syscalls/move_pages/Makefile
@@ -7,7 +7,7 @@ include $(top_srcdir)/include/mk/testcases.mk
 
 CPPFLAGS		+= -I$(abs_srcdir)/../utils
 
-MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*[0-9].c))
+MAKE_TARGETS		:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*[0-9].c)))
 
 $(MAKE_TARGETS): %: move_pages_support.o
 
diff --git a/testcases/kernel/syscalls/utils/compat_16.mk b/testcases/kernel/syscalls/utils/compat_16.mk
index a0ff8f558..e81a00c40 100644
--- a/testcases/kernel/syscalls/utils/compat_16.mk
+++ b/testcases/kernel/syscalls/utils/compat_16.mk
@@ -50,7 +50,7 @@
 
 CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
 
-SRCS			?= $(wildcard $(abs_srcdir)/*.c)
+SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
 
 MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
 MAKE_TARGETS_OBJS_WO_COMPAT_16	:= $(addsuffix .o,$(MAKE_TARGETS))
diff --git a/testcases/kernel/syscalls/utils/newer_64.mk b/testcases/kernel/syscalls/utils/newer_64.mk
index 8cd7e03c8..5e798057a 100644
--- a/testcases/kernel/syscalls/utils/newer_64.mk
+++ b/testcases/kernel/syscalls/utils/newer_64.mk
@@ -25,7 +25,7 @@
 
 CPPFLAGS		+= -I$(abs_srcdir) -I$(abs_srcdir)/../utils
 
-SRCS			?= $(wildcard $(abs_srcdir)/*.c)
+SRCS			?= $(sort $(wildcard $(abs_srcdir)/*.c))
 
 MAKE_TARGETS		:= $(notdir $(patsubst %.c,%,$(SRCS)))
 
diff --git a/testcases/misc/math/float/Makefile b/testcases/misc/math/float/Makefile
index 79dda35d6..5f4cb0f6c 100644
--- a/testcases/misc/math/float/Makefile
+++ b/testcases/misc/math/float/Makefile
@@ -27,6 +27,6 @@ include $(top_srcdir)/include/mk/testcases.mk
 LDLIBS		+= -lpthread -lm
 
 # main.c doesn't compile...
-MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/float*.c))
+MAKE_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/float*.c)))
 
 include $(top_srcdir)/include/mk/generic_trunk_target.mk
diff --git a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
index 12c86799d..23c520d9d 100644
--- a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
+++ b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
@@ -104,7 +104,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNUSED void *args)
 				"\treturn 0;\n}\n";
 
 	const char make_buf_n[] = "CFLAGS := -O -w -g\n"
-				  "SRCS=$(wildcard *.c)\n"
+				  "SRCS=$(sort $(wildcard *.c))\n"
 				  "TARGETS=$(SRCS:.c=)\n"
 				  "all: $(TARGETS)\n"
 				  "$(TARGETS): %: %.c\n"
@@ -114,7 +114,7 @@ static void *thread_fn(LTP_ATTRIBUTE_UNUSED void *args)
 
 	const char make_buf[] = "CFLAGS := -O -w -g\n"
 				"SUBDIR = dir\n"
-				"SRCS=$(wildcard *.c)\n"
+				"SRCS=$(sort $(wildcard *.c))\n"
 				"TARGETS=$(SRCS:.c=)\n"
 				"all: $(SUBDIR) $(TARGETS)\n"
 				"$(TARGETS): %: %.c\n"
diff --git a/testcases/network/nfsv4/locks/Makefile b/testcases/network/nfsv4/locks/Makefile
index 5812dea3a..05941c892 100644
--- a/testcases/network/nfsv4/locks/Makefile
+++ b/testcases/network/nfsv4/locks/Makefile
@@ -28,6 +28,6 @@ MAKE_TARGETS		:= locktests
 
 LDLIBS			+= -lpthread
 
-$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(wildcard $(abs_srcdir)/*.c))
+$(MAKE_TARGETS): $(patsubst $(abs_srcdir)/%.c,%.o,$(sort $(wildcard $(abs_srcdir)/*.c)))
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/utils/sctp/func_tests/Makefile b/utils/sctp/func_tests/Makefile
index d296c652a..a17107853 100644
--- a/utils/sctp/func_tests/Makefile
+++ b/utils/sctp/func_tests/Makefile
@@ -30,7 +30,7 @@ LDFLAGS		+= $(addprefix -L$(abs_builddir)/../,lib testlib)
 
 LDLIBS		+= -lsctputil -lsctp -lpthread
 
-V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(wildcard $(abs_srcdir)/*.c))
+V4_TARGETS	:= $(patsubst $(abs_srcdir)/%.c,%,$(sort $(wildcard $(abs_srcdir)/*.c)))
 
 V6_TARGETS	:= test_basic_v6 test_fragments_v6 test_getname_v6 \
 		   test_inaddr_any_v6 test_peeloff_v6 \
-- 
2.27.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
