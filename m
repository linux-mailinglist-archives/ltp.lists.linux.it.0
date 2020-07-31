Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E823458C
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 14:15:08 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7128C3C4BAF
	for <lists+linux-ltp@lfdr.de>; Fri, 31 Jul 2020 14:15:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 06AC93C13DC
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 14:14:48 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 7BA5C1003A65
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 14:14:48 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34678B188
 for <ltp@lists.linux.it>; Fri, 31 Jul 2020 12:15:01 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Fri, 31 Jul 2020 14:15:07 +0200
Message-Id: <20200731121508.12805-3-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200731121508.12805-1-chrubis@suse.cz>
References: <20200731121508.12805-1-chrubis@suse.cz>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 2/3] testcases: Make use of LTPLDLIBS
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

Signed-off-by: Cyril Hrubis <chrubis@suse.cz>
---
 testcases/kernel/syscalls/clock_gettime/Makefile   | 2 +-
 testcases/kernel/syscalls/ipc/msgctl/Makefile      | 2 +-
 testcases/kernel/syscalls/ipc/msgget/Makefile      | 2 +-
 testcases/kernel/syscalls/ipc/msgrcv/Makefile      | 2 +-
 testcases/kernel/syscalls/ipc/msgsnd/Makefile      | 2 +-
 testcases/kernel/syscalls/ipc/msgstress/Makefile   | 2 +-
 testcases/kernel/syscalls/ipc/semctl/Makefile      | 4 ++--
 testcases/kernel/syscalls/ipc/semget/Makefile      | 2 +-
 testcases/kernel/syscalls/ipc/semop/Makefile       | 2 +-
 testcases/kernel/syscalls/ipc/shmat/Makefile       | 2 +-
 testcases/kernel/syscalls/ipc/shmctl/Makefile      | 4 ++--
 testcases/kernel/syscalls/ipc/shmdt/Makefile       | 2 +-
 testcases/kernel/syscalls/ipc/shmget/Makefile      | 2 +-
 testcases/kernel/syscalls/kill/Makefile            | 4 ++--
 testcases/kernel/syscalls/mbind/Makefile           | 6 ++++--
 testcases/kernel/syscalls/mremap/Makefile          | 2 +-
 testcases/kernel/syscalls/rt_sigtimedwait/Makefile | 2 +-
 testcases/kernel/syscalls/set_mempolicy/Makefile   | 3 ++-
 testcases/kernel/syscalls/sigtimedwait/Makefile    | 2 +-
 testcases/kernel/syscalls/sigwait/Makefile         | 2 +-
 testcases/kernel/syscalls/sigwaitinfo/Makefile     | 2 +-
 21 files changed, 28 insertions(+), 25 deletions(-)

diff --git a/testcases/kernel/syscalls/clock_gettime/Makefile b/testcases/kernel/syscalls/clock_gettime/Makefile
index 1c1cbd7a8..e7f5e9e75 100644
--- a/testcases/kernel/syscalls/clock_gettime/Makefile
+++ b/testcases/kernel/syscalls/clock_gettime/Makefile
@@ -8,6 +8,6 @@ LTPLIBS = ltpvdso
 include $(top_srcdir)/include/mk/testcases.mk
 
 LDLIBS+=-lrt
-clock_gettime04: LDLIBS += -lltpvdso
+clock_gettime04: LTPLDLIBS = -lltpvdso
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgctl/Makefile b/testcases/kernel/syscalls/ipc/msgctl/Makefile
index a11cbcf2e..6b2b26d05 100644
--- a/testcases/kernel/syscalls/ipc/msgctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgctl/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpnewipc
+LTPLDLIBS  = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgget/Makefile b/testcases/kernel/syscalls/ipc/msgget/Makefile
index a11cbcf2e..6b2b26d05 100644
--- a/testcases/kernel/syscalls/ipc/msgget/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgget/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpnewipc
+LTPLDLIBS  = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgrcv/Makefile b/testcases/kernel/syscalls/ipc/msgrcv/Makefile
index f62cd1f48..26b9f264d 100644
--- a/testcases/kernel/syscalls/ipc/msgrcv/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgrcv/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
+LTPLDLIBS  = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgsnd/Makefile b/testcases/kernel/syscalls/ipc/msgsnd/Makefile
index 17960cae3..85017fe90 100644
--- a/testcases/kernel/syscalls/ipc/msgsnd/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgsnd/Makefile
@@ -11,6 +11,6 @@ endif
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpnewipc
+LTPLDLIBS  += -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/msgstress/Makefile b/testcases/kernel/syscalls/ipc/msgstress/Makefile
index f62cd1f48..b821bda01 100644
--- a/testcases/kernel/syscalls/ipc/msgstress/Makefile
+++ b/testcases/kernel/syscalls/ipc/msgstress/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
+LTPLDLIBS  += -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semctl/Makefile b/testcases/kernel/syscalls/ipc/semctl/Makefile
index 99971a7db..f711e7750 100644
--- a/testcases/kernel/syscalls/ipc/semctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/semctl/Makefile
@@ -7,7 +7,7 @@ LTPLIBS = ltpipc ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LDLIBS += -lltpipc
-semctl08: LDLIBS += -lltpnewipc
+semctl01 semctl02 semctl03 semctl04 semctl05 semctl06 semctl07: LTPLDLIBS = -lltpipc
+semctl08: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semget/Makefile b/testcases/kernel/syscalls/ipc/semget/Makefile
index f62cd1f48..26b9f264d 100644
--- a/testcases/kernel/syscalls/ipc/semget/Makefile
+++ b/testcases/kernel/syscalls/ipc/semget/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
+LTPLDLIBS  = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/semop/Makefile b/testcases/kernel/syscalls/ipc/semop/Makefile
index f62cd1f48..26b9f264d 100644
--- a/testcases/kernel/syscalls/ipc/semop/Makefile
+++ b/testcases/kernel/syscalls/ipc/semop/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
+LTPLDLIBS  = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmat/Makefile b/testcases/kernel/syscalls/ipc/shmat/Makefile
index a11cbcf2e..6b2b26d05 100644
--- a/testcases/kernel/syscalls/ipc/shmat/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmat/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpnewipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpnewipc
+LTPLDLIBS  = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmctl/Makefile b/testcases/kernel/syscalls/ipc/shmctl/Makefile
index 0172bb495..2e0ed0ceb 100644
--- a/testcases/kernel/syscalls/ipc/shmctl/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmctl/Makefile
@@ -10,7 +10,7 @@ shmctl05: LDLIBS += -lrt
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-shmctl01 shmctl02 shmctl03 shmctl04 shmctl05: LDLIBS += -lltpipc
-shmctl06: LDLIBS += -lltpnewipc
+shmctl01 shmctl02 shmctl03 shmctl04 shmctl05: LTPLDLIBS = -lltpipc
+shmctl06: LTPLDLIBS = -lltpnewipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmdt/Makefile b/testcases/kernel/syscalls/ipc/shmdt/Makefile
index f62cd1f48..26b9f264d 100644
--- a/testcases/kernel/syscalls/ipc/shmdt/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmdt/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
+LTPLDLIBS  = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/ipc/shmget/Makefile b/testcases/kernel/syscalls/ipc/shmget/Makefile
index f62cd1f48..26b9f264d 100644
--- a/testcases/kernel/syscalls/ipc/shmget/Makefile
+++ b/testcases/kernel/syscalls/ipc/shmget/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += -lltpipc
+LTPLDLIBS  = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/kill/Makefile b/testcases/kernel/syscalls/kill/Makefile
index 00cadabef..3d1b1468a 100644
--- a/testcases/kernel/syscalls/kill/Makefile
+++ b/testcases/kernel/syscalls/kill/Makefile
@@ -7,7 +7,7 @@ LTPLIBS = ltpipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-kill07: LDLIBS  += -lltpipc
-kill05: LDLIBS  += -lltpipc
+kill07: LTPLDLIBS  = -lltpipc
+kill05: LTPLDLIBS  = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/mbind/Makefile b/testcases/kernel/syscalls/mbind/Makefile
index 6d571271c..ed7d4375c 100644
--- a/testcases/kernel/syscalls/mbind/Makefile
+++ b/testcases/kernel/syscalls/mbind/Makefile
@@ -3,12 +3,14 @@
 
 top_srcdir		?= ../../../..
 
+LTPLIBS=ltpnuma
+
 include $(top_srcdir)/include/mk/testcases.mk
 
 CPPFLAGS		+= -I$(abs_srcdir)/../utils/
 
-LDLIBS  += $(NUMA_LIBS) -lltpnuma
-LDFLAGS += -L$(top_builddir)/libs/libltpnuma
+LDLIBS  += $(NUMA_LIBS)
+LTPLDLIBS = -lltpnuma
 
 include $(top_srcdir)/testcases/kernel/include/lib.mk
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/mremap/Makefile b/testcases/kernel/syscalls/mremap/Makefile
index 7bdf425d2..190b7659d 100644
--- a/testcases/kernel/syscalls/mremap/Makefile
+++ b/testcases/kernel/syscalls/mremap/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpipc
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-mremap04: LDLIBS  += -lltpipc
+mremap04: LTPLDLIBS  = -lltpipc
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/rt_sigtimedwait/Makefile b/testcases/kernel/syscalls/rt_sigtimedwait/Makefile
index 2055e703b..1ae50b32c 100644
--- a/testcases/kernel/syscalls/rt_sigtimedwait/Makefile
+++ b/testcases/kernel/syscalls/rt_sigtimedwait/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpsigwait
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  := -lltpsigwait $(LDLIBS)
+LTPLDLIBS  = -lltpsigwait
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/set_mempolicy/Makefile b/testcases/kernel/syscalls/set_mempolicy/Makefile
index a0b79d6e1..55ac0026f 100644
--- a/testcases/kernel/syscalls/set_mempolicy/Makefile
+++ b/testcases/kernel/syscalls/set_mempolicy/Makefile
@@ -4,6 +4,7 @@ LTPLIBS = ltpnuma
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  += $(NUMA_LIBS) -lltpnuma
+LDLIBS  += $(NUMA_LIBS)
+LTPLDLIBS = -lltpnuma
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/sigtimedwait/Makefile b/testcases/kernel/syscalls/sigtimedwait/Makefile
index 2055e703b..1ae50b32c 100644
--- a/testcases/kernel/syscalls/sigtimedwait/Makefile
+++ b/testcases/kernel/syscalls/sigtimedwait/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpsigwait
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  := -lltpsigwait $(LDLIBS)
+LTPLDLIBS  = -lltpsigwait
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/sigwait/Makefile b/testcases/kernel/syscalls/sigwait/Makefile
index 2055e703b..1ae50b32c 100644
--- a/testcases/kernel/syscalls/sigwait/Makefile
+++ b/testcases/kernel/syscalls/sigwait/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpsigwait
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  := -lltpsigwait $(LDLIBS)
+LTPLDLIBS  = -lltpsigwait
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
diff --git a/testcases/kernel/syscalls/sigwaitinfo/Makefile b/testcases/kernel/syscalls/sigwaitinfo/Makefile
index 2055e703b..1ae50b32c 100644
--- a/testcases/kernel/syscalls/sigwaitinfo/Makefile
+++ b/testcases/kernel/syscalls/sigwaitinfo/Makefile
@@ -7,6 +7,6 @@ LTPLIBS = ltpsigwait
 
 include $(top_srcdir)/include/mk/testcases.mk
 
-LDLIBS  := -lltpsigwait $(LDLIBS)
+LTPLDLIBS  = -lltpsigwait
 
 include $(top_srcdir)/include/mk/generic_leaf_target.mk
-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
