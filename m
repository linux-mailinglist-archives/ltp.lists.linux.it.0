Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F4B1DE707
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 14:38:44 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 573A03C31BE
	for <lists+linux-ltp@lfdr.de>; Fri, 22 May 2020 14:38:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id 4A2E43C232A
 for <ltp@lists.linux.it>; Fri, 22 May 2020 14:38:37 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A664D2013A0
 for <ltp@lists.linux.it>; Fri, 22 May 2020 14:38:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63FF2AD46;
 Fri, 22 May 2020 12:38:38 +0000 (UTC)
Date: Fri, 22 May 2020 14:39:03 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200522123903.GB2446@yuki.lan>
References: <cover.1590057824.git.viresh.kumar@linaro.org>
 <3b3344651f2ba4bf2446b6730a76ebcd9f894dd0.1590057824.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3b3344651f2ba4bf2446b6730a76ebcd9f894dd0.1590057824.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/5] syscalls:ipc: Move libraries to libs/ director
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, arnd@arndb.de,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Move the ipc libraries to libs/ directory. One of the reasons to do this
> was to add the capability of adding tests with both old and new test
> frameworks in the same ipc test directory.

Pushed with following diff, thanks.

1) You cannot build two different libs in one directory
2) Setting LTPLIBS instead of LDFLAGS generates proper build
   dependencies as well
3) Limit the linker flags for the kill and mremap tests

diff --git a/libs/libltpipc/Makefile b/libs/libltpipc/Makefile
index 11f38ea0a..9fdc57894 100644
--- a/libs/libltpipc/Makefile
+++ b/libs/libltpipc/Makefile
@@ -5,7 +5,7 @@ top_srcdir		?= ../..
 
 include $(top_srcdir)/include/mk/env_pre.mk
 
-LIB			:= libltpipc.a libltpmsgctl.a
+LIB			:= libltpipc.a
 
 include $(top_srcdir)/include/mk/lib.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgctl/Makefile b/testcases/kernel/syscalls/ipc/msgctl/Makefile
index e2b305573..a11cbcf2e 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgctl/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpnewipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpnewipc
-LDFLAGS += -L$(top_builddir)/libs/libltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgget/Makefile b/testcases/kernel/syscalls/ipc/msgget/Makefile
index e2b305573..a11cbcf2e 100644
--- a/testcases/kernel/syscalls/ipc/msgget/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgget/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpnewipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpnewipc
-LDFLAGS += -L$(top_builddir)/libs/libltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/Makefile b/testcases/kernel/syscalls/ipc/msgrcv/Makefile
index aa211d37f..f62cd1f48 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgrcv/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/Makefile b/testcases/kernel/syscalls/ipc/msgsnd/Makefile
index b4930310f..17960cae3 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgsnd/Makefile
@@ -3,6 +3,8 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpnewipc
+
 ifeq ($(UCLINUX),1)
 FILTER_OUT_MAKE_TARGETS += msgsnd05 msgsnd06
 endif
@@ -10,6 +12,5 @@ endif
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpnewipc
-LDFLAGS += -L$(top_builddir)/libs/libltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgstress/Makefile b/testcases/kernel/syscalls/ipc/msgstress/Makefile
index 551463829..f62cd1f48 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgstress/Makefile
@@ -3,10 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpipc
-LDLIBS  += -lltpmsgctl
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index aa211d37f..f62cd1f48 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semget/Makefile b/testcases/kernel/syscalls/ipc/semget/Makefile
index aa211d37f..f62cd1f48 100644
--- a/testcases/kernel/syscalls/ipc/semget/Makefile
+++ b/testcases/kernel/syscalls/ipc/semget/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semop/Makefile b/testcases/kernel/syscalls/ipc/semop/Makefile
index aa211d37f..f62cd1f48 100644
--- a/testcases/kernel/syscalls/ipc/semop/Makefile
+++ b/testcases/kernel/syscalls/ipc/semop/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmat/Makefile b/testcases/kernel/syscalls/ipc/shmat/Makefile
index e2b305573..a11cbcf2e 100644
--- a/testcases/kernel/syscalls/ipc/shmat/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmat/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpnewipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpnewipc
-LDFLAGS += -L$(top_builddir)/libs/libltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kernel/syscalls/ipc/shmctl/Makefile
index dda6d636f..cfa5d6e76 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
@@ -3,12 +3,13 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpipc
+
 shmctl05: CFLAGS += -pthread
 shmctl05: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmdt/Makefile b/testcases/kernel/syscalls/ipc/shmdt/Makefile
index aa211d37f..f62cd1f48 100644
--- a/testcases/kernel/syscalls/ipc/shmdt/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmdt/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmget/Makefile b/testcases/kernel/syscalls/ipc/shmget/Makefile
index aa211d37f..f62cd1f48 100644
--- a/testcases/kernel/syscalls/ipc/shmget/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmget/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir              ?= ../../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/kill/Makefile b/testcases/kernel/syscalls/kill/Makefile
index 3e32978fc..00cadabef 100644
--- a/testcases/kernel/syscalls/kill/Makefile
+++ b/testcases/kernel/syscalls/kill/Makefile
@@ -3,9 +3,11 @@
 
 top_srcdir		?= ../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
+kill07: LDLIBS  += -lltpipc
+kill05: LDLIBS  += -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/mremap/Makefile b/testcases/kernel/syscalls/mremap/Makefile
index 3e32978fc..7bdf425d2 100644
--- a/testcases/kernel/syscalls/mremap/Makefile
+++ b/testcases/kernel/syscalls/mremap/Makefile
@@ -3,9 +3,10 @@
 
 top_srcdir		?= ../../../..
 
+LTPLIBS = ltpipc
+
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
-LDFLAGS += -L$(top_builddir)/libs/libltpipc
+mremap04: LDLIBS  += -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk


-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
